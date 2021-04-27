Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BD536CA7B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 19:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118773.225015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbRge-0007os-O2; Tue, 27 Apr 2021 17:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118773.225015; Tue, 27 Apr 2021 17:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbRge-0007oT-Kd; Tue, 27 Apr 2021 17:39:52 +0000
Received: by outflank-mailman (input) for mailman id 118773;
 Tue, 27 Apr 2021 17:39:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbRgc-0007oO-SN
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 17:39:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cac06641-3a8e-4a2d-a474-1152891fe5b3;
 Tue, 27 Apr 2021 17:39:49 +0000 (UTC)
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
X-Inumbo-ID: cac06641-3a8e-4a2d-a474-1152891fe5b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619545189;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z/nUx5ZYByjQkZLvL9Y3BI6Z9E4Zd0OxgV4WjExZAJM=;
  b=WnqXz7xPizlsIslVsYAyqqt8GXSZOSoR4NdeR2tYDU12QPXHoU0LglGI
   9j8K1yztZEb2aYw8Q076ymxYgs8UOnc9GtcwwPwlvidvd5hnC3v6RFeEp
   jUWyomirgT3BVmUDXhURBrfauWVMECC3xEdXFVvybquLaEc8CyVUdMJEh
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o6SIMkhNQNFbAnx6ADbpi2t/MsuxE3KeB78qjUbMSrjsv5S/NT20q1LKmGRUVRGNRfKwyNOYYw
 VOcofYOlY/3FbhoshOXoUov6gQsdf0ydMY9YVeSlAM/j7uoFw5n7X8OAwz+awzz49kCsoxe6Wm
 tUzRanoS7NFVlb3bFziYP3RxZQiVelfQhU4a7T/6f6tbQ0lZh+3/ddnZZZHj+PvRjyYeFrjT70
 9nxP3785y5KejGuNBxLZ7O3E8S9ISg8EptGQGNfGY1loT9ExG/QMSSBA2NbRnWaZ0MFol31uNK
 Lbo=
X-SBRS: 5.1
X-MesageID: 42354577
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4lFleaDd0CIYcMLlHegdtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VfdMgXE3Kpm2a
 9kGpIUNPTZB1J3lNu/xQG+HcopztXvytHSuc715R5WPGJXQotn6Bp0DRveN0VwShVPC5ZRLu
 vn2uNsoT28dXMLKvmqH3VtZZmPm/TntrLDJSQHCRku9RWUgVqThILSPhCE0n4lIlRy6Jg492
 ytqW3Ez4Wl98q20xrNk1LUhq4m4OfJ7vtmKIiyhtMOKjPq4zzYKLhJf7GZpjg6rKWOxT8R4b
 /xiiwtNchy9H/dF1vdyXSC5yDa3Dkj8HPkw1OD6EGT2PDRfi4wCMZKmOtiA3nkwncgp9113e
 Zq2G+UpvNsfHf9tRn9/NTBWlVWkFO1qxMZ4IsupkFYOLF/VJZh6agkuG9FGpYJGyz3rKo9Fv
 N1Mc3a7PFKNXuHcnHwpABUsZKRd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSqND+/
 /PPs1T5fBzZ/5TSZg4KPYKQMOxBGCIawnLKniuLVPuE7xCHH7RtZjt4vEQ6PuxcJIFiLs+8a
 6xEG9whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+tx3obv5SL33MTCSSVwnnse6ys9vQPHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYkUt78AKhezi/OODrevmv3Qcf7VKraoOy0jQHnDDn
 wKWyW2IM1B60usS2LpmRS5YQKoRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbTtYsqI3e0
 N6KKj9kryyoHS3+Wqg1RQrBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmGecKgRnVMPQGg
 5Hr1Fx8aa6RqbgghwKOpaCCCa3nnETrHWFQ9MggaWF/97iYY59JI0hQrZNGQLCEAFVlQ5mpH
 xYUhINQlbSG1rV+OOYpa1RINuaVtFnxC+3PMZfqBvkxDihjPBqYkFeYhmDfoq8hx00Sz9dm1
 trmpVv/IaoqHKIMmswgOMxLVtWTn+YaYg2QzitbJlIm7ztZQF7RXqLgzvfkB0oZm/27Swp9x
 PcBDCOasfXGUZGp3xU5Lzn9155bQymDjZNQ2E/votnGWvcvHFvleeNe6qoymOULkAP2+cHLV
 j+EHAvCxIrw9C8zxiOnjmeUX0g25U1J+TYZY5TOo37yzeoKIeSk7sBEOIR9JF5NMr2uutOVe
 6EYQeaIHf5DOwusjbl7koNKW1xqHM+l+nv1wCg5G+k3GQnCf6XOU94XdggUqShxnmhQ+zN3I
 RyjNozs+f1OmLtasSewaWSazJYMBvcrWO/UulAk+EfgYsi8L9oW5XLWzrB039KmA8zK8r5j0
 sSSqV26rKpAP4YQ+UCPyZCulY5ntWGK0Um9hHsCuglZFc3kjvVOciK77egk8tcPmSR4A/rfV
 +R/C1W862bA2+N1bsGB7kxJmoTYk4m83hm9P6DcYqVCAjCTZAywHOqdnumNLlaQ+yZHL9VqB
 Bw6dSBhfWWeCr1wxq4h0oNHotet2K8BdqvCweNE/NS+9O0OV6QkrKnifTD/QvfWH++cQAEno
 VLekwbc9RbhjQjhIMx1DKuSqafmDNXr3JOpTd9llDs3YC64GDUWUFeWDep/KlrYQ==
