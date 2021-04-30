Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19A636F8E3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 12:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120465.227818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcQrx-0006tk-Bu; Fri, 30 Apr 2021 10:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120465.227818; Fri, 30 Apr 2021 10:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcQrx-0006tL-8X; Fri, 30 Apr 2021 10:59:37 +0000
Received: by outflank-mailman (input) for mailman id 120465;
 Fri, 30 Apr 2021 10:59:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcQrv-0006tF-RX
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 10:59:35 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 193a06ee-6189-44f4-b4b8-6e3d3a130621;
 Fri, 30 Apr 2021 10:59:34 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 193a06ee-6189-44f4-b4b8-6e3d3a130621
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619780374;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AXzp3tkUJBjTwt0yFP0ffSkLGbmXFXGCLMV/jYj6o3E=;
  b=WNdX2qPbxumc+mFIj1HWwKBu+wxtF8xVhonebms+6NpEI5bmU38vEWNG
   wNap+IFzjqHN+yZflK8qM2Y+5UkIYW18BoLNXu1/kfPiFXOtPsOhyA59K
   AP5YMTS3sbxzXWAabe5VjR8iP3CcGCaevy9R+vEdVYHpvSS1JtqssKs2e
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7AFKj4i/n6Vxu/FHm6gMIfmd6pl+SZ6D+IGeQI1aRjxhh8Z9OQYubDjityRu7LPZvyvRdK88o0
 2vW6Cf0oNvoVmJQHHkyIDpTFkhkQHOVlujoVFKdIfhqNauBN4KZn0Hyy7NhgR4+GQRD3/hgvms
 wAThhcaUSSFMbbnU594r92mbxHQKfK9bs4n6Q6Ypf+f/vihFfJyg241F+pgT+r0HmOHMAPcdHB
 wxJkxkKTEEhgGf0PSn7KQhPPBpnE6Yg8kDVgBtH0KjJvG8wbmb8DaZFDhh5FmA1dVXk40evpRk
 86Q=
X-SBRS: 5.1
X-MesageID: 42905070
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WGAf3KyWIxivJNjFO0hLKrPxnu4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnm6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheQysd07o
 0lSaR3DbTLYWRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRC51IxS0RMHf8LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7Le0Utde7FutHNidbaehYAHREq802jijmv5b78HXGjr2sjehlIxqov9n
 WArhzh6syYwouG4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYAbhJdKaFuFkO0YWSwXYs1O
 LBuhIxe/l0gkmhAV2dhTvI903e3C0163nkoGXo8kfLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNkuTgbB1kmlG5pnAvi4co/gdieLATdaNLqsgn9F5Vea1wbB7S0pwtE+
 VlEajnlY9rWG6dBkqp2VVH8ZiHW3Q+GQq+WU4SusCZ+Cg+pgEJ82IogOMYhXsO75Q7Vt1t4P
 nFKL1hkPV0QtYRdr8VPpZPfeKHTkj2BT7cOmObJlrqUIkBJnL2spbypJE4/vujdpAkxIY78a
 6xHm9whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+txQpqD8bKCDC1zBdHke1++b59kPCMzSXP
 i+fLhMBeX4EGfoEYFVmyXjRphpL2UEWsF9gKd6Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGBfpIsFt6V2qR2/YjBDdV2iFQD27wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9ow6FX
 EOZI/Po+eeny2b7GzI52JmNl52FUBO+ojtVHtMuEsvO0PwerAThsWHdQlprTy6Dy46a/mTPB
 9Uplxx967yBYeX3zoeB9WuNX/fqHcPunSQTdM5lreY7cnoPrM0Z6xWGZBZJEHuLVhYiAxqoG
 BMZEsvXUnEDA7jjq2jkdgzH+HQd951hS+xOs5KoXfjtUGRzPtfBEczbnqLa4q6kAwuTz1bih
 la6KkEmoeNnj6pNC8CmugiCUZNb26WGbpCKwyAaOxv6/bWUTA1aV3PqS2Rihk1dGav00kJnG
 TuIReZfuzxDkNHtmpV1bvr911IZnyQFngAGExSgMlYLyDrq3xz2eiEau6I32ydZkAr78sdPD
 vGCAFiaD9G9pSS7lq4iTyCHXIpytESJeTbFq0kaKyW8GiqMpe0maYPGOJ08J5pOMv1iPICVf
 uSdmauXWrFItJs/zbQimcuOSFypnVhrOjh3wf96nOkmFE4GvjfLT1dNvgmCuDZy1KhYfmG0J
 90141o+cSxN3j8cd6Ax+X8aSVZJhbavG6xSKUJpPlvzNUPnYo2O6Oedz3CkExj9lEZCuzfkU
 sFWqR14LzbIOZUDocvUhMc2mBsrciFKUsgjxf/DeA/d2w8lnOzBaL835P47Z4URnCbrAT+OV
 Oj4zRQ0vfMUSyEz6MbAcsLUBJrQXl5zHRp5+WZcYLMTC2sauFY5VK/W0XNPYN1eeygGb8KqA
 x97MzNt+iLdzDg0ASVmTdgOKpB/yKGRsy1aTj8VdJgwpifOV6WhLGt79P2pDDrSSGjY0BdvL
 Z7TyUrH4x+owhnqpY23Ci0QrH2pUxgs2I220AYqnfdnq684GnaGklaNxb+mZs+Z0gKDkS1
