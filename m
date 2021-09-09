Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FAC40482E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182920.330778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGs8-00010k-74; Thu, 09 Sep 2021 10:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182920.330778; Thu, 09 Sep 2021 10:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGs8-0000yG-3t; Thu, 09 Sep 2021 10:01:32 +0000
Received: by outflank-mailman (input) for mailman id 182920;
 Thu, 09 Sep 2021 10:01:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOGs7-0000yA-F4
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:01:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e74bfcc2-1154-11ec-b1aa-12813bfff9fa;
 Thu, 09 Sep 2021 10:01:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-kRlQmk3wNVuaEPf7USvpug-1; Thu, 09 Sep 2021 12:01:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 9 Sep
 2021 10:01:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 10:01:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Thu, 9 Sep 2021 10:01:26 +0000
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
X-Inumbo-ID: e74bfcc2-1154-11ec-b1aa-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631181689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSAsmsVfmUcG0j3XC3o6a3VVs7ZK9vGA25F0VptQlvU=;
	b=M/GvZqUk7c638XcKEJXz5B5PWBUXYuUuOcSGvUVmuZmqTszlnFh8FDPsHBTAaRy3LkOb50
	m0nnY2gosPo0QCx6dDXpXUuy7kMXSVZL6pm8GHsLAiLdddwgjuo+r4r+rmV6sTBCd/a+oe
	/6K2V3J6Rb9vWuj/lAmU87L88hLf2W0=
X-MC-Unique: kRlQmk3wNVuaEPf7USvpug-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsYKgVtf4ixVXA2JbqV5OZmGWPy5+i5h/rd5AMk94N/qq1tXaIcsZXRmIPEwoGmKy0qFlvWzMJNmqtU3CahEKuzO6pBi8zTS2HpHoCYJyBN3lrcQAlVhQpm+gTFe6t0JnpPEyvNFGRRixOltTXDUOIGFabhLVigLtKv5ruTPI2svkEEozEkJwaul0UPY6TbPxbVZYspOMo/O8C0d8Y9kFQ+6DGYbzeMLddsZFOcK7+ufnTEXLjZxTwvyAMIcEvCusD6/gm95kthSK0fjISF+Y3AbUmS+OS+A5wYDVJ4Wh4pFICAE4+MP8Qg+u2sQDLuTQMG98rmSKBMWyZUl7NPedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lSAsmsVfmUcG0j3XC3o6a3VVs7ZK9vGA25F0VptQlvU=;
 b=OHf2GlMmy1PAvGoCWhn95DyRh4wB46jSLHGyfRHhZqJlDroVzBJs2l2aQIvL8uWs656F6dQ9xhc8pKZfvXbRE2OZhPMgnqnRgwjC81TDMMBfyM0URZ4TnnFCNZP/TyNPeZ2wY5Zs7rlB+LnCg/RN1+tJaFSzjRw4CaDMsly21smCLi6Itjf0QrAi0VbzSvmTffcE4CG5yFvEGwjIHlmM1fmjq0+PuY9AURToKCp8lewumdelRb8GUYNbP8RDJLeRKJBmEwZOBiahJozjcSU4j7xK3OpvPpgyR42XihTqKQOaMaF6+6LuTeCg0OWRNfZ11/MuHdl/VnpGKuRK3QaIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-4.13-testing bisection] complete build-amd64