X-IronPort-AV: E=Sophos;i="5.82,255,1613451600"; 
   d="scan'208";a="42354577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPAZtyJlVUTO7DAXboVJL80RS6/yJvbgk6WpJrLlmFqaJa7rnc+zrzu20pPNWEV+yL4xEnH+xSlown+/4ftmyPvFPq6HF32LtxCXZ5FnKiPJlxb318fgpAAd9BdFF1eEeuXZQ+O97hj5TtnbSjVBMfltaSg/b92AsMlW4o7sjww+l7x/QBkY/Lrb4jUrX401Xanc5PbN1ZsOWMzt0qOMjF6C7yLZ8mFZ1/Nq/C2NIZYbdjrhdhAFyIooT7qOi9gtqTzlpUmnKHW3NmggVOFsQpCT1Hg5uSlMMXy/uv9/Vxs4HRITvGCaLP1c2vL7qqR+0bels3DURWbKzgGTmuH2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP2X3wJy5OPcWXes3uQygbAiRP0GWy1p9/edshS9LOc=;
 b=k3luw9ihxQMfb+adWqUpaP9s8pZMACBTLD9LtaFHbUfHddbn7BY3HaO7DHfWhxzxIUYWsyJWUsic9w1NqotDy+yI/5rjiyIUFkUomsSIBZYh8oOa06a+p8MV4nILI/pTBuFRRgq37rYPpLDl5LSj5LoNtp8VrDyuvd/IawVs2Enox94tfKWer4XTwx49bPb1oQ1YuC4ToJKumh+Ih16H2B5AiD0U2dOVNfrR+BSFSt3pWhk4YWpVAqa417fySSRZqnQkV0y8SCPp4YiAturogKiqAihZyeerkiH9VBMdz2mq/DZr6yo+1kct0PNkoXPBS3AryF3MpHpa2cYxRdkaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP2X3wJy5OPcWXes3uQygbAiRP0GWy1p9/edshS9LOc=;
 b=LoJTkCIo9NwKS2OwnDFPBKTXrijaft1kABBZo8Rbie+B/ds/wIapFJEkT7A5YSphTvGmyQCg6pVmwD6vnHDIw4KNXcdZCCIWuAsW/JfSIptlvPsEBUDKraxl7vM89ESHu+Vlb0WDm2/SBqsO/DOFifX7/YxnCsTcnwyg+XgOo4E=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-2-andrew.cooper3@citrix.com>
 <d8bd932d-071a-4a5b-747c-02cbd5e296cd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/hvm: Introduce experimental guest CET support