X-IronPort-AV: E=Sophos;i="5.82,262,1613451600"; 
   d="scan'208";a="42905070"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMZZ4tJGHrp2tn42tmyoQ0z1x1q2nNNdcg2oMJLwLdT3ISR2eKAvP0FwzgU7khvibVK4L9/pLkmomnIGMb04KV0XU41h7Rx1i1MtUo6Tzc+Cotg9L3XhLphXxt93fEXwt5EphHuw9uc7zLDtqhYCur8Q6q4r84uW5xQ2suj6khyYOilJwBdYy2/IFXjVlWcFbD3mMiCk7tCGi43kzDg6bjb0j84V6TbLKEhdtPR1DJi+VH/x8ngfyv/+5xcjA++55y4urfh8KB5ab3K/NoZqo3/8e3SdgjG0AfdQVLv6VQMHJ40VwhPhQ+dw5BlJ3ymrbDwHphqD67pX8UWy9Xci7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoxWQ9q1IALd5X4fdnjrdxN1rTLY3djj11Zhcd6qY6M=;
 b=jpQnRaVs2Aa2VGH2xrWVFwDKfdm1X+QEfyCP2c0V+robqn9FgCcq+qOxAt1O92Hu+PXSZm1N7LLm9rSjjc6e81rZobc21zjeNfwA+PlP9YcKW0I3empQg/HtBlUVCRy3oxHnVy3MXovLp91oedp9XU+PXbf9jrQZEB6vKwCyq6a0D3V93qInrzD3s48oDqomPUZTsUhysKLUkq6fmzgv3Mcx6faMRNx6xQBBpjaDyvIcNoSv2Ififm8UKajkXW/BbtGXhcdvjapbeF956bxaJJZimXvd0mxSQgZhDGHG4j+jdtyNkeAbAMBJyGs1EHmAFvmajaOdtMKD9KiwOwV07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoxWQ9q1IALd5X4fdnjrdxN1rTLY3djj11Zhcd6qY6M=;
 b=H36dYQzVr/ANi1uPJfRKd+U7LuOEuaJtDky+BaQ6zHWYmjO9RS1rUh/SEJF4a0eBGy0DDH5oQaHOIxrBGdeclMVQjvt33koy8k0sOFDtClRjiFPXB74vtr98NZHnRuIJdlYnCIk9QMSxug52qk884Y5CFKuQdq3T6kAQphVEfC8=
