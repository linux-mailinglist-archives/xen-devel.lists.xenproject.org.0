Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B873F6C366D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512829.793106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeP8-0005XB-Lq; Tue, 21 Mar 2023 16:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512829.793106; Tue, 21 Mar 2023 16:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeP8-0005Uh-IU; Tue, 21 Mar 2023 16:00:06 +0000
Received: by outflank-mailman (input) for mailman id 512829;
 Tue, 21 Mar 2023 16:00:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1peeP7-0005H4-89
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:00:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f4fe3c2-c801-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 17:00:02 +0100 (CET)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 11:59:59 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB4939.namprd03.prod.outlook.com (2603:10b6:5:1e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:59:52 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:59:52 +0000
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
X-Inumbo-ID: 6f4fe3c2-c801-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679414402;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=a472dS60VC4m2Toa/1TxKoenmpjlK+3a/8atnko3/to=;
  b=Q7eY3Qa98Ivqs4mUKp8Ffrwl22C4ivhOgcg/bOyNlLQI+pClz98kGIJZ
   CtQiX5DH2sTfxAA9JR/2WNR/Qm/By5kV5il40ylREKUEZFDoZg+PAl/Im
   auMfiedrQWYH/y7KkU+ATUMLPf8qWXuEXui6hYWHsyVNztOZ1VVjHn3XE
   o=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 102146307
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l7cQmKtLk9f+eWMoCS86ncmhDOfnVHBfMUV32f8akzHdYApBsoF/q
 tZmKTqAb6veY2TzfY90Otnj9xkO7cDRnIRrTwpkrSE8F3wV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNioEMT7Su/+KkJm1a+pSiP87Bvi0M9ZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60bou9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANhLSOPjrqECbFu79lE6Iy8NSWSCjqOHoUv5Y8JPA
 nUX0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uVSs45SfDkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:y3P2C6knAGQqPRNJiuig2VHJX4XpDfIa3DAbv31ZSRFFG/FwWf
 re+8jzsiWE8Ar5OUtQ4OxoXZPqfZqyz/JICOUqUotKPzOW21dATrsC0WKK+VSJcUDDH4hmpM
 VdmsNFZuEYY2IK6frS0U2VFMsh3cnC0I3Av5a5854Ud2FXgnhbnmJENjo=
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="102146307"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNWFUw5s7ll9wLilSbN0astfBOqKOzi+i8rlras2hAE7oTsNt158mFabZkFGgFLtUK4r784YHWlh/DP3a93QEV/ULKsjPLqMfPRz6V0eIFM3eGX/249SyWjM5S/xSZT3EtHa0Bfk8wxOzAYCPKRp56mloTc0jpTpcvOD5I86GZAoDryTqIH5EfaVQNYVlOMkQ1GXt3jMUPzh0WD/cDr6k6plpDjNFeecm7kLs8K6/YuEyze1lokg6weSqJdp+YQqHgbVtR1S1J9Wdqv7WcA1vx9Hy4l1mcZps/dO9gTEUBTJiZxdh4kN5F7WmP57Nb+BNsrKVVz0gnP33Tz4Xlh2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyS+hGNztbzOeytP96LD6T29LdGdaVn8WQ2qiDVudeU=;
 b=RrHlU/MyIqK5jZWTz7Yk1GByDFKPj7H6YFmIQduzniZvC+Kmypv4WVmcopPTk8Fe0rND0eYwpZClfF9TY82b5qdnQiLeFW67eHJYSzxjnjqaYLoiAdxxXrV64VXL6jUvr27dF9DJizfnQ0/ZKx5DljjmAWOsNvWCvIkRyChk7WmGxSBi43BMKAEJmGfCDXQzVQo9gTXsBvzhWc8o/UkKaGiQ23CSTaKPWOnJrPOdQIRoFNS8DqNFAc0dV90SjZCuty76s5/1kUHiZr+vI6ZoN0NlX83GMuwCyQHW10v7yyXMXpbt7BghOBIPKZzGgtA+GsrcCzMJZKYNuDQoXxYLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyS+hGNztbzOeytP96LD6T29LdGdaVn8WQ2qiDVudeU=;
 b=CsAs403ip5AvGkKpmhzIFpUWJCdO0oQlITK+Pxl38RqHEuGe3mB1WVsJ37HqxFk0rdvV+02yU8/EotZdjkX9RfDvR7YIm/UUi7ciRRM6HDvMzxqDMbiBEjzIIN8Av3/a7kpxJeSh6rUNj8J63Vc5EcMb9wC3pbasyLdMYla/0Lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 16:59:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Message-ID: <ZBnUc5mBYg7QhSBn@Air-de-Roger>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
 <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
 <2c0ff1f3-ee0c-6d14-a51c-d82b65338005@citrix.com>
 <0df22405-bda8-8f4d-63b4-e9c4d57843b1@suse.com>
 <ZBRRbnBjWHXAM1ug@Air-de-Roger>
 <02cc1db2-90e6-a60e-4922-d88b4ca98b45@suse.com>
 <70e49a82-f027-6315-e11d-b2e16bdfdcab@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70e49a82-f027-6315-e11d-b2e16bdfdcab@citrix.com>
X-ClientProxiedBy: LO4P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8dd9f0-9837-4234-e576-08db2a254ea8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0FQL8SEVKJGaX+sHyoAXIsLLTh4NxDx7AhN42p+CsRSrJWNcP0yE5Bx9aqIZcnJjSvFY6dEh+q8nR41EZfbJhJqM0ebw+Tq4OddUWJR0LIuafgGloKyH6Jfm+eJkKzJkAs4ttAzMNA4S+slkGGglVEtq1qTVMRMuaIRm3o4IagafZzfYFg3sdUwSFjHTpAJtWisBX0ri6ENbMiMcRtmj4s4pxcjHku2M8vvydhqljXMPYRFhKSBHrNPrnyJSSqK0XgAoMu69JMggSyDCGt27t5H7Muvj2Y7sygjs3FFMxuZl7qE+7Bxv6iNCP/P09qcNl+GcbEUdL44UB+B9qSXpNT9j6R2rLWvaLPKbfyT1Z1dHLewrFNENk8P6rfsK7JbPQCskjMhlYFJv/ZGBuU2I+WxF62fwFOTcuIqhlEpFyWaFku+GtbrvWLTtgstpyYaYZRy2pV0MbY/k39xK1UMuhcXj6FF0sU9gTVWVlkGcHBP6aDQNr8veMK2tBKhtSHtn+E+xVvVz2c4WnYgdECHUQc+BsmJpW/ic/WW+oSHA7PONoqcp0e3hVHeCGyDaIGzeFxJFvtjeKD5qKmHe95B7UgOsujZAjpu65pTrmI/LwVtCrBUMlobZv1K3Vs/GpSRfachNKXzfxqqQLVw3BgH+Fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199018)(186003)(6486002)(4326008)(83380400001)(6666004)(478600001)(6636002)(66476007)(316002)(8676002)(66946007)(66556008)(53546011)(9686003)(6512007)(6506007)(26005)(54906003)(66899018)(41300700001)(6862004)(8936002)(5660300002)(38100700002)(82960400001)(2906002)(86362001)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b29OamxuOTE5K1p4M1lXZ3UxK1h6R2ZVYnRQT3FFZCt2dk9GMWJXRE9yb0VV?=
 =?utf-8?B?TnNRSUJodFJEOFBkeWhReHRFWFNhcDJuRXJ6djljUUU4alJnOFVLVkJIOFBx?=
 =?utf-8?B?eHVLWjhqdEdUcUJLYUJvZXBRRlR1aVNQM0NuMGhQam02RmdkRUE4WDNHekNi?=
 =?utf-8?B?RS8wQUNEc2JvYWtzd2RKZGVUM0k5azE4eE1UUDNYNzgxRmFSb1ltdHkwWFVy?=
 =?utf-8?B?NGs5aHZqc1lXZUE4eno4c1FuSmJZSGJ6R2F4TlpyMkpKeE9aSC85WDc1OHBq?=
 =?utf-8?B?UHgrSU5vTmFmcE4vc2ZnZ2dtRUwxL3FJRHZWVFU5cHhSZkxVZnRUOENiTktX?=
 =?utf-8?B?cWh5UnhGWGtnNEI3RzdQcWNDdmlJOFQ0dHBvTHF0bktEellwUWw5NmdIU3Bj?=
 =?utf-8?B?S3lDSnU2U1U2cGxvbmhyN1Q2bXZNVTBvTFJITDZsOTBtcVRqdXdKM2hFM1Zr?=
 =?utf-8?B?VkJreFo1eGNXTnU1b1ZRRFFtaWtqdkFpd0pJcTMvNlhQYUVpcy9xaUhxK296?=
 =?utf-8?B?OGtSQ1FLWkl5SkdNc0F2THBqTGlzY1BFaWJ0djc5VnZ2aElkZThQakxobFJi?=
 =?utf-8?B?L001SE53ZXhLYWVPK1YwamFXZGkydmhmdStlaGJoUTEyOCsxMXZSTjNrY1Rx?=
 =?utf-8?B?a1NPZU5ZSUkrdExPNGdjNzBYclIvRDdRWWVoSUVLTlBFeGxYdHIzT29wTmNh?=
 =?utf-8?B?QXc1YlpKemFZWloyaE02anBaeWlKVWszUk4yS3FVT29kZ09VTHBHK2RuS2Fk?=
 =?utf-8?B?cUVVNWZTSVhLM0xyM1g3Q2pYQ083SlVRKytLY2NubHk5aThlTjFhQkREV3Nu?=
 =?utf-8?B?aVJyQ01iTDVCbHFxeVQrSVFVUE1CVVJvRjlRTER4dzVsMytrZTdyWWJOM2w3?=
 =?utf-8?B?TkdMS3hKb2VTVXB5eTcyUVVBdFVMM2lDb3Y4NWJTc2xvcktrRXczWi8wYnFZ?=
 =?utf-8?B?WFVVMm9lZHRQRnBlOU5TZ3VwOTliUDBIZEhvd2xVQXQ3bkFwTVMwNmtkRXVq?=
 =?utf-8?B?dVNkUTNMeTZGb3JNKy8wVnI2ZWhCYVd6WDN5Z1RlSUs3bENvQlo4UnVlUjNB?=
 =?utf-8?B?M2h3U2VSd2JQa2JCanVLdk1OYXE2VElDRzBIUjlqWVhSSTRERHpvR2JmbC9y?=
 =?utf-8?B?dk9BQ0FpRXR2VkVoNUlWbStKRG8zV0NYQzhaS1dPdEQvTnhUOHNSLzRjWkVi?=
 =?utf-8?B?K0hGY0tiWDhrZ1pYMjkvZ1FrSkFYaDhDWVQzZk13eWcwVlU2MUdOWlNTTDdD?=
 =?utf-8?B?anpZRERmcVZhK1hobkxmRy9lSURxK05TakEycGZRSmVjVzhiNjZmdWNJYXZW?=
 =?utf-8?B?Z08yaGc5VlBjeXMxUU95NHJvOXdJbEIzQXE0T2J5Nmd1K0wyT3c0VGNaQXBu?=
 =?utf-8?B?TDB6K1REQlQ4clloY0laVjkxa1dOS0VXaldDOXVVK1BueElCbEtZbG0rYU1F?=
 =?utf-8?B?eGM4MWhHSm1pZytQVlNBMDYwb0RzSmdqaEdZYmlFTGlUUzZjRlJybkNtbm4y?=
 =?utf-8?B?cTRGQ2VrZDk4YVR4b2h1Nkl1eGoyTitmVU1yamRGYzFVSTBaQ2RReGZxTUpS?=
 =?utf-8?B?bFNXcVFDdUV5bXVtM2ZKZzRHTkN5MmtoZWZXaWJmamJ2T2l1OFpPM3lpZXFu?=
 =?utf-8?B?SnFENWlwRy9KN0JBeFRVYjZsdUlFTnlUWDBMcWQ0MEp1dVFKc2xHcVB0MUl5?=
 =?utf-8?B?RUQyY0MxV09ORVNlSkhuc3loSWJ6ZENNQm1RVFhKMHNDbThJWWw0ZWR5QUdM?=
 =?utf-8?B?cTU4aUI4Z0ppNjQvZkpsVk5DTXNNVTIwRjVWbzBlYXVDOGcvUW1zUXRPck5T?=
 =?utf-8?B?WWpuTEtxOVJCSnFzeHNUc1dsTktFWmZoV3B1NHlXZVp5RXg4UEN1T2NISHJF?=
 =?utf-8?B?S0Y3aDcxZXJxL3hmeG9PSlBXaXJNTjZJa1ppTVBjNklsMkdYbXhhVFkrUHFa?=
 =?utf-8?B?U2hwa1NSdyt5em45STAvZy9WcDdlUEl4WmFwWXh0UFFTRWpXUU00cEhhMjF3?=
 =?utf-8?B?Qkh1eUdDcjBQZDE2TWlRL29WRVlMVjhyeEQ4cVNEdFkrcitzbkd2d1RpMmFM?=
 =?utf-8?B?ZktmY2xML1ExTURBMmp1ME1UTmlQM0ptVzcvYWdUNDE5SnJsVHhrY05wTFll?=
 =?utf-8?B?K1lvWkViYWIyRUZIaHcrMnd5WllFSFNISmhSVEdvQm04bEVlZTV2ZTVaUGRi?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+tHKm7yWm21VKL4xBQ4AHRlOsdlGKhC6pk+44nEjWzvYwB/XsBriJYdYI8/XTQhlUeRiwSmm+yghjMXsh9hjL2MFGUglek5SXZD+tOUjMIo1FDtKijyCYnuOfk+1VRkNdsZjzdpyvJooCobQ0kauZpohfSayKjdL0hEDCFCoM1I94idXKvQGNODa7GtzMv8CjILeNFLLHAMClDfZzhFpdqyWY3Fqd0VXP3TSu2TRxzgrX8fPx3WiES13DEwm6F6yqsY9GFQcFFcf47+WU25mFiEvOLL664B0UTG9UXC3XRRSE6orWZMuMrxprhGP4cPKvPGVFP3WutPR1lLiFdx58SQxKzlLmzZTyB/ZZd1Awg4mX7B2V3H3J1PZ8P9if8WnN2N/c0Bdjt1EN6T2FGoIfEzg+VsC2xrhBgaWK8muXwN5lf8nYL7Opm6LjK6x6rbln/WE5VP5XKxfsdvDnfMu53lM4SDW1MVTfoZW1N5KuaUR7u44PYAAyVcLEyiSFDINAxbulF8RFzefEFLODBZWI2WNmh2BnNvKF6mH8yyjxFfCOK8hZgq8dbKRRN57NjPFTqIwcDGqozpwPt3vP7p15EvwX6h28ZFSAR/bcSYrjWec2wngPnmPYBdGBO6JnZffiCCjSwdvPCixvQ26bkeXMGtYStBpGXYlF/71OBCmxsxjpKsYhbU4JPCkw30KOlClpAV0QuORWMR+qBIDoIKP43Vi/Exr3FoteaXH5KHImN3fVmTQavMAXPwC7XDccoER/2ool6KlLasxu3WANVKWRp4Sj3X331A0nd0IoZbClzidNa2AEDAMKiOXh6nCNi3K
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8dd9f0-9837-4234-e576-08db2a254ea8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:59:52.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gsa7eqUab8Lh0gylo1UKKKSZfi5zhpMEk+5QH46JYnNGRyXyRExfU0ijj2bZILtp4syJs6ysfzwDf4B+rCyNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4939