Message-ID: <86cf1d97-2034-7791-071a-48208b6ba54b@citrix.com>
Date: Tue, 27 Apr 2021 18:39:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d8bd932d-071a-4a5b-747c-02cbd5e296cd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0364.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6f7d3cb-4daa-49f2-fc14-08d909a371ae
X-MS-TrafficTypeDiagnostic: BYAPR03MB3797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3797227E76EDC51B77DB7AB5BA419@BYAPR03MB3797.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jmNkxiRhqo6+DhQ0KTZu8/ePriYflX6ZbJTwh4rDn76ieseZXiOyCzVmiXKhyb4SlkJ0ffss6+zsqyb+IoU+pHorLr+Ams5qCzuqb17yYf82tFJ1bAL0GxMkkAZTpSl+RsdQMjtgmQyRV94uDl1hzGn820GbUZ6RDP72gNJhl/h4sgUMStAsEPf/gKmXtdS7GPipx3u+ady+Q8eoxoVy9XNRHQWqLWuo28dX5XlMaxu68AkrAerpsWxkjMQX2Uo5Cjoo27mcEpLTxkXgCpi3Jk+OWA8l++KNqGy5DWp/f38U/1Y4eSrKSt9TKVo5fMN65EPcdAkqbCfcVJERpA6jyq1sRd6h9U919MpBQrLlypQr0FA26cF8x3JTwJIUXVq3s6cMn6rHftyFz8GytTkltFK5l0huDkIBmThT/evcRJoh2qnbBtK2MLx4YvqSy1r4brfgD6NIIDOv15+RXmQH6gFeaKPr2GteerWw/lQURh9R/Hu2VeTeFWIODOHQ8knUP7QToZMpbOG2lSclB3s8Eema+4oKKAvrjeJh/PKSjHwblUruuOnSCKaAmeKgpPcUJASJsQdAUNY9DaWiyzMQII89x/K2iBy+rXmMOF2YZWo+cDNZbQp6IFFuft7LVpLlayQLlfaFv+kU8c4x81U0CnP3yMfkK7bzAGPWqMivUpwpzb1Dz6YvYKyCsaTTERN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6916009)(31686004)(53546011)(5660300002)(8936002)(36756003)(186003)(16526019)(8676002)(66476007)(2906002)(66946007)(6486002)(31696002)(54906003)(86362001)(16576012)(316002)(83380400001)(6666004)(26005)(38100700002)(478600001)(4326008)(66556008)(956004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UTVuQkc3ajdHVlNRTi9paHdiUEw0U2ZFMEgraThZQlZHUjdHdURVbjBwa3FE?=
 =?utf-8?B?YWZIbUNJeER6NkxjSXZLejJUMnBybHJSV2tpZDJka0tWdkFyNE9GbDZkSEVa?=
 =?utf-8?B?aXZYM1ZwTlBqdWI4QjcwSkIzTytMV1ZHK1JsUGs0Yno4RlFlM3dIb05OZmFN?=
 =?utf-8?B?N0FPdFVpa1lMbm5TazAyVzU1eituUUJMZVFoM2Nua1kzVFJobzJTZ2NoTXor?=
 =?utf-8?B?dUdMS2NvQVdTUVE2b2N0azlRSVBWRGFrRDBwQWR5N1JJY2RMM2tPdVNJMUlB?=
 =?utf-8?B?OTVyV3dPcDZSNGc3UHkwQS94eCtzb2Z4akFiL0RjYkpIT2ZCODY5Tjc1Tkda?=
 =?utf-8?B?UnhJUi9JVkQxb3BvZDZhV1M4V3dYTG01U29SODhhTzh3TUxyYXVoTVNyQ1JY?=
 =?utf-8?B?NzZ4Wm5NZlZSaDRHVE0yT29ldjF2b2lBcXNXTjdVZGF5YnFSTHBnRzltSUtC?=
 =?utf-8?B?ZVp1K1phL0RjcDJPbGVuMTBLNjhxeFlrMmsyZDRxS0k3YU01VFZkVmduTmp3?=
 =?utf-8?B?RHB6UGxUSGVDOHcxamI5ZDYvYnIvYVVrdHFUL1liVUtBMkliVHdwUWFwK2li?=
 =?utf-8?B?aFpocEY5eGYrNGl3UUMwUVhvOFR4SkkwNXNqM012NmI2ZVFuZjVFL1VFWWJJ?=
 =?utf-8?B?TjB6YlVuOTkra0M3aUxBOXdaM3N4U1lFZ2s4cXdCRWkvNUxzb1NLc013ZDFM?=
 =?utf-8?B?YzFUNUhvMkdub0g2TW1aRGJkYzJoUzRHbmt3d0dhT2JsZ1hPRUlQcXNjOTFJ?=
 =?utf-8?B?WXZCZDVYVThERU9kZko4OCtralArVElzM2tQUnNzSXZISDFGZW1NMit2Ymc3?=
 =?utf-8?B?MFhmQXdmdTI2S1I1dDBtMDVKMXVpN1VGaTZOUDBvTnFzWG1wVXd6U3VuSnN3?=
 =?utf-8?B?elNiOG5CbldFbmcwbDV1T04zWC9Pb0xuK3dTVkdYeGJCOElDa2taQnQ0OENa?=
 =?utf-8?B?THF2eCtUVzUvTFprT1VTaHZHV1gvQUdSdm1ZK0VEYmJtanJNTERrNG9mbHR2?=
 =?utf-8?B?dllEU01tWGo4WFJ4NDlFenRjdnRablJlTHJNNWE5YXlrS3ZxNHpoZHdzSkVy?=
 =?utf-8?B?aFNRRm1PUW1TeXgyZktTZ0k3UEtPUWEzRmxUNG9uOXRLdEVnSFp4MkMvOXhv?=
 =?utf-8?B?VjJzNTlnUWEyR2ZTM2dNdFpKU3poT1hoVXFnbmpzYVBsampLRUVTYlFZbFd6?=
 =?utf-8?B?cG5sa0RoSS9uTUw3S0M5cHFJZnJSZ0RaOS9TTGtNTEpLV1FrTUtncjNHQWNp?=
 =?utf-8?B?Ti9FaHBVblV1OFJ3L01sN1U3c2tGR3pPc0RGY0VRQ3ljaXphVzQxUVN2ZE1u?=
 =?utf-8?B?Y3dmeXI3NFVmTGNEU0E4UzhlLy9qdjY0NlZLMUdvMGxuV05NeG9iYVVTV2ZS?=
 =?utf-8?B?aE8ways1RnMzajg0WUpYL2hzeVhvcTJzdXhYaTIvQ2tLMS93Zi9SYWFxVFJS?=
 =?utf-8?B?WldLeUc5NGlpOUZ4RUxFZU8waEdSMCtMOTFOOXlWQ0I5NUlVZnh0YTNXc2tn?=
 =?utf-8?B?RmdwQjViTDF5eE5rQitFcmloV0pmeU8va2d1ZWh6Q1d0RENqRCtRcCs5V3M0?=
 =?utf-8?B?aVBnWjViT0NmbjFVRUdNQW42bnNqY1VHeFpBOG90ck0yZjdPK21pNEZFdEFG?=
 =?utf-8?B?M3VTMzg3VW5wZkYrTkljcHdHRFovTTBWRDZOZEJJSGpRODlZU3Y1aTNpYVov?=
 =?utf-8?B?Wjhpb1dCSHFuZjQzR2h4TVRVUGNTT3hBWExtaitCU3NxTHZsRWJINXFxZklF?=
 =?utf-8?Q?sYvl3bGeeeWrPjKR+PsqO69rDaFOk5tL54QCwV4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f7d3cb-4daa-49f2-fc14-08d909a371ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 17:39:44.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/gVIJ6VjE/8bjWcG/UoEM1i7AgBsVi4+BZyO2zL10xz6LWetHKkoJZOvYbIpmCxwaULmnRhj9btTLJ2/Xzzz1RRrSn4znqJ8KzhozSpW1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3797
X-OriginatorOrg: citrix.com

On 27/04/2021 16:47, Jan Beulich wrote:
> On 26.04.2021 19:54, Andrew Cooper wrote:
>> For now, let VMs opt into using CET by setting cet_ss/ibt in the CPUID
>> policy.  Also extend cr4 handling to permit CR4.CET being set, along wit=
h
>> logic to interlock CR4.CET and CR0.WP.
>>
>> Everything else will malfunction for now, but this will help adding supp=
ort
>> incrementally - there is a lot to do before CET will work properly.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Just one consideration:
>
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -232,7 +232,7 @@ XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mod=
e Instruction Prevention */
>>  XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspa=
ce */
>>  XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable *=
/
>>  XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector B=
yte Manipulation Instrs */
>> -XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
>> +XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*h  CET - Shadow Stacks */
>>  XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
>>  XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
>>  XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplic=
ation Instrs */
>> @@ -267,7 +267,7 @@ XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_=
OPT_CTRL and RNGDS_MITG_DIS.
>>  XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectu=
ral buffers */
>>  XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABO=
RT */
>>  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
>> -XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Track=
ing */
>> +XEN_CPUFEATURE(CET_IBT,       9*32+20) /*h  CET - Indirect Branch Track=
ing */
>>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used=
 by Intel) */
