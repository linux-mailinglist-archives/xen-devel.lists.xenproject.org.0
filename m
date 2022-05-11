Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2D5234D3
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 15:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326893.549554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomqX-0005J5-Fp; Wed, 11 May 2022 13:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326893.549554; Wed, 11 May 2022 13:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomqX-0005GB-CX; Wed, 11 May 2022 13:57:45 +0000
Received: by outflank-mailman (input) for mailman id 326893;
 Wed, 11 May 2022 13:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nomqV-0005G5-QD
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 13:57:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52d14dd4-d132-11ec-a406-831a346695d4;
 Wed, 11 May 2022 15:57:42 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 09:57:40 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5277.namprd03.prod.outlook.com (2603:10b6:208:1e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 13:57:38 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 13:57:38 +0000
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
X-Inumbo-ID: 52d14dd4-d132-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652277462;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=godTISsZJ8UQ5fdA+tpUXkqm6i0xsRLztdwsxNutTIA=;
  b=XQnNcKs/3kVtk0QWFY0s1lwfk3Rh5h2iTuNfld4xotZq1Tn5Q/ghBoqp
   1vXiMClZprdfeohNyuJSv/wJ3fIyZ+g7UavIM58lvf8k21fPJAhkRgWnR
   eKtPHvzbVeseNzuNj9+osbeWElUW1QXJqY/3/LRIYMLt3w2dPggyn/lD7
   E=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 70942686
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KRjNt6Abolo5TRVW/yXiw5YqxClBgxIJ4kV8jS/XYbTApDMghjBTx
 zQXCG+AOf7YZjH3Kt5xO4W+8h9S65LWnd81QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhJ1
 s1RksOvTD0mM53wivkXDRwHDhFhaPguFL/veRBTsOS15mifKz7J/K8rC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t7B8mbGs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjw1yWlLW0GwL6TjawpzkHs5T1W6pPSG4rzIoKpGJ9EsVnN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1jYfVsRRFasm6QiL4qvS/wudQGMDS1Z8hMcOscY3QXkvy
 QWPltawXTh36uTNEDSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa38716bnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:eLuUgatPHKN6LZMSuqCxxb5X7skC3oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H4BEDyewKlyXcV2/hbAV7MZniChILFFu9fBM7Zslvd8k7Fh6RgPM
 VbAsxD4bTLZDAX4voSojPIdOrIq+PmzEncv5a9854bd3AIV0gP1WZEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue72K7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhSM0llWjoai+quGRiuerN/b8yfT97Q+cyDpAUb4RGoFqegpF5d1Hpmxa1O
 Uk6C1QRfibo0mhA12dkF/I1w780DAo8RbZuCSlaD3Y0IHErXsBerZ8rJMcfR3D50U6utZglK
 pNwmKCrpJSSQjNhSLn+rHzJmdXf2eP0A4feNQo/gtiuEolGc9shJ1a+FkQHIYLHSr85oxiGO
 5yDNvE7PITdV+BdXjWsmRm3dTpBx0Ib1+7a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/e
 zLPqlhibkLRM4LaqB2AvsHXKKMeyXwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvY5AMxItaou
 W1bLqZjx9BR6vDM7zx4HQQyGGzfIyUZ0Wd9uhOo55kp7b7WL3ndSWeVVFGqbrSn8ki
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="scan'208";a="70942686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+HL2+/nFVDqV+O+zBOGkCZCtlmQ5tQ4ufuGq/vPpSjpPycW0X6dfO7UnRC8prFkFV+NzCkgpwTNSNkdwhZBgs1fAPFvMISXnrKwOynpVc/fVo36mzs18h2PYT4fEJh0EOdHWiluIwkdM/9zQ75jjvyWE9NVt86xik8ydUS306vV+Ix9bQGpXQwXQxm/nWGiJ6tTD8Enl+nknUEAt+YSuo2N0xooCy7+p+Xs5JcT2xpFgQ3+gnFNz/YTTwHFlt+EfiJ51bYuXkFMihZ58hYLsaPfUpPO2fuR4oArsbfYVQZ+4gRtto4ZelWsAGjZ/2YcPlJUF4uATi+xc6IR+otNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbuupIGylCmzOrOmQ0KTN4V2PZBDzCPFZ98SU8R4ufo=;
 b=Kq9YaXngpvBV3PkFyasZh7W0EoPuvFAkLm+mvA76cy4Yd1C//qISb1DwR5PodOUbhLVQ0XfOhwBJDAC2qUWn0YQE6SZAa+mcpg8Kq307BWmhdqPgia1xTeoteLuMB+sNxy8zmDgucY8/RLuri837qRRNE9PzJQoct4dZlsyKVXAOSTJu/bP13LrieMOFWVY/BJ//T1iMotQe5oiS0nGQc4bXv/CNlEhn4WQ33nTtuP3XoSYfSatTlhHSXZO11kEaMJnQue0gaRExcy1IxbLH71IggJ147CAp5RUIPJHVi9/LFCUtYIHn3CkiapfQ3wwwm7Q27fY5JJK3Y3xS/R63Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbuupIGylCmzOrOmQ0KTN4V2PZBDzCPFZ98SU8R4ufo=;
 b=ujSd/By7wsZw1zXssF5mkSCoxp7o23qNMnQGPA+eP8Q9hy+sU2+jJ9wBCdVVwJEigbOJURb8ji9kvhFw4a6ZLYtt/e4kPhf4R13hzVPDJXO8CQPs0fXteETFngA6igvayDbC4p0IOKSs8ZACEu4mGgs9UivCHgB9XC+dZzdnGrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 15:57:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 21/21] VT-d: fold dma_pte_clear_one() into its only
 caller