Date: Fri, 30 Apr 2021 12:59:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v2 12/12] x86/p2m: re-arrange struct p2m_domain
Message-ID: <YIvjDnuY8jSpU+Wq@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <f2db4101-d3fd-1a82-c38c-2efb69504821@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2db4101-d3fd-1a82-c38c-2efb69504821@suse.com>
X-ClientProxiedBy: MR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc838a93-8fe5-4998-d3fb-08d90bc70889
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5542BAE370E24985B4D8F5878F5E9@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nDURschcsi0uubcUivtH9UqxNWBbC/PmDN0H3jaVajQFQKaxTpHIgaJiRFyx57DzLLXgVjR5McGrUm6cO7E5rm4Jo29e/Eky8vyppg/Gxh6jYEStDId75OhVr8YNRurxtnA9BPK523Fi2XTjr+GU9HjnYZGZ+ByeMhQMYtFvefUE8HoZR3RqfltnWF+9DwnCcpfWgUxPvxAYv+fdSaTHdXe24OXZEf28TocqGTqoiS0yG5BvM8J0cc/Tkg9/Re1ybnwj4oSn/6NVNboluMELCUJgFHjjiRX/9XVqLBMyTVorZSv0Vwv6wHx6lAYP/0GIg3wZZVOLuk3sQytKrYyc5xvVxcovNoDcTnsdxNqauex1eBS2xu++D9zMI78VIu+/pC/yEn+FShNiKqmagwiIRMjfhI8Y2HEoNt3TohKniBDJc9CGK3bvzcv1nNzLXbCgeuPuPqBeM93fvEbiQjLhcMwANVFtgnIlZABP3I5lwwZiQVtzNQdXA6iIesWf+f6vdin8v3LdzFqZ2wlOE58XkcOkkGPpMBMu2jAwOUGVKsGfkN7JypJ8Z5OuJtwIT4lEmOn+nTqkjSvQAOAe8/Ja5Mp3rnzV55xqtgTvQo70wJmreeYCvwC8Kmf2bJllEDqZ1VmtMfgo/MWk8qpakclgTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(346002)(376002)(136003)(396003)(956004)(86362001)(6666004)(478600001)(6496006)(4326008)(186003)(5660300002)(107886003)(16526019)(26005)(8936002)(8676002)(54906003)(6486002)(83380400001)(9686003)(38100700002)(66476007)(6916009)(2906002)(85182001)(66946007)(33716001)(4744005)(316002)(66556008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2ptUjBZVGhSck11VDljYUZCankwelArVUM0OEwvT1dFRVIyYjFuK25tM0cv?=
 =?utf-8?B?eW9CTFJSdy9PdzFRSmgzOHo0R1FXOGVoQm1MOHUwakt4enlPVGprN2k1OW5m?=
 =?utf-8?B?QTgyY0t3WjZJNlBXNjByWTZiQVVIZU5xbGxwVzNKSlNibGUwVUhVZVBNQjJt?=
 =?utf-8?B?L0pYTG1XbEJzNExkYm9EdndOekx3YzRzc3pXS29ZbnYwbUphN2hiY1dpN1FH?=
 =?utf-8?B?NTE2SnVZVzdzZHUwVFdUVEg5L0JpZW5RVWlYZzM0WmJKWGFta2trUlFFb3FE?=
 =?utf-8?B?ak9IMnBKNVRsQy85NFBDQUk1VkJtcVFOSTZ0Z2pZeUZXaUN2OTdHSVVKclNj?=
 =?utf-8?B?SVZpQ2tocncrUzlEZ28yT0ZhNkJuZzFCZmYwSS90QVdaVnF5WFVhSGlxNEo4?=
 =?utf-8?B?ZExOWGJhMk9kYUxtWDN6emN2QWxEcUN0bDZOeE1LV2xZcjhPL1A4OU1keno3?=
 =?utf-8?B?Y3BNVUFiS2xhSExyaEJZNXVWcGxMY0YvTFlnb0ZvVXE1K0RaQWZlTWRUaERE?=
 =?utf-8?B?Y0Y4Q1pSZjFmUlI5bHdmWTExUUhoMVZpYlJlOGp2UENjV2NQWTVEb2VPQ0VP?=
 =?utf-8?B?Tkh5WnpNVXdRNkUrcWJ4MTZmVFhLcTd0TEZCaU51RWhoald6dTFtWjN0K2g3?=
 =?utf-8?B?RnpQNGZwdFZNUDUzVm81cmE0WXhNMStJOHlvWUFvbWhyMjU1c0RDUXVqRTM0?=
 =?utf-8?B?KzZ0MWlNdktva0hCVXNEQ1ErVkJhZkQzemlDMFhMV0F1ZHdoSzY2S0lEK21E?=
 =?utf-8?B?Yy9VdXlDSlRYZjBUV2hVcUZMdVBuVW9YREpodTByampaaVhTbFVXdU1LQkVT?=
 =?utf-8?B?MWx5YTRPWmh4b0kzb3JmbEVDbXVCaHdOV01zMnZMekxtMVJlbnRTcG1Mb1M3?=
 =?utf-8?B?REFvcmZjQ1pVWWNGdlE3ckdNQmFDRVNabGFlSW1RWDUzRmNoZDFGb0NvR3do?=
 =?utf-8?B?dEsyS2JDYXJIK1RaSEJEalJOL1laVVJRTXo1Tkg2WWcxUkZYZnY1UzJFZjZj?=
 =?utf-8?B?VTRkczFLSGgvRkQ4RlcyQjYyRFFiRW44WVdjRzRsbkZyc0V1ZzdWYlI0U3gv?=
 =?utf-8?B?T25KZFZnc3VUbUo2ZFR2NEtQY1U0dC81WGVHOVpJd25xZ1g2QUZreDBpL3Vt?=
 =?utf-8?B?cmJkUkdaQTQvR3VGUVM5QkpFRWppZDAwZEdQbEpLVmJISjdEdnJ2dWVVOStN?=
 =?utf-8?B?YWQ1NzArNThaWlRWc1h1RlNJbTRhcHJGUW8xcmw3VTF3OENpOGFqREZEbi92?=
 =?utf-8?B?VjR6Kzk1aGlyWTc1bGVCWVg5SStVd1luQldzaUZ6TTJBYTFZc2tkaEY2SHFj?=
 =?utf-8?B?ajJ5T1pMQkNNRUlmOUlTK1U0bVBvOVUzZGxjUGZKMUREMnVEYlpaWTVvTDRB?=
 =?utf-8?B?YmJVWlp6eXNEYTJPUExYZGpTOUU5TU1mUGxPNllsSFJRZ000eFdPUmpuVExs?=
 =?utf-8?B?ck5RZU4yNmsrZFlMV3Q5UnoxdUJiQlRLblU3a3E2Q2VQdkRTREhxV0VLeEZt?=
 =?utf-8?B?bzV4cHJMQXZtUmFUNHlmU2paTVhMVUNtam9RTFZPL2tqR1FDd3lnc2cyNlNs?=
 =?utf-8?B?eXlBblF4a3R1WnVRM2hSVmc3QWo1SFpQYXpQZDNveXFtb2ZEbGpNc0RlZXQ0?=
 =?utf-8?B?b3E2OENVZmF4UjNoS3UxamQzYUEycHRiUklEYVNHWDZlR0ljVkErSkdlMVhm?=
 =?utf-8?B?aHJFN1l4VTVDS1JNbXZGc1dxT2N4bElhTzVTbGhQcmVuZi90azNpUjNENWYy?=
 =?utf-8?Q?/dUZrpQmG2BpW1i/v3+zs7dCJ7Dd+1KtJgFdkRI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc838a93-8fe5-4998-d3fb-08d90bc70889
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 10:59:32.0040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYYSpZO3LovSPOKdsVLVP7eczw4Uy++UHgEkFKN6kmRJBvX9un5kaulidqWL48IaexyoMnnAbB7nRmXJmj808Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:14:22PM +0200, Jan Beulich wrote:
> Combine two HVM-specific sections in two cases (i.e. going from four of
> them to just two). Make defer_nested_flush bool and HVM-only, moving it
> next to other nested stuff. Move default_access up into a padding hole.
> 
> When moving them anyway, also adjust comment style.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

