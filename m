Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3310F6D5C56
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517705.803443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdIG-0003kS-44; Tue, 04 Apr 2023 09:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517705.803443; Tue, 04 Apr 2023 09:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdIG-0003iL-0g; Tue, 04 Apr 2023 09:49:36 +0000
Received: by outflank-mailman (input) for mailman id 517705;
 Tue, 04 Apr 2023 09:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6be=73=citrix.com=prvs=4510202f8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjdID-0003iF-O8
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:49:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe7579c3-d2cd-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:49:31 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 05:49:24 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5362.namprd03.prod.outlook.com (2603:10b6:a03:220::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 09:49:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Tue, 4 Apr 2023
 09:49:21 +0000
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
X-Inumbo-ID: fe7579c3-d2cd-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601771;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0TK5mmykk1NcKCg1NtRN94tEW99YAhs3/IlP3iOzrg8=;
  b=OZ50fGFJoKvmFdns2jOxop3jP983ZpwYLrHjBTb2ZPwW8cBJaPbSsF/m
   /DhKgyhnYUpvM/BzGgW4rAGZ+8XMsJ00quV3TB7QYxmiY0YqQOO7I54Nd
   I6tj4+AyUileSs62nihI68fiu3Eh97Tzjx8dS1NDE8ZqUtAONT5fsjPdk
   o=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 106670401
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:abX7gqgd5v+uiYSuq6vRI2rvX161RxEKZh0ujC45NGQN5FlHY01je
 htvXDiFPP6ON2TyftAnaN7l8xtVvcPUzdFkHFc9qiwxRCIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQzLTURNT3anNiIg6ORT+lgguVgAsn0adZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluSyWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHulBt1KSOXhnhJsqFShlnc9WDY6bmqcuMPnsFObGM1cA
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4A/IPlqYRq1BbXFI4/T+iyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:QfaZqqybX/sjhG69DjMEKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="106670401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9p2QuxIUIdjPEf8QDeg7FWnVBRGJQ6aGWQakcXLDPEp333o/1J+isxpWifpMwyF/j2BnBvxC0ecSOFQJ6tGEZWQFwjRxgqkYVU8QzffK1k3uoqTYoG/FJNj8GMuou8VCwiNRxeQblWxZCu7DVtzXaArIsVjCJYTQvcLRMJiGFiqQL0HFgVphvfKI3GP+lT4jYR2immaXrABKFFqNkH5GCI1PEK6KkbvYCuIIb/pcOYVjHs93acDUkjQvpsjX7ITLcNyk/dEm9TVI5GtM7FKpWrbPlr0IUxUtWBDqiNXhj8xJ84mc6Aq+lYJ4gFRs4Zq2eLql+zBMlg7PT9jHifxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sg2Fb3jl6e1BDtSDZUlN864Ch3WiFTsjN/pXDxcysgg=;
 b=hYEET9wrBbHsF0a/r/NhJmHJFBg7Bqjej7m2ZSaE/4vE2zujEFe2LxNPPG/dwdWbJAn/zYwPOos2jB8czjLnw3GNWZYep5tu4jsY+4ZX86piv4WwSpUONVLRo/ocn/eGMYomZFvvnKvhWG1eueh/ZEqdUq+kHpB7UOFbnhyqQWLSI88M0uL4gwEF0jl3ypRevLf5p/p5UT/OsbbhHSWPzYd855oWuqvUeMhvK98bX4aHmVnG4Pok9cibT6MH46gTw6Ia8HRz7gAP1cTk7zMnvgzKZgbmqy26uo2VCa006S9uxdtFvO2QtmAZObcjCH0f6H8Fl2OaWyN1yIAJ0y6XOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sg2Fb3jl6e1BDtSDZUlN864Ch3WiFTsjN/pXDxcysgg=;
 b=UWHpsR2HAMa9Dw/hUDvroDZaSXg6XS3rreEApagL9Ol82Ref6sdZVvBr8SarQTAOBSy81UElGIY3xJcaE9xRuVw6hDOyjEkm72ABYORh931gU5l3LgcqZ8dIXcbiDTycH+RgeXzil42W8vr7Aedz0WwcO0KxKuKusX3G2PrNSeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Apr 2023 11:49:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Message-ID: <ZCvymhQClg8bzzwv@Air-de-Roger>
References: <20230403101449.93323-1-roger.pau@citrix.com>
 <0adcb388-d2a9-e43e-ec20-de1df51f33d7@suse.com>
 <ZCrzD7tH5WXARIvF@Air-de-Roger>
 <a247059e-27a8-0569-93af-de03e842e341@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a247059e-27a8-0569-93af-de03e842e341@suse.com>
X-ClientProxiedBy: LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: aab5934b-d4a3-4bf1-35d5-08db34f1dd2a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zIOREiEmSeyBsvlaO7PcQ1/zqlyEN6XArCVekD3PjgoRc4U8z1VEleN/iGKSZ+qdihw/KAHzYJBAR4OAUVRQgZY75mWqOyCk6yoU7FZ5TbTtVAX4XrANHKR48VECbPxUDE+37eGtIfHJSfR6rd/hGVxuY0/DGK/DJxKc1L4FLtvGKg/Lu/UCsq9EqDoAKMGbXc6BqEye+ujjnY+WQViRKJry1yuZ9lzezdYSWva0qj9ZNcjM9WqcVTvj3vJ9JjHCt/NK7MN8BZig3RAvGOy9qP9nqOghkoA/HFPO6ShETl1bjCYfo6mjgP0+Y/n8nzZoUJu+CqEI7MBmJxKkv1LImA4GbOM+BHkMlhaq4ig65pEaKCS2QhdZqfINpOdAFjNt/xmSJJW/EGsgEDNuH98+gbfP+dRHQrwmduhCHclmckNQGhcluG0hyRdBA2jnwahH9FMj+rvpHTXlVLInVt4+ghZoN/dgwSL+pLrqekyC5lFRTPghKUYGQgyimF500FrtGKgO3ZyjypHwecy8VJTr99NHUibqfvr4Wx1LNsnizPcqVcxY/4+Tthw7OQ9+Sp43
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199021)(82960400001)(85182001)(38100700002)(33716001)(86362001)(2906002)(6486002)(9686003)(6506007)(6512007)(26005)(53546011)(6666004)(66946007)(66476007)(66556008)(8676002)(6916009)(4326008)(41300700001)(478600001)(54906003)(5660300002)(8936002)(316002)(83380400001)(66899021)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVppMEFiTDEyekM3UHYwR2xMdXVnMzR0ZkVlU0VlbzBzM0l1MWVhZjdGVmc2?=
 =?utf-8?B?dHdTRGpyRlhGcjVMb1dHSC9GQUZkSmNqOENaZzhVNG1XclFYVHVmM3NvSEhj?=
 =?utf-8?B?VzVJTG0rd3NQR1N6QmJUb0FiZitLaXFBUXc1b29WRkkxbDJyRmNZOVJGQ2tE?=
 =?utf-8?B?dnA5d1V6NWVKN00yRi8yRkl5bFVQM3pld01xb1RqaDhWckZLL2JCK0ZLdW5r?=
 =?utf-8?B?MUIvb0RaVmlISXJBYkFaZ3pGSXlUS1FxNkRGTThRZGZiNzRjcHpsSjFNM01o?=
 =?utf-8?B?cktaMFl1MFlWS2FmUTR1NlcwczV5a1lTQzdERmZkd2pvazU0YnA0QzlobG5h?=
 =?utf-8?B?ZjR6ZjVzek9LOHhUQ0hWT3RTNzhVKzNaT3lCV3hhSlVtNTJGbFhCUnRnNnlF?=
 =?utf-8?B?Vys5RTVEc0g3NnNHZWtLa3lxWTRpeWVyS21ZL0pUTXZJdHcvUzJ2Mk50cjNz?=
 =?utf-8?B?ZldUd2FScWduLzR1dUVEaGlmUGVBdU5VRE5WNDcyMWtET2ZJWWxiQThzaGRl?=
 =?utf-8?B?NHRWWXlTRmJYblV0eE1mUHUyT29MSk9ydEtUWDZXMG1jeThPeGNHMUMxdGg4?=
 =?utf-8?B?L1dmeUQ2ZmF6VE9pV0l4T3RyUGtLeXhJSGtGTVB5OVdBVjg3anFyK3c0QlNq?=
 =?utf-8?B?NEdOQWswUjF2ZzhGd1hKTERMYnRBdHk2Ynd6dXpPMnA0dC9xbWlLZWNZOTdn?=
 =?utf-8?B?ODc0WEF0Q012aWsycEJCVHhlWThuRVM1eitYejlURVUrM3hlT0V6aGtxRXUy?=
 =?utf-8?B?c0srMXBhTmc3NzRNNWFERTh2RkdyWTVlTjdOMExONlZ5eHNvZTdYZWxJRk9C?=
 =?utf-8?B?bTBBT0pqR3l2bE1NMHh3R01BZ0g3aE5Ya1JSMXhocGxnRmMxZHF3TnU4cm9J?=
 =?utf-8?B?cEFpQWUxaEpCQ3RTNm5yaUNHeWtQQklpUXZwU1pZdmpYSDlzR3V0ZWhVbCsx?=
 =?utf-8?B?dS9vL2Z5Z2V0SDludElPVk56WFliNGlxbWZpMytQUERaSjNQdWZXV1BQaWV0?=
 =?utf-8?B?NGpEMlZPcjE3UXpFbW9wbHFWRi9ldnlTM0U0WkVnTWtRQ1YzY2Y3ZVFCM1gv?=
 =?utf-8?B?SDdnUDdiUzRrRWozaCtkV2FxR1VGRWVQZXRVUFVnWW9Ya3Q1ek9pTUIwOUFn?=
 =?utf-8?B?bVJZK3RKTFk1RlZxUjNzajlXbzFhZ0UxTElBMTFocXdYSTJsOEZwNlFhcGVX?=
 =?utf-8?B?QlpzOWpCaVR4SmhXU1lmN2pOdmh3MkpMT3grNk9QTlQ4ZCs1TE80V1dGUlBk?=
 =?utf-8?B?WXRvcnZUV1QrckxjeXljeDFRS0RiK0wzdVVqblpjMW1rZC9EMFNlY3h4T2lW?=
 =?utf-8?B?Y041Qi82NXY3SUNnbHkrOFRMRjcwMEZ1aTJaZjVlYUlkTkljUXBmdm5vRVFF?=
 =?utf-8?B?MCtma0I3MFM1dk52U2hZSC8zVHE5bjZjUTNUUkVEWnppb2w3eVgvNzNVUjNo?=
 =?utf-8?B?VlJXMm10eW9Hc2Q0ODR1UThPTC92TDVXMkRDZGJXM3RaV29ta3JneXF1SlU0?=
 =?utf-8?B?MW1NU29Dcmg0VUtRMGpycCs1czdOTG9OczNYaElRN1pMam1nMXBSaFNVblpS?=
 =?utf-8?B?SnA5U2VSVGkyd1NhR2pHc0puaUZMdWl4aUI3dVA3dFNGNmZrUitQdDFBVVVw?=
 =?utf-8?B?WllJLzkyeVkzeWhnR2xpS1lkQ3dVTVlCU2tKazJhb21OTHdoemd1a01iK0NQ?=
 =?utf-8?B?c1ZPR05VbkpVUGJiN3ZUMGNoUFptQjNnZzlGZlFJWDh1em1tSVBibE40SDdt?=
 =?utf-8?B?V3dMdFVmSENBUElyaWkzNUpOWW1xS2hGOXRwR1ZrUXcrTjdidU1wamNOM05j?=
 =?utf-8?B?NERqVmNqVnFyZ3JYdXdjczF1cjBqbGFSdFpQc2xkcisveXEzb3B6TTR4QmZL?=
 =?utf-8?B?T0RUR2ZyandQQXBmQjFuOFZ2UjI0dlJzNDlOV3drQkRBckdlRnhxS2ZEU3Vt?=
 =?utf-8?B?OUJjWmwwQ0xnQnd5U25jU29Jc05ZbkJRWXhOTndYVWswNWFQTm5qUHdDRjJ4?=
 =?utf-8?B?eWFTRk9qbTViTmZCeGZtM0ZxWXVlOEVIWW81YmV3M2tnYXBJbHdtdWtsdVBp?=
 =?utf-8?B?bjNKWTRONDVWc21TaUgyc1J2TWdiYnBCRU9PYURaZ1Y2c2F1SjB6YnVWckRV?=
 =?utf-8?Q?KM4D5CcpFk9CLne8CWIIUMub9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	usnYVDu0tWEVhKAgrpadeT2pkycxFshUxCyFt8z8juphXTAS7IDlxAB8CcfFGpJPqI/PVknW5XOp9VCmbplWoBDvPr/9/Q5HL5B/3G5f6j0RA7tOB13Men2ahNP98poyZMPR13LA2PvPe/ptbQQrW8q02YsEUD3wRw6s0ybPr5uPFYe1iBSJqj50BpINWdu9y97pBsDHU0sHQEAcBFnCdMNK4XAbDpratBjuzFmNJjVjXiCoDHqawed84gSs2jqosOYEg747FT5uGztLAzDZEA3bOeum3eQrh5EmzJ0UKSrH8TdnlT6ZvVU2hK0niPlwka655cKNg0X4rVDgg5EU0kn3Y1DbSoqG7mCV96dsbz4ey30PELu3P/PNAJXRTrmyTs6kDbn4DvwEHr0JeJdADeWSlhvzUph16yOLXX0/ron9wkAkhsjYW70pU1LE0WcUy6M1TZodvaVnSAiwR4yi7dC+GagfOdL5Np4S08miUJYWOSigzzK5LxzxhnAL7gKAYS329sB0zi8wSpReB/9WELPPXUOeYhXfM1XcmkXeGyMdRZBzyCpT02gckkQhvtEfPIWuXW5GDAnKlyjO+1Yf9XQFen7wviHC6ISJsrPA/TvhsxHuZy4lnkn0rU4rOpCghjJLkkqOmae1PjY5Z0jBLHbqUaPu4R7a9RVgRGOCRGKR/9Rku16ri125FP1xFs/vE599QuEkw10Fw2Z3AR2iANk4cKsRwXiHUYX+KBkoxWYtFCe2BFKRSe3MAOlg+tz+JnnA96IsYW2n6KKcQ+g/erpFRnWr+ML6GFbz4phtJH/+2NQMaiJJT3zrZ13xjTj7
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab5934b-d4a3-4bf1-35d5-08db34f1dd2a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 09:49:20.8879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVllJ6hnUhXNRlMOxiFF95av+DwF6Ty/1p9Gmyymq5DkFKgXbEfJvZkbKUX0ypwyapbi4Ld93pPCcBM2lDei1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5362