Message-ID: <YnvAzb6Pc2su9KHX@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <4a24a85e-267f-9de5-4009-b32b9ab8aa0d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a24a85e-267f-9de5-4009-b32b9ab8aa0d@suse.com>
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aca4c3f-7bb6-46c6-771c-08da3356352f
X-MS-TrafficTypeDiagnostic: MN2PR03MB5277:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB5277728EDA76E53CEE7682258FC89@MN2PR03MB5277.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HMxZt7mhpPHuscbANnWG/8NwVVsjJF9md9MZCOBFdXjNDdCoXFIbbp2q300UMJOJ45i4RWQTid0ONrIFWS5vwvbqRohhHX9A/EdD0fuHRltGSwBArHGggLeqGATc9Q5ZcEQYHxym9AB+VV1kQDxsF9UylMxfp+Ecdox5hHacWoLo0YaLrugKKuR4D9g+RxFyv7A7DxsIjtxLvLUXEz3d634HLeaRvXYXTFSbjndpty3ktkHLEEJ8Ym6pXboS4ElUEFGsWpxeneI0lFtyVRrom/AK9urzKdN/zoQl2OAISyW57pPLRuI1fSS29TjbE0PkkVHaR41wN6Ple/Diss2vAbsrg3RwRW07VheK5JsgfMEJl8dJA80lhPYAaxlK0PWvYjorYX5Z04DqROsElaUpdgkMwRFW2IO2V/iuBp4g0Yy9sF72QdYNNGyYQwPCEIdVVD+8AV+rmfhlsAM00Cg0fC4GowgVDYoene+kIA/2SsAN2T5dMuIvIzLDu0YJ6kFAIObpahoASj/xiYMJAgnVSypkKdBOw1pAMTIIir2DGGB5bs2d94q+oM/X6yZ1Rf5AqSnjTNcxoaweD0cd7tPpBOcrWeTO/eRD34YtiwaqAeQcr/z/KQsHLXS4Zt1UJtCdnIJ6+DlT5Gx3ZVOv5+NYfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(5660300002)(4744005)(33716001)(85182001)(8936002)(6486002)(8676002)(4326008)(316002)(86362001)(2906002)(66946007)(6916009)(66556008)(54906003)(66476007)(38100700002)(26005)(6506007)(508600001)(6666004)(82960400001)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDh0aWxBOHloK2Y5TzRRN25VRjBtRm9xMDdiSXF5ZVlYMG9Cd1R2ZXFaZ2Nm?=
 =?utf-8?B?UElDMUx5T1BHTkduVHZlT0Z0U05pVElBSGNWclRXRjBUaU9RU3Mvb0YzRTdD?=
 =?utf-8?B?UXROd01TU3ZMT2JpZmM2MG81UU1KVzUrNWdOUEs0MW9hbGdzeVVSd2t2U1B0?=
 =?utf-8?B?TzhmUG1hV1QxQkRFVjNwTTd3WTRSdEpBZ1J3VXcrcTgxcVdIOEdYSGJxZzZs?=
 =?utf-8?B?RnZuUDhUWjd6R1NwaXNuUk5UNkswbzVCd3VVZU5yU2JiU0t0T3NWeUE2OExw?=
 =?utf-8?B?ejdBMXhSVGpjektvd1ZNbTZXRWIxMmhxdlBTS2p4YnJuSlMxYjF5Q3czcmVx?=
 =?utf-8?B?a0JjQXcyYVhENVljV3pRcXNBTitNd1ZvTjBuK1k2Q2g4UTZoYmgxMXpRMWdH?=
 =?utf-8?B?anVxcmdTZm9EOWtTaFZVOUdGNWYweU9mUkNMeWJFVzlKVHYwLy9hNUtzaFVu?=
 =?utf-8?B?Z2RQRFVaSTJTME5wa3JkTEw1YjkwMWRsWHRoOXNuN3R0d1hNSGVWN0Y2Z2Vh?=
 =?utf-8?B?NmlCdUo2WEQ2eW9OV1dIYk9zWnAzdUd4NTAxcTd0aUJhQTVDZVM4R01GR3dK?=
 =?utf-8?B?MWV3VDR6TVh5WnZ5SWlKQTJzK2FRNWsxaFYxTWNMOHdBTmVoWTc3QlVXUERM?=
 =?utf-8?B?YStyek5CT3hGTU10ZHZjK1RCSVd6cHRpeC8yQ2Y3RUJaMDBFaXZPSnNzK2NH?=
 =?utf-8?B?M0NNZXd5TExYOVl6MnJGZ1NwV0hmelpNNTZYWnJiOVpVMDhIK3UvQzVtb2Vh?=
 =?utf-8?B?bCtleDdHaDhRL1h5bkFuRDkwZ1FhVjBLT2YvTkdFMkkyMWk4THFidUdqQnJZ?=
 =?utf-8?B?dlEwbWYzU3lzZlZWcndwQkdNRHhtdFpvTmt0ZjV1K3ZleGgzQ2RGRTNuUDNG?=
 =?utf-8?B?c2hGUkY5ZHNlb3dyM213dWhoK1ZJemtCMjFMeGNDcVNwSk10RUFQbGQwbGRj?=
 =?utf-8?B?eXVpUmdsV1FSbGZkTEN3c3h2SWh1WTBackU0RmgxSFh0eGYyNllnYkQ4eENr?=
 =?utf-8?B?ckVQV2ZucWc3UXdQbW0wTzJVdXZtUlJvQks4TDVueXdYZFRpMUJJVWM1UTg5?=
 =?utf-8?B?dTJScEZDWmsxajBkRkFDVGxOdm5KNlFkdUlGcmpFRDJ4RnVYek94QysrNUNP?=
 =?utf-8?B?NzlobGNWU0EvK2NmekowUEJKalZVQWFOcklxRmw3QTVqbWNaQ2pQSVBSVmsr?=
 =?utf-8?B?NGt3eXpRODR3MlErL3gyb0hzcnJ5ZEw3VlBRZlBsWmx2QUVma3lrVHdMeWUy?=
 =?utf-8?B?K3kySi9RZVpCWlMrRnVoeHEzejk3M3dIS2ozNXQ5Y2tXeDMrTjdTM2lOdHZM?=
 =?utf-8?B?alpqZ0ZhUFkza2daMTZuWlFPaytOUndGalIvREJYMTZsMmVFYVhpRThpc0Vh?=
 =?utf-8?B?UEh5VnpyYkgzZW1tRkp3aVRJVTBtYmlzUld4d2FVUS9FQmNCVlZHaFplVDRL?=
 =?utf-8?B?dVpMRmdmN21JdGkrS0o2NVVpRUNES2ZNK1hZaWU0REZoNmFhNHE3LzdkMXJS?=
 =?utf-8?B?MmsxY0pKREhXdXNmTGhiNlVaVW9YcjdCcmhuZUtuWnJXVS8vamxxL1pGSUhj?=
 =?utf-8?B?U2FhSFlVbXNRNVBWazk2WFNhNjQ3eVBIS2ozWW55c0xjU2F2UlhuVkRuQUJR?=
 =?utf-8?B?MmtBaVM1WkVEdmV6cTltTGIrTVMrMzZHSDk3WUZycmNZZTNwd1ZxL0xhY3hP?=
 =?utf-8?B?T21yc2ZYeUpjdUVteExzQ3dGdyszNGxhUlNyOTdlWU1EdDRISk11SFBTYStE?=
 =?utf-8?B?clJzYXBGOUdXNm1tbWxocnRMUHhja0hOZHpPbHo1cExkY2p5a1J0bVBXVzVG?=
 =?utf-8?B?T0FzRGdDYW5xbjhDcDcyVmRISXBPanI2U2tpTWdsM1ErbnNsdkVCQXJSZ1RX?=
 =?utf-8?B?aXc4M3RWUG1lUVhaMi9pSjlNbWJIVDcyYVlqMEc3Z09hU2pISERVOVhXRzZV?=
 =?utf-8?B?UTlDZ3dGdm5mTndzUHNWcEdvaklaOWtHS0l3a0NaYTRTb0VoZzV0L2Fwd2d3?=
 =?utf-8?B?RWhuR0hURm9LdUwzR2FhY2ZRT1l6SHdTYVFNSXNNc2dUdExIbS83MkZ3T3ZC?=
 =?utf-8?B?SG1tY2JjbG9YSk95VFJsNHRtaGNJQlliRGRPOU1sTEVPMGhHTTRBVFlwSTBC?=
 =?utf-8?B?ZGNjaUxpUGc1Mi9LMWRwME5FNHhNcStLa0dGR3J1ZlNic2NkQnBvTGFrVW5u?=
 =?utf-8?B?REtXTC9obWFKL2lMT0o5Q0lhVWZzMGR0L2IzZ1BhRW1zcVNsdHJySXVZMHVy?=
 =?utf-8?B?Tms0WmVtS1I5bmVqTXJnTDhMSHlxaHRWNjdCVUNzNm1Tejlja2ZmWlhqT2VC?=
 =?utf-8?B?eE4zc3lMdm5ORXlFQlZxMzVuMnFLczErNWE3WnU3SmlqbktZNGErbnQwUUox?=
 =?utf-8?Q?4G/1XJV6sh9yDNf8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aca4c3f-7bb6-46c6-771c-08da3356352f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 13:57:37.9947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMxBaz8YUUxA2EEuqLgSknaphm8+7RUn2VDdGSRiofzak+7CiyCsUaKNVgWCPTMqM9KApJGRr7ijS/ekDdt4Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5277

On Mon, Apr 25, 2022 at 10:45:10AM +0200, Jan Beulich wrote:
> This way intel_iommu_unmap_page() ends up quite a bit more similar to
> intel_iommu_map_page().
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

