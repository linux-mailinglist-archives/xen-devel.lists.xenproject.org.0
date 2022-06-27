Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2219B55B81D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356262.584379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ivF-0003mH-1w; Mon, 27 Jun 2022 07:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356262.584379; Mon, 27 Jun 2022 07:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ivE-0003kV-V2; Mon, 27 Jun 2022 07:12:36 +0000
Received: by outflank-mailman (input) for mailman id 356262;
 Mon, 27 Jun 2022 07:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5ivD-0003kN-DA
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:12:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84325386-f5e8-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 09:12:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 07:12:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:12:32 +0000
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
X-Inumbo-ID: 84325386-f5e8-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIIWIfAyypZg2U+2pEksFV9mIOeTEEx7OpAGzmDdEDXKCUY3QAlNsukVrAkr+cYJE3Vu2dJxwghC7Tj5H+I1+M+WU8ldX521VYkt0kTqbZNA/SaxhWtzSc/xYne2uyEeFKKdO1Liu775en2h4/j+xbDl4iLfKv5kF6hlmm3YrDyxsNJ+sgH+lOJO5dwlX6DRkg9xFyCOAChzpgb9LWauWaXr4Yifyn3wDP4AkOHyAC9HAO7UK6AseAZK6iONFThsTZYh1KWMSuko8oEivw6Rpv/8i/x9wxbjezKPEhcJFGh++6ivndntCJqFUQINFTHKXnCQt/FZlaB0hDTE+58ESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcZW2e5NNjilZudK7OJVh1EOzJh1lbAIyLkW9aNErik=;
 b=cHCS8ymKe1y34eWp5nOgyIYWMo9Dw6zKPoX1+qCCoEdAQp1SMHWVR+1KIHbC5DhPOF3NtQ+m8Xj8KRHh3vjZyMf+ptvCPxuzHk2/CIcNboVWxLufpfi54VMk8z1y05ZZ+9CEFiYrcSZWujHix4Ff8j60HV1efElusQVi2Hw3KoQ9VOYcoMVyxYB/x51PLho/Dvx/QrVyT1W1IEeMdnhRhO+tNs6N9FmDGQAS49VKoThU+Twq6K9m4FL85Zyca5Sk27dZ7eLIqL5yX0V81iZ1p9HNo7ynLghgIqSkTFR9TojLXUjtllShDiUYga9P62VhXFNkFjuO3Gk5Uw1mTKNcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcZW2e5NNjilZudK7OJVh1EOzJh1lbAIyLkW9aNErik=;
 b=1q7mJcBUVxABN2N0B1wIPyZ0DVtdvI4FGLBN+Sifff2ko4Pgux+UAa92azYbnSDR7XGZmzLsScqCdUMptenEK6eUvGDQ5b6K+aaVZq8JF4XSosZpkgJ/0oZoAdd/+bjQzx4Qz4eadnThcz/sO/Qnxohr1tQ0dzuiY0LaKoSfH4c+mQmluZO+xzOjmjW3aj11dRA6tZEJ5zgFqlUm3qb2uAx1H1f3hBm5Xhb38ygB4FxhbSg/+Jg08+/kfVsDLmNDrLsHsGFx3mtL6uMe7m1ycL8hXz3SGwz5Q4bOm32NdpcQxFjQs4YEZcK1zIOpDkDtZwIDGbVugTGUARRcX3Lz1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8fabc99-f986-2612-dd93-464bf7dc1022@suse.com>
