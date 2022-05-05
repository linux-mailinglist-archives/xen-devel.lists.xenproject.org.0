Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8615D51BAC2
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 10:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321836.542981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmX16-0001qF-EM; Thu, 05 May 2022 08:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321836.542981; Thu, 05 May 2022 08:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmX16-0001oF-AC; Thu, 05 May 2022 08:39:20 +0000
Received: by outflank-mailman (input) for mailman id 321836;
 Thu, 05 May 2022 08:39:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmX14-0001iA-Bo
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 08:39:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8339c38-cc4e-11ec-a406-831a346695d4;
 Thu, 05 May 2022 10:39:16 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 04:39:13 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 08:39:09 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 08:39:08 +0000
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
X-Inumbo-ID: d8339c38-cc4e-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651739956;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BK9mmxVQ4pn+oequ2EaGjPX6vPeHDJGwA5Ymeou+vHQ=;
  b=g1I/vE0575OX83vmMBXcHQh1aqVrcwoeX7/eQLrBsqcH8qr9eF6wQPdX
   P17uBOuAnQ2miZ/Kz7VKGIQxTW4Ed40+YUk+/HMkn/P2HkSC+gdMS//Bx
   +vnf1hNKMO5BJAina41lOn0gOfzxFtNyZxcg6t812RNP1Oyj9QVZNXmsM
   0=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 70648996
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:T1GwnKMaXD+pFrzvrR3RlsFynXyQoLVcMsEvi/4bfWQNrUom0GAOn
 zBNC22Ab/mNYDP3KtFwatixoB4F65/TzoBjTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2tMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 eVN7L+LFl0SeayRlvYCVSldFj1aMvgTkFPHCSDXXc276WTjKiKp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HtaaHfWiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iejI2wJ9jp5o4I++0GJkSpaz4T3H4XrQs2XHZsWhkyh8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ1hHWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsg/IHc99ZEul/5ATTzKPRul+dHjJdEG4Hb8E6vsgrQzBsz
 kWOg97iGT1otvuSVG6Z8bCX6zi1PED5MFM/WMPNdiNdi/GLnW35pkinogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:b8iOL60iJLJ1aW8agFY+qQqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60Q5iApIs+MPP+UpgNdNvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.91,200,1647316800"; 
   d="scan'208";a="70648996"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzLajnfe1tOir8zYV2QeSGWvBihSjTca8fw4ZwFTmP0KrheLauq2kROeGDXURgG2o6d8zjXOw7rwOpW5V7tLl145EzjrnziPM7XEG5G4mzIGNsCjQkOr0GfneEmoB67fsQIXfmi8UdRRo/VTcDiFqeQGAXr8FTYNMiPm7ac8Vbi05P2e2YR6adFufm60MUloMfQCD7nOSX69KHiAsU//oK9LYMRJmhrP73OQB70n3NmcWSRIYQFOjwFjNMCn1FKYmFExRRXptbfOAIJhJAVykMZGeXnHQaWOae+Vhgq8PpYAlfQeTidqH7iXd8/byhDqInon55UPydliK99FmQwOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsPBDF3S1NCYyGFfu8Ws9je3Ze4yh0Ma5fIOOJOMJE4=;
 b=Y1zOD48KkJAg/0yb4/TDFcQ3FLv/hK5rkRubY1FZEcDG4kqfXasSRiertLAu73407VIK+Lqg5ICxe9LuwWn4ezc6WYVRi5WujP+sRe4lt9PTNCA7ioRQJ2U65b2rPBLhI9kz1Zm0pMLb1Tv9gTPSy2oQNzv0SGL32x9X4ZiJ4nVUZJ4iXZrDujCZ5HRKysjseJQq/v3m28F+R1ZLcp/DRaeCFbxprWo9JD1Ojfi0vG6wgoRWJvM2b44YQWCubptD07KzTxa4d3J4C+YWPt0wVQnGvuP3KqPyRADqSCZ8SybFND6H6bN+pFAjdQ113qD8DDvBR/jIIzbEvoFJmB65CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsPBDF3S1NCYyGFfu8Ws9je3Ze4yh0Ma5fIOOJOMJE4=;
 b=C+vGTC9maWBX9NAtvbA0edn89vwtgNRiIaVJoNIlp1BfL48WFuot9JJe4Z9GVDUjESu9Vjb3WSYYPlS0jffMIvrEKPdVxWEc2hZht5NLzu070+6Fke5rXwgOdjEoEr5VlFUSR2et/5d0AaFNNaXCwNQPDFXCCx+7LGU0Xq1hWSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 May 2022 10:39:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC] x86/lld: fix symbol map generation