On Mon, Apr 03, 2023 at 06:07:26PM +0200, Jan Beulich wrote:
> On 03.04.2023 17:38, Roger Pau Monné wrote:
> > On Mon, Apr 03, 2023 at 05:32:39PM +0200, Jan Beulich wrote:
> >> On 03.04.2023 12:14, Roger Pau Monne wrote:
> >>> Global p2m type recalculations (as triggered by logdirty) can create
> >>> so much contention on the p2m lock that simple guest operations like
> >>> VCPUOP_set_singleshot_timer on guests with a high amount of vCPUs (32)
> >>> will cease to work in a timely manner, up to the point that Linux
> >>> kernel versions that sill use the VCPU_SSHOTTMR_future flag with the
> >>> singleshot timer will cease to work:
> >>>
> >>> [   82.779470] CE: xen increased min_delta_ns to 1000000 nsec
> >>> [   82.793075] CE: Reprogramming failure. Giving up
> >>> [   82.779470] CE: Reprogramming failure. Giving up
> >>> [   82.821864] CE: xen increased min_delta_ns to 506250 nsec
> >>> [   82.821864] CE: xen increased min_delta_ns to 759375 nsec
> >>> [   82.821864] CE: xen increased min_delta_ns to 1000000 nsec
> >>> [   82.821864] CE: Reprogramming failure. Giving up
> >>> [   82.856256] CE: Reprogramming failure. Giving up
> >>> [   84.566279] CE: Reprogramming failure. Giving up
> >>> [   84.649493] Freezing user space processes ...
> >>> [  130.604032] INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
> >>> [  130.604032] Task dump for CPU 14:
> >>> [  130.604032] swapper/14      R  running task        0     0      1 0x00000000
> >>> [  130.604032] Call Trace:
> >>> [  130.604032]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> >>> [  130.604032]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> >>> [  130.604032]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> >>> [  130.604032]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> >>> [  130.604032]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> >>> [  130.604032]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> >>> [  549.654536] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
> >>> [  549.655463] Task dump for CPU 26:
> >>> [  549.655463] swapper/26      R  running task        0     0      1 0x00000000
> >>> [  549.655463] Call Trace:
> >>> [  549.655463]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> >>> [  549.655463]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> >>> [  549.655463]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> >>> [  549.655463]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> >>> [  549.655463]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> >>> [  549.655463]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> >>> [  821.888478] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
> >>> [  821.888596] Task dump for CPU 26:
> >>> [  821.888622] swapper/26      R  running task        0     0      1 0x00000000
> >>> [  821.888677] Call Trace:
> >>> [  821.888712]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> >>> [  821.888771]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> >>> [  821.888818]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> >>> [  821.888865]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> >>> [  821.888917]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> >>> [  821.888966]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> >>>
> >>> This is obviously undesirable.  One way to bodge the issue would be to
> >>> ignore VCPU_SSHOTTMR_future, but that's a deliberate breakage of the
> >>> hypercall ABI.
> >>>
> >>> Instead lower the contention in the lock by doing the recalculation
> >>> with the lock in read mode.  This is safe because only the flags/type
> >>> are changed, there's no PTE mfn change in the AMD recalculation logic.
> >>> The Intel (EPT) case is likely more complicated, as superpage
> >>> splitting for diverging EMT values must be done with the p2m lock in
> >>> taken in write mode.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> I'm unsure whether such modification is fully safe:  I think changing
> >>> the flags/type should be fine: the PTE write is performed using
> >>> safwrite_p2m_entry() which must be atomic (as the guest is still
> >>> running and accessing the page tables).  I'm slightly worried about
> >>> all PTE readers not using atomic accesses to do so (ie: pointer
> >>> returned by p2m_find_entry() should be read atomicallly), and code
> >>> assuming that a gfn type cannot change while holding the p2m lock in
> >>> read mode.
> >>
> >> Coming back to this: Yes, I think reads (at least the ones in do_recalc()
> >> which can now be done in parallel) will need to be tightened if this is a
> >> road we want to follow.
> > 
> > There are likely a lot of reads under the p2m read lock outside of
> > do_recalc() that will ideally need to be switched to use atomic
> > accesses also?
> 
> Possibly, perhaps even likely. I specifically said "at least". But ones
> clearly on write-locked paths could probably be left alone.
> 
> > I'm open to suggestions to other ways to get this sorted.  And that's
> > a guest with 'just' 32 vCPUs, as we go up the contention on the p2m
> > lock during recalcs/misconfigs is going to increase massively.
> 
> I'm afraid I don't have any really good idea, but I'm wondering whether
> trylock with (almost?) immediate exit back to guest might make this any
> better. At least the guest could then take interrupts before the insn
> is retried. Another thought in this direction would be to have a variant
> of trylock which "senses" how contended the lock is, to spin if it's the
> first one to wait, but exit (fail) otherwise.

Using trylock in the recalc path could starve those quite badly, as
readers can acquire the lock concurrently.  Also we would loose the
fairness.

Using trylock on VCPUOP_set_singleshot_timer (in order to fetch the
data from the guest provided pointer) would lead to the same situation
AFAICT, as guests using VCPU_SSHOTTMR_future will likely see the time
expired by the point the hypercall checks it.

One thing that I've noticed is that copy_from_guest for HVM
(__hvm_copy()) takes and releases the p2m lock in read mode at several
points.  It would likely be better if the whole GVA -> MFN translation
was resolved inside of a single read-locked region, as that would
avoid stalls in the middle of the operation, but I don't think this
will solve the issue at hand.

Thanks, Roger.