>>  XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
>>  XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush=
. */
> If by the time 4.16 finishes up the various todo items haven't been
> taken care of, should we take note to undo these markings? I would
> have suggested allowing them for debug builds only, but that's kind
> of ugly to achieve in a public header.

TBH, I still don't think this should be a public header.=C2=A0 If I would
have forseen how much of a PITA is it, I would have argued harder
against it.

It is, at best, tools-only (via SYSCTL_get_featureset), and I don't
intend that interface to survive the tools ABI stabilisation=C2=A0 work, as
it has been fully superseded by the cpu_policy interfaces and libx86.


As for the max markings themselves, I'm not sure they ought to be
debug-only.=C2=A0 Its important aspect of making guest support "tech previe=
w"
to ensure the logic works irrespective of CONFIG_DEBUG, and I think it
is entirely fine for an experimental feature to be of status "your VM
will explode if you enable this right now", even if that spills over
into 4.17.

In reality, once we've got {U,S}_CET context switching working at the
Xen level, and {RD,WR}MSR plumbing done, it ought to be safe to people
to turn on an experiment with.=C2=A0 At this point, we're in the position o=
f
"expected to work correctly in a subset of usecases".=C2=A0 I'd ideally lik=
e
to get to this point before 4.16 releases, but that will be very subject
to other work.


All the emulator work is for cases that a VM won't encounter by default
(Task Switch too, as Minix in the Intel Management Engine is the only
known 32-bit CET-SS implementation).

Obviously, we want to get the checklist complete before enabling by
default, but give the complexities in the emulator, I suspect we'll have
a long gap between "believed can be used safely in a subset of cases",
and "believed safe to use in general", and a long list of people happy
to use it in a "doesn't work under introspection yet" state.

~Andrew