Message-ID: <YnONKdIU7G1gOuPZ@Air-de-Roger>
References: <20220502152020.19768-1-roger.pau@citrix.com>
 <a8313955-98ff-d941-00a4-c5e318761c67@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8313955-98ff-d941-00a4-c5e318761c67@suse.com>
X-ClientProxiedBy: MN2PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:208:23c::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b530dc27-fed8-4982-c7aa-08da2e72b89a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6253:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB62538D6346A8EF0A79EB3A3D8FC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	89V+Up9PIUfpvhc17SNQoi+td19wcH/iO5sdTHogXrX3CtQqzuNY3c6JAfRYF5PlR238K5EzU2MK1fy+kaAIs+jKLC2+8abihsxD5RdsIGQMV689NA+CtQ/PK/q+YVdOiDK5gI1fHhB3Gi98WWBCocPyJW06SKPWycT4S1Wt4pRg7Z6PVsRKe3B6gLEHrSfbT7ndQRSyS+SZW/GZbOqYiMM4v6V+xZH/2iWlOjUJHulFkQPQ1N3NbPLPdEqC8UTL1lPmAXq+6gXtXzXRg/gwvY+K3+CvwuZLR67aR0KpXCte1r79sslsNnuu7bMIU891ADiy/UQ8XyCpEiRdoanjut8tq4+gu0/to+2vlhydkaXdIdy/NKiCLXEAYgYIK7fz6mopa/ri7TRkrz4juEXTcY5pYKq+tIge+d38eyhlteJxZWmToCxjA5FQNYvcbfiJiyiC3rGcQsQ+jR8rSpuop78rpp/wWpFnRC17IHvg9RzhVUHfpotw53KoDd9ciNsj8VGejAg/pOZF2KQqlxK/uhACrv1Nyckq8v2N0WgX5dADUfgNGayhR5tQin/Bgprkg98g/HYNJhFiM7qDav/57KraUQbYl8VHelzJQHPlFY+JG9Ajcb2M9RfyIZzWdhZyh+cHEB4kUfGtdvWo5EALWWBiPqoLy8IjAZAOCd6syajDb1ZTf6L8tFiHqi3jIVr8ufoyWqwkbYHcLuwLl2C98hfA0E8E6uL+leLV9r+MlaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(86362001)(54906003)(38100700002)(82960400001)(6512007)(9686003)(26005)(66556008)(66946007)(4326008)(66476007)(8676002)(83380400001)(6666004)(53546011)(33716001)(186003)(316002)(5660300002)(6506007)(508600001)(8936002)(2906002)(85182001)(6486002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0R6bU5QaElTcEcvMU14dW9ncEpkcm5LbUF6cDRYOEI5VWI4d0p2UWpNM1VU?=
 =?utf-8?B?ZUFwbUNjcVNYeEZsbnBHbjc4SU5heU8xdGtyZW9pVXZ3bjdQNE40WkZKeS9m?=
 =?utf-8?B?RHBLU3pOREtyWGM2QzNSa1VuZEJLZXMwdFBOTDRpa29FdlRTdlhYSkpBVmRE?=
 =?utf-8?B?WjdNY1R3aXg0UE5pRXJrWkxqTnB4dTZkSFk2YTZtOU5RU3htclZ6Y3RlM3ho?=
 =?utf-8?B?MzA2bDJvelI3dmtSL3Z0bE9HK3F1UyszQTR1RmVndXlzdjBFU1RTa1VMUk5x?=
 =?utf-8?B?UlpaTmVZLy9mNndBR3lmazJCZGJndGNvT1NiVHRicVoxVDlwQUwrazhjREZx?=
 =?utf-8?B?dlBVb3laeldBa1IrdWQzZmJRaTJUYnY3eXZMdlhIbFpEQjFnWWVXQUxqQWJj?=
 =?utf-8?B?bVhHRlFvUmFva09xcllYRE5iSDN0STdFc3VPbXFkc2c4OWhRTTNmYkxIdUZm?=
 =?utf-8?B?bkRMZXJndUlRaVFrUDBDTGhHQ2NpWnUya3R3TkhyTEFGbXFoNzl3c0cwSit3?=
 =?utf-8?B?WVFOd2ZJU0huR0xaRU4xK29hV3ZQNy9UY3N6QXlIVTZOalJubkRJYkQrbXhW?=
 =?utf-8?B?QVVRYjI0OEFQRkVSRlNFbWNDTDdxMnlpMDkwZzRJTldBM3AweG4xV2NRTGRQ?=
 =?utf-8?B?ZmNCSk9vTzZVYk5pWjNmWVgvVDhpUERzQmMwNFJkdG9LZ1NyNEgzNWpDMnpD?=
 =?utf-8?B?YnRBc2Fwa2xDbVRvZU9tV2xKOXg2dWxWNlA2d2R5dVdvelFITDlIbmx6c2dt?=
 =?utf-8?B?bjQ5T1F3T1l3VStFeStNSDhYYTBmVCsxaldaSVlUbW5yYWVuMFloM1U5Ti80?=
 =?utf-8?B?cFl0alVMUklmODlhOTNReWY1Nld5VUorZEo4REYrVDBwc0xFdzl4a2lzNEgx?=
 =?utf-8?B?MS80cDNVc0hIU1pLWUtkajhOWllEazk4OHlRcGMvSk5MZFQ1SFJ5THgwdW5W?=
 =?utf-8?B?R1h5ZGNxRmg2bUxmV2I5KzV0cm9wdmpLcm5FSGErN0dRTjZwSC9JckdnNTRH?=
 =?utf-8?B?b0RFQnJ1QUo3NmNtdHUwSnV1N1luWUZUNGxhdTVYNUk0VEp5aEJWdmkwNDlE?=
 =?utf-8?B?dm1CWm53WXJGNjFRL0liUThnbWgzdTFmQnZyTk85ZFpRYUJ6R0cxTThDL0Jv?=
 =?utf-8?B?bU85d05uUFdFRURjMWJTZmxQNG5reWxKVWI0dzlGOXJUL0FTMXJCa3pzQzlo?=
 =?utf-8?B?S29IbVlqc285aTR5V3l2TlNmd1ExTzM3NkVkTzlkbUI3VXNZWnhXaEVzeHlX?=
 =?utf-8?B?Q1pvbUMyeHFGL3BieDNPRW9XT01Id3ZBZ2JIaWlaNmN0Q2M1OW5YT0ZoL29R?=
 =?utf-8?B?djIyL3ZiVjA5RS9UUGVpMG05dnlhRDdqWHRzcy9nUTB6MXdvRC8ySVNHNitG?=
 =?utf-8?B?YXJhWmhSMFNyM0g4U3dPc3M5ZGVoL05NUmsvelNsalc5Zk96K0lZeWljczY2?=
 =?utf-8?B?bUh5a0srRnlZU0Q3dERjcE5CSkR1MHBzbEMveDRhOXN6UUR6eGZtSG81eWtj?=
 =?utf-8?B?QXdINGsyQkp3ZlhkQjY1U0JOcnVIRTBvOXFBZUdrcXl0WVpIOThwbjEzb0N5?=
 =?utf-8?B?ZGNpVjVnbndNcjRXa3lEblRxNXBhaktadStRaFZubFp4UThOa0wzbVBEd0w2?=
 =?utf-8?B?cGhHMVRtaWNxeEFOckhSQzJVNVBYZVdOdjJlT0RLdTlWaHhuazQyR2lRSW1o?=
 =?utf-8?B?YXdZMHRvUzRQeGxWQjRlTUpIRlFESEZaQnhtMTFUKzM5WnhsdFlWNnBEOXIx?=
 =?utf-8?B?NmZLMk81dTRXS0ZrVlR1VTJiWDBmYnFHbUFrVkg3YlJBMHBxcWIvOFYza0NN?=
 =?utf-8?B?cEFqYjVWZG9nOFJuZVZLMit3ZlhsYUVtS2swUU5sS0NtTUlHSjFoNmNOWHRj?=
 =?utf-8?B?SCtpNGRlOVZpQTMvdlBXOXY0U3g5MUNYTDFkR0xieFFqTXBXWkRxZHdMTitX?=
 =?utf-8?B?ekNzODhRTEIzZ2FpMlpxcENoOWxja1NaUlVTL3UvdUZMZ2lPamFwNWRwQ0Rm?=
 =?utf-8?B?cjZVYXBGUS9rOWRvOGwyK0hicVFjUGR3ZWZZUHJOZDJDY1ZTeERTSVpHTE9E?=
 =?utf-8?B?aklrdy9CcnFKd081TjM2Ni81dExqNWFiSkNnZlJRcmZ2aDhZaDJ5QXhKTVRk?=
 =?utf-8?B?THZPMjlzMzNpVzhMTTZWOXlvai9scmk3WG5TUTJCYmh6bXpWRTBaS0s5cG8w?=
 =?utf-8?B?c0xJSi9zbVgxd0ZXeWlsQ2d5RS9jVW04OVpXN2RpT0hwbWNEVjdlTTBvWW83?=
 =?utf-8?B?SUtVbGhsVTdOOHlOSXJZWUczai9TdEdmamZwWExrdExwYUNBVHZpZ0VNME8v?=
 =?utf-8?B?SGQzQS9UUTBxNG1ucHd1U3MvOHFlS1R2OWNkRzJnbmFjSXFNNVNXSVgxVCts?=
 =?utf-8?Q?RO0XzYThXkZCWICw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b530dc27-fed8-4982-c7aa-08da2e72b89a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 08:39:08.8552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVa3CLYSo8tBBdJjhr37/RR8wp6QIcC2HzAPgBmDIWxy6DAStXzDmkSN6YK2ftCnwTIsPb8EudGDrXE5439MGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6253

On Tue, May 03, 2022 at 10:17:44AM +0200, Jan Beulich wrote:
> On 02.05.2022 17:20, Roger Pau Monne wrote:
> > The symbol map generation (and thus the debug info attached to Xen) is
> > partially broken when using LLVM LD.  That's due to LLD converting
> > almost all symbols from global to local in the last linking step, and
> 
> I'm puzzled by "almost" - is there a pattern of which ones aren't
> converted?
> 
> Also "last linking step" is ambiguous, as we link three binaries and
> aiui the issue is present on every of these passes. May I suggest
> "... when linking actual executables" or (still somewhat ambiguous)
> "... when linking final binaries"?
> 
> > thus confusing tools/symbols into adding a file prefix to all text
> > symbols, the results looks like:
> > 
> > Xen call trace:
> >    [<ffff82d040449fe8>] R xxhash64.c#__start_xen+0x3938/0x39c0
> >    [<ffff82d040203734>] F __high_start+0x94/0xa0
> > 
> > In order to workaround this create a list of global symbols prior to
> > the linking step, and use objcopy to convert the symbols in the final
> > binary back to global before processing with tools/symbols.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I haven't found a way to prevent LLD from converting the symbols, so
> > I've come up with this rather crappy workaround.
> 
> Perhaps a map file (like we use for shared libraries in tools/) would
> allow doing so? But of course this would want to be machine-generated,
> not manually maintained.
> 
> Have you gained any insight into _why_ they are doing what they do?

So after raising this in the LLVM LD forum, I was told this behavior
is due to the spec:

"A hidden symbol contained in a relocatable object must be either
removed or converted to STB_LOCAL binding by the link-editor when the
relocatable object is included in an executable file or shared
object."

Then I did some search myself and found that you raised the same with
GNU ld not doing the conversion:

https://sourceware.org/bugzilla/show_bug.cgi?id=12374

So it seems LLVM LD goes a bit further than GNU ld and also changes
the binding of symbols in the .symtab.  I'm not sure I would consider
the behavior of either linkers wrong.

As a test I've attempted to disable the hidden visibility setting we
set in compiler.h, just to realize that parts of our code do rely on
having hidden visibility.  That's the bug and alternative constructs
that use the "i" asm constrain with function pointers.  That's only
possible in the absence of a GOT or PLT table:

https://godbolt.org/z/jK3bq4fhe

So I think the way to fix this would be to set the visibility to
protected instead of hidden, and then to also make the setting of the
visibility unconditional: the compiler not supporting -fvisibility and
Xen not setting it will just lead to compiler errors further on during
the build process.

Thanks, Roger.