To: Ian Jackson <iwj@xenproject.org>
References: <E1mOGjd-0004AY-0t@osstest.test-lab.xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3664ec4-dcc3-f7ed-9701-f08d291efd37@suse.com>
Date: Thu, 9 Sep 2021 12:01:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <E1mOGjd-0004AY-0t@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a5632c3-c9a1-4bbd-e3e0-08d97378c9a7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532755103CF27F5EBA44FC88B3D59@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y1e25GdvlL/2NzyznSWDoD/FKNK3ElWC5FjaEy1MkC39eSmAQXNeVails8v88TCGxW+f8XJY1DLcWMZPo7I070qn+wu2D3rjOm6yKKVxKJC5KLRblRhdRvRmOeQArT7WbMQ0T64Surd9lbYeRhQ6LZQXOLys7PTrsWE2VW5UiZX5q0v4sPGomZBgBRPGTd4UBXcKd6rvmLxRrabEzkIPEWaoksce5UaoFO4C3Kh0Bx6yV7KDaLu4yqBa9EoF9yy/jQsm8QkUMr31mpl/yGjQ7CQ1f+K8eiRMLT8D0u9kj6ExL3Wv2rfI48ExeieFUQ+ROMwA743yR7+3I2W70FcEs5BdGyRZqJK66j1UsuUyMHI2AEPP2gTpsGaEkdKSpGqdMlQGapwxB+n1nQv2gwLMsCpjXOprWVx3PPfHJRiIIaHWiFWgZAtDtuUTaC5+yC1Pt9egd9ccxja7OaGKkCrxon0Zhcw7R1Jl4AHhitOZyW4OuJWwigZ4KUE57xcT7TKXTfWNMjQi+LOwuBooDidP0v/0tBsdmV7zLapFK9qpKfRZJhEL/EpehTZc50M8qMwCkPzVAjwrwDuXyCuNReShPQreOY3Pc8nrRTzwBQuPsW2LoImj6VWCFDcx+TDLHISOVp07j6JP5jc1DGuC6WvM/XaOjvuwI29cM0urr9e7xk4HTF4Yh6KBhyUHbsmMBEiezDeSNHxjaX8yj7x7WSD9T77FSS82Zn4ebtwR8iJmg9sDm3z4KEb/7srKjXsqsrF7YFmwAUKCWMGZTD8T/stBlO07p1JEJX3ImzE+pe0oAKR2oQzhHMvwPH/oBRmAggE6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(136003)(366004)(396003)(36756003)(8936002)(2906002)(956004)(83380400001)(38100700002)(2616005)(31696002)(66556008)(66946007)(186003)(66476007)(478600001)(26005)(86362001)(4326008)(966005)(316002)(6916009)(53546011)(8676002)(6486002)(31686004)(5660300002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elF6RVgvajJmaVpsN0dTRGdPNm1sQnNoeG90cDhMeGxPd0hpMFhyVmtDVWFL?=
 =?utf-8?B?NVdHRlU5cTRqQmlCdnlrRGREbzBtVllHMU96d1pNN2QxQUJsQURFVitxcklF?=
 =?utf-8?B?Ny8xb1hxd0MzWHRUSllsN1lIWEV5anZyc1o5ajd4MEszaW9EMU1iWno3a3RP?=
 =?utf-8?B?RFdZMmgyZ3p5V1ZNd1U0RFNRaW44S2FWSkV6dVlVeDZTS1J2UWovWExYYk1y?=
 =?utf-8?B?cWxRUUNFTFhrV3l5Y25FdXJxczJjbytKdnJqdEk0OC8vZTZidzZZMUxpMnJN?=
 =?utf-8?B?UzhFZW1zdWFRTHlQU1Q2bVBabUVKNGFNT3JFUG5GdG9JcVpzRnVpVWRHdU0y?=
 =?utf-8?B?Z1VzT3JZSGVYQVgwUkxBZ1ovNm05cXpmbllHUUJuMlgwOXc2b0JIRXFQa1Rz?=
 =?utf-8?B?eDY2RmtxcXhmaFBLSlhKaE9ta004MkNKV3h1ZENnMnoralZ4cklTYUZOc2lJ?=
 =?utf-8?B?cHpNQWJwVHBKZjJrRzhZSXF5TlZ1dnV1Q05nVUNUZGR6SWY0WGFNZ2xSUDN3?=
 =?utf-8?B?TWZCa00vQ1ZtQ3FCdDQxZGEwbDZjMDZyc0h3eEtMRzNxLzNxcUtyR3dGZ2NH?=
 =?utf-8?B?MjU2ODluZ05seGhFQmwxUTZCUzllRGxpVTIwcUl3bHZHSlE2dFZTQXlsb1dh?=
 =?utf-8?B?bTRRSFJSQlptdGY4TWxGUitPeFJYN0FWNXpNdlE0ekREdkNzNEEzY0tMbEV0?=
 =?utf-8?B?R3JPSURMRUxXWWxZU3ZxZGlISkpiUlBTUUllS1R4cVRvc0k1QW9Rc09XZnVQ?=
 =?utf-8?B?NnVkVkM5WDRRQWxnMTJMYnptM3dJWnRwLzNXdXBKK2lhMEtuaHJRY1BiU2N5?=
 =?utf-8?B?a0VxMUNsWjh5TlRaM1I3bkg1cnJOSzY3cW8zVGpocFI4aG5zWWE3TlZZbWtr?=
 =?utf-8?B?K0VkSUo1WjNHZmgvVERpVUkvV3lnNk42dWcrSWFjT2JOanEwc1Z2TkRqVTN1?=
 =?utf-8?B?Ujk0SkNNK0c0amdGU29pMGx4dnNaVElBTDNIQUhXOW9OR1ZwNHlwaEZVb0RO?=
 =?utf-8?B?TnVzSWJvemJCUTdxQjhBbzl4WGVTaklZaWRIazVDVGpyQlNxeEJpNnlkdlB0?=
 =?utf-8?B?TDFYMUc5cXJ5ZkRkOFZEMWJtZWxXZ21JdWF6UWxhZERqQU85MllrS3NUSTMr?=
 =?utf-8?B?VGZ6Tkp2YjJKQnp0ZVd3bjBGcEZrK3k5M3NTbVlXQ09tdFlwelZtQXpaQzlP?=
 =?utf-8?B?bzRTZWtBWk5IQXRHVGsrbEM0dmhrS0xGTTg0M2NnL3Y4RUUzaldRSWJ1WWoy?=
 =?utf-8?B?a3FMS05NQ2ZQd2V0T25lMmNjMTlHck0wY2V3b1VqWmgzLzFDVmhpdHhWYXJH?=
 =?utf-8?B?NG1HV2NqZVlRUFJXRTJpYnB0NlFYN3UxdGEyNjNaTTdobndzb05EWVZmNStR?=
 =?utf-8?B?ZnBjMW9qTW9yamYzalhvcHJQMVR6aFF1aHVzcDJDYXc2ZXp4b05yTStwc3pO?=
 =?utf-8?B?dTk5emhML2FDWDdBUFNuN3RWOWF6SXFESE1qdmI3ZjhGNjVpcmM3MFNCVVRX?=
 =?utf-8?B?Q2xNckhRQlZPNkx5UVFkYmY3REhkRGtEcUpIYU5udVBqUTU0UCt2TzNyQTNM?=
 =?utf-8?B?cHkyZmI4Q0JIYWdpdHAvZFA0QnJJWVg0blBRVGo0NVpJL05aSmhJZVdiZWFM?=
 =?utf-8?B?Ym9YazJveU0yWkQ5T290cjByRC8rMHFaMGJvOFRyMXBZaExha1Z5R2plcFl3?=
 =?utf-8?B?THZMMHdJZmJxekFyWEEvSy80dnB6K05tTzJrcXVZVGN4dlVhY05DSFZ1V2ZO?=
 =?utf-8?Q?oFAMQkTULC8oOg8C+6SqeUXqheKSEfpDThXth2Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5632c3-c9a1-4bbd-e3e0-08d97378c9a7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 10:01:26.8127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nXWb2FLqmGCu4bGur8qu1AroFGLKTiDpJvo1oeL3mL6J6JFngM222CKDvS8YhVqGVtR6j+ZmvwIphnXACAG6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

Ian,

On 09.09.2021 11:52, osstest service owner wrote:
> branch xen-4.13-testing
> xenbranch xen-4.13-testing
> job build-amd64
> testid xen-build
> 
> Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
>   Bug introduced:  9f3eda177a4b2d4a33ff1b0307cad42906396562
>   Bug not present: 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164910/
> 
> 
>   commit 9f3eda177a4b2d4a33ff1b0307cad42906396562
>   Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
>   Date:   Tue Aug 31 09:29:48 2021 +0800
>   
>       OvmfPkg/OvmfXen: add QemuKernelLoaderFsDxe
>       
>       Without QemuKernelLoaderFsDxe, QemuLoadKernelImage() couldn't download
>       the kernel, initrd, and kernel command line from QEMU's fw_cfg.
>       
>       Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3574
>       Signed-off-by: Gary Lin <gary.lin@hpe.com>
>       Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>       Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
>       Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>       Tested-by: Jim Fehlig <jfehlig@suse.com>

I'm really curious as to how this could have been identified as the
culprit, when the build issue was a plain hypervisor side one (which
Andrew did supply a fix for yesterday).

Jan