Date: Mon, 27 Jun 2022 09:12:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/5] xen/drivers: iommu: Fix MISRA C 2012 Rule 8.7
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20220626211131.678995-1-burzalodowa@gmail.com>
 <20220626211131.678995-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220626211131.678995-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0206.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f490588-b51b-47a2-a59e-08da580c676a
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V6nBPp+PgnvOdfoz08Rddvf+AyHv4frRBia1+kV6S7f8ydvcAmUDzT1VQIqG987Esu25c1dgTiAyHIvenkx12MydrWYCXaw5eALXRpoDKHxyrt0ifOMFieGscGc6rRrCg0iv/5XGUxwHMztFoeS+DoLzun+B4cMGuS9tb5pAMBsMwjDhYQk9QvAxhXL+jkSS92XFauzHkKx1LkiYx5JEezwS2sWl5ZpzoeHjy+4vWMZjsQleWv4OefChwlPjBRgZ/Rp2cWOdZrRhquzcyDXwPi9JCLRgyXMEVCf4fjJDIzeXCDNvW3OH64yW/tRV0kPhenUEJ7G9hynZ+3/ARBW532gBtoGkOuVtLPYbQnK7oETPK6zO2ZB+Ic8IF6xrwzASQkwXOil0AnfND+P3OjrV42sAI8TNu7KvD2u+SaIlxi++gyCnonGe/svmviqPNZZWihncNEca2Nc+TN6oDelqh0sLK0IDwyXHM70PLHnW2Hirq31lVCAFN7sZBSCZdKpaa9/LTPvs8G6bO/rRnYvxVN5e3PvjsVubZLfnluJebE86cPIb0l1FbgyX07ILoqc75lkuJOqIoTmH5CHV2Y7Emi7ZiRpddaXQUxep+NEL4+9bhfnkdG8rv3qKQ2hc1YKJchcupkEi+8J+vmU4SM/2mv60U6BbUsBPjFajY83sdyDLXuulVIyi55vtWiaGVhstHoLupoVy1KIj9l3vIHTKOppVt5sYF4AXJoeRP/5vblryI6gMeR4c6ntZ82ho4g/tJGZDzHbXPrAnFizcO/sNFGJLMXpQRj7APffX4iYTlueD5i3S7/Ux3bCkaP49LOSWO/mo17Y3qymgPyN753KFiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(136003)(346002)(66476007)(26005)(31696002)(31686004)(83380400001)(316002)(66946007)(54906003)(8676002)(6916009)(6512007)(66556008)(4326008)(4744005)(86362001)(6506007)(38100700002)(2616005)(2906002)(5660300002)(186003)(53546011)(478600001)(36756003)(41300700001)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnpFQTZWRithSlVBQVNpMGNRc1BPTTBXUzZyRnhYTHB1UkI5MXJieWQvcURU?=
 =?utf-8?B?NmVZbE5VQlRuSVNxekZQZFRLTHlCWGJDUDZSZGNqVjdISFcxTWR6T21ONmZx?=
 =?utf-8?B?bFZSYUp3ZE0zWkRiTGhPMml5Yk11eW9KdDc2dEYvK2Vtek1HUzNpUGk5Sm5G?=
 =?utf-8?B?NXI3d0NpVVFQWE1MeHhiLzFHa2trZlFRY0pjV2Y5K3YzRjc0YlBLelEyUW9Q?=
 =?utf-8?B?cjU4Wk9WZS9oa3puQkxBb2M0emd0YmUrZEdFeit2ekJkMEFmdnJla0NMV25T?=
 =?utf-8?B?S1A3NWI2VTJGS3BTTXRzOWNwOURIYm5ucjhGMy9CczMxL3UyU1prZWZDS2Rt?=
 =?utf-8?B?ZWlVWkhQWlVEMjAxQmx5bzNKSXZ6c3EzcDMwQnIzdjB2WE9CNnNMemtqaHYw?=
 =?utf-8?B?aXB3a3dUUWNhd0ZISk5Fd0QyVzQwckk4cndYTVVMMzVUTURqSmd3blJrRWZm?=
 =?utf-8?B?MVBUL1g1U2IwSzJyRDFac0lNNzl3TjgxRHBwMjB0Y01lOEpXU2dhRFI3R01Z?=
 =?utf-8?B?NGJaeHZka040ajhyMUJtcTNHbG4zWE5tOFpnWU16N3pXYmR5Ukhyb0hsVXB6?=
 =?utf-8?B?NUVaMlJZc0NLWkhiUXZmTFI1R2RWRTJFRlQ4TXFGa3BvZkRJRzJDVWdVZkls?=
 =?utf-8?B?Y01sM2haaFh3eEVpM2dCdmMzbDljc2s0eHJIZmJTb1FkUGR4d1RFM2t5eURK?=
 =?utf-8?B?NkNoWDZwaVErbTVHUDFhKzNBMkVBeS9zSmtuVzh5VERldXFTNkZEb20rd29h?=
 =?utf-8?B?U3BmNW5PRE4yTktkZVJZcnJpaURJZUU3Nk1LK05aRGtwTGI4YXp6eWNyMXd0?=
 =?utf-8?B?Y0JoY3dpWjBaL3lyQUNBaGM3T1pteVBGMExmT0J4YU1wS2I3NWppZ3JLN3BX?=
 =?utf-8?B?QWlMQlZZL01YZ0VMK3NObUp2WVhSVEp5VWwyWDNRTkVTbi8vV2h0SHpVajI4?=
 =?utf-8?B?S2phNFRRRjJHRkpHSks1NmZLdlgwYzJxMDRidDRUWmhlMGhRQnhqWWVOQTFY?=
 =?utf-8?B?S05rVG91bUErWUFBUVh6cUVKbkNtVkZ2d2dvOE5rSG1Wak1mR0IxM1VnRVhs?=
 =?utf-8?B?cW9IdisrSlloS09OWmpXckVTdkYyL1M0cUMzQjR1TGw2VXFiZ2MxRXpwSEtv?=
 =?utf-8?B?bkNxTkZlS0QyQlBsMXNKUmpWRTlDa2hlNDNsdzFFUlBvKzRlZEFlZzZRNnNO?=
 =?utf-8?B?U0cyUC9LOGtIcjhxZjd6aVExLzNsY0VjNTM2OHZod3lhOEM0amFaTGMwcHIw?=
 =?utf-8?B?SnJCbEdSWUl2RnpoQzBVcDZBdzR4dCtMRkVjd3hUeHE4TGlLOUl0NVMrOGpY?=
 =?utf-8?B?VU5MK2g5alNrcGJON3c2c0ZOV2RNZVVxOGh0NXNxc2pHN2tPZzJTYUJ4Y284?=
 =?utf-8?B?Mkx1OTZaVlhadnAzZGZJZ1hiRi8xV1JxMWNHVWdCa0kvWll2VWt4NlVBL2Ny?=
 =?utf-8?B?ZDN3Nk9ldFRWVDlWK0U1eFhDN1UvaFhYV2JFSFluRmpINy93MG1rN3pmaVVo?=
 =?utf-8?B?ZGU4MHdkTnFJcEJtVVJDcnF4TTl2d2RBUEhtaGhyVC9MeGV2TWM1YTNWYmtm?=
 =?utf-8?B?bzd5NlpkMStyb3oxRU9hVGZjU3cxc0FBeUE5cUdGdmtTblpaZEpvRkVPaStL?=
 =?utf-8?B?NTlQcVRiN0tPSkdQdmhJQ0krSG1WODFsNHNUQUZHUCthK3M1R1Yyanl2WFpl?=
 =?utf-8?B?TlFwa25zSXdEak1abXF5YytxUmhkVjd0ZE4rVjhWbGdoaSttaUFhc0JpTEhx?=
 =?utf-8?B?cUNvQTZvaS84QnZjdTk0dm1icUhKQVg1U01qUHdvQU1pcFEwaHh5L3lwanhq?=
 =?utf-8?B?SUhVSS9zYTRML2YyMFY2YURaRkV1Y1pTK2pycUsxYTFwUEtKak9TRkQyS1Jv?=
 =?utf-8?B?eTFGaUs2cW4xaWdMUFl3VXpBb0MzM0M3WmxVRW91VlVLZ0U2amN1T0doMmNH?=
 =?utf-8?B?bHpqcEhwRFZISFMxNGRXVHRDWm50dkNSUzFNWEVDN2RMTURXTzJSUFJPS2pS?=
 =?utf-8?B?WVNtcEpyQjl6dk5NSCtvaTRHbmE4TU5QZHBwS0F2cFpTMk4wZmMvWWZQQzZW?=
 =?utf-8?B?Z0FDNmRGclpMK2FwSnk3b1NpdnFmckpwbFNKRU0vbHcvZ1V4d1pWQ2xDU0hV?=
 =?utf-8?Q?N7dU0xgsGhN72K9bDQJ3jAdhD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f490588-b51b-47a2-a59e-08da580c676a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 07:12:32.5646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZEas9fVO6mZWoOtkrz2aguPKTepulG/J5rwfV+dORzr7LstW1wI2ZAMUvH+u49eqk8KRhbfA2EETEhmjyuPAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6578

On 26.06.2022 23:11, Xenia Ragiadakou wrote:
> The variable iommu_crash_disable is referenced only in one translation unit.
> Change its linkage from external to internal by adding the storage-class
> specifier static to its definition.
> 
> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(with the same remark as on patch 2)