On Tue, Mar 21, 2023 at 02:51:30PM +0000, Andrew Cooper wrote:
> On 20/03/2023 9:24 am, Jan Beulich wrote:
> > On 17.03.2023 12:39, Roger Pau Monné wrote:
> >> On Tue, May 26, 2020 at 06:40:16PM +0200, Jan Beulich wrote:
> >>> On 26.05.2020 17:01, Andrew Cooper wrote:
> >>>> On 26/05/2020 14:35, Jan Beulich wrote:
> >>>>> On 26.05.2020 13:17, Andrew Cooper wrote:
> >>>>>> On 26/05/2020 07:49, Jan Beulich wrote:
> >>>>>>> Respective Core Gen10 processor lines are affected, too.
> >>>>>>>
> >>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>>>
> >>>>>>> --- a/xen/arch/x86/mm.c
> >>>>>>> +++ b/xen/arch/x86/mm.c
> >>>>>>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
> >>>>>>>      case 0x000506e0: /* errata SKL167 / SKW159 */
> >>>>>>>      case 0x000806e0: /* erratum KBL??? */
> >>>>>>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
> >>>>>>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
> >>>>>>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
> >>>>>> This is marred in complexity.
> >>>>>>
> >>>>>> The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
> >>>>>> moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
> >>>>>> no longer exists/works.  This applies to IceLake systems, but possibly
> >>>>>> not their initial release configuration (hence, via a later microcode
> >>>>>> update).
> >>>>>>
> >>>>>> HLE is also disabled in microcode on all older parts for errata reasons,
> >>>>>> so in practice it doesn't exist anywhere now.
> >>>>>>
> >>>>>> I think it is safe to drop this workaround, and this does seem a more
> >>>>>> simple option than encoding which microcode turned HLE off (which sadly
> >>>>>> isn't covered by the spec updates, as even when turned off, HLE is still
> >>>>>> functioning according to its spec of "may speed things up, may do
> >>>>>> nothing"), or the interactions with the CPUID hiding capabilities of
> >>>>>> MSR_TSX_CTRL.
> >>>>> I'm afraid I don't fully follow: For one, does what you say imply HLE is
> >>>>> no longer enumerated in CPUID?
> >>>> No - sadly not.  For reasons of "not repeating the Haswell/Broadwell
> >>>> microcode fiasco", the HLE bit will continue to exist and be set. 
> >>>> (Although on CascadeLake and later, you can turn it off with MSR_TSX_CTRL.)
> >>>>
> >>>> It was always a weird CPUID bit.  You were supposed to put
> >>>> XACQUIRE/XRELEASE prefixes on your legacy locking, and it would be a nop
> >>>> on old hardware and go faster on newer hardware.
> >>>>
> >>>> There is nothing runtime code needs to look at the HLE bit for, except
> >>>> perhaps for UI reporting purposes.
> >>> Do you know of some public Intel doc I could reference for all of this,
> >>> which I would kind of need in the description of a patch ...
> >>>
> >>>>> But then this
> >>>>> erratum does not have the usual text effectively meaning that an ucode
> >>>>> update is or will be available to address the issue; instead it says
> >>>>> that BIOS or VMM can reserve the respective address range.
> >>>> This is not surprising at all.  Turning off HLE was an unrelated
> >>>> activity, and I bet the link went unnoticed.
> >>>>
> >>>>> This - assuming the alternative you describe is indeed viable - then is surely
> >>>>> a much more intrusive workaround than needed. Which I wouldn't assume
> >>>>> they would suggest in such a case.
> >>>> My suggestion was to drop the workaround, not to complicated it with a
> >>>> microcode revision matrix.
> >>> ... doing this? I don't think I've seen any of this in writing so far,
> >>> except by you. (I don't understand how this reply of yours relates to
> >>> what I was saying about the spec update. I understand what you are
> >>> suggesting. I merely tried to express that I'd have expected Intel to
> >>> point out the much easier workaround, rather than just a pretty involved
> >>> one.) Otherwise, may I suggest you make such a patch, to make sure it
> >>> has an adequate description?
> >> Seeing as there seems to be some data missing to justify the commit -
> >> was has Linux done with those erratas?
> > While they deal with the SNB erratum in a similar way, I'm afraid I'm
> > unaware of Linux having or having had a workaround for the errata here.
> > Which, granted, is a little surprising when we did actually even issue
> > an XSA for this.
> >
> > In fact I find Andrew's request even more surprising with that fact (us
> > having issued XSA-282 for it) in mind, which originally I don't think I
> > had paid attention to (nor recalled).
> 
> No - I'm aware of it.  It probably was the right move at the time.
> 
> But, Intel have subsequently killed HLE in microcode updates update in
> all CPUs it ever existed in (to fix a memory ordering erratum), and
> removed it from the architecture moving forwards (the enumeration of
> TSX_CTRL means HLE architecturally doesn't exist even if it is enumerated).

Should we then check for TSX_CTRL in order to check whether to engage
the workaround?

Thanks, Roger.

