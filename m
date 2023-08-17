Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF8D77F9B4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 16:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585468.916607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWeN7-0005YV-6t; Thu, 17 Aug 2023 14:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585468.916607; Thu, 17 Aug 2023 14:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWeN7-0005WV-3t; Thu, 17 Aug 2023 14:53:13 +0000
Received: by outflank-mailman (input) for mailman id 585468;
 Thu, 17 Aug 2023 14:53:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+2S=EC=citrix.com=prvs=586922e9e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWeN5-0005Jf-IJ
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 14:53:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c74594cf-3d0d-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 16:53:09 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Aug 2023 10:53:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6139.namprd03.prod.outlook.com (2603:10b6:408:11c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 14:53:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 14:53:03 +0000
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
X-Inumbo-ID: c74594cf-3d0d-11ee-877b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692283989;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qHrQdUBPsHPZgOK51qJCO539LEVHy3zN+7cGQIeryFA=;
  b=dppVL9P9j+1xuL5F8esWnFQQxMR5eYkSXcBi7V0IZOasBYYtG/++a9vK
   5UWxL7so4vjsV9fKYTSyfhhC9C0xudlpCiDXeEz/7YbcGPhEwSfa69XvM
   fUq6oXCoAoeAGqZxtfVqQKFp/nTy1q/GtUrJJLouBLZ8M++xb3p2tazAy
   M=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 119667414
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:S2ACJaOemK//PvHvrR2IlsFynXyQoLVcMsEvi/4bfWQNrUok0mEPz
 jdODG6Ca/qLZWqhed8iaou1oU1X7cXWm95rSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5wNmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ulqDFwS8
 vAWEwEIakq7gr7v3uK5G/Y506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHKlBt1OTeHQGvhCv3mh710/AQ8sDlaJ/6CkpVGMW91EA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACAcAvd/qpdhpigqVF4k9VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:JIjjyqgJzZUXfdhvoz8QG57/h3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:98cgGWFWZiqnGTcBqmJo6UMpRscpfEbsyXOKG0rkUHg5SuyKHAo=
X-Talos-MUID: 9a23:qYMAhQqccfEIn1F7+kAezw5GBu5Zz628MhsAo8tfpuabByx/IB7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="119667414"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYPa3hMvRqEUbhAvuFnRZiERnck5M/BBlnQaLc9uvH1hueYUkdJjW0tY05OSjTLGDJYseZ4AYXX8oiYka6acNLtKj62FzL224ZMejOeZX4zqRcuZ+/4BXCugDwW+JoRvNkLntYBA4lwQc+IJVHHNgdCSUaeIpUV7VWZY0zMGRej7n4WDAFV8RuLMDVzcGoYX8yzA1Ww/PZb6fsQah+os2p9BY1C/vDAY8WMZsy2982Sqf6pc/k0rl2mDrl310CCxv8B+2KseK14qf2q0GmwpKnhIOsjDnAgaQICtDjr6cvldG6/fl0KFxcpYZWjHZfIr2WB517RT28aoghnHH5Jp/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHrQdUBPsHPZgOK51qJCO539LEVHy3zN+7cGQIeryFA=;
 b=jqr/kLZjhZ0pzfi9UOurxVDY9J609qSsMERoqH3xk5mbeiGK9sI+tu8AiWn9ucDDffcMIobfxUqDDVkABMFmXD/GX5ucffMZ2apAZj2WvWKbvQwfW5jCVQ577XcOQUbQ1D5ricmGUs0hYtmzis7CC4ODajl8RjpbizTicmpTYxvksx9SOn/ih9QpIbjGN+XdWR67yj+s48Z2FN0yIsMWGSRpQF2e+yknfV6DbWFCUU8Rm3PN54h/aP6ENrENXTzWkWwsbss9i/u//2s66b91EK3nfJ405mJGXNQih4i0Tp563XExjuOzOwaP3uGMRTgQfrY8+hd+vh4/VdEfZZDj8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHrQdUBPsHPZgOK51qJCO539LEVHy3zN+7cGQIeryFA=;
 b=qfJWPW1udB21yYN3igP/poxIBmKxeC/zcjMb3t8KmoizHTPQYr9toZXdc6UL09nMUEsqIwkP12kddwMv5M60n0NSNxuTjZFL1MSMYfP94bwmoJqmNYNV55Twaf0fobIRYDLel8aLDM7K0dGEsJUjE50LvwCyoMyKgLWV47wVUHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <484498e0-cf61-6468-0083-47e68e7797d3@citrix.com>
Date: Thu, 17 Aug 2023 15:52:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: rework wrapping of libc functions in test and
 fuzzing harnesses
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com>
 <defbf6e0-28ee-4276-7535-0ed2e23ededa@citrix.com>
 <60ee47f3-f424-6f4f-ae81-6322f0e0541e@suse.com>
In-Reply-To: <60ee47f3-f424-6f4f-ae81-6322f0e0541e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b65bab-dd72-4b3b-b135-08db9f31a82c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	orehAR+ThhLGg3pzKy0ksxv535r36DXIJV/66ONCZqupxocn1aZZoAK/Lrkjlxjxp3e5auOBndrxhBsXi6dvVv+RlP+2BR17MzD4ZJBVsoSUaYcj7xJQfEfeSr/CYaoeizovEk80crnbdDapSx2mANyqR1LdBZXMeRLgVtx8I1PODCdBR/7jqSqBzQoZL0xHdTbf+G5jA5ZfLOjrEhG3cLAuMPBYiYYd95CqzV5DEey9vTfjzQuaLN5lvHEp9E6Ay6vfGRm/JGCyCNQEabo/fNNYSTjRBcRhr9uEp3AmQ5lfHu8iQnqvIzRLy0xd0c0slht/T70nYDwcIWrX4I8iYzggR9jhOLt9NKp+Fu3WT88HWqRPJT80uk91oiLY8dBGgMIlRmTQ6oczZmluO2igMi2NZHI9P8n6SCQnYdKMr1tqmOo6eii8ci+N1h13E4efHS7kRAWe8dxW4vq3wt+CA/5oix4D2/VmoWZ0FiJJp4PAv8pdebnZ5VWeblo+tfMi5s+c8bI48u4Yq63FTTXjCMqqjdngMgMOfKBkGD5m7FWzwmtjophjETMwHKt29/ZrPy2Uekw11+/MCkLmR9c8MJL68nxnxAcRU6LuYyXfWaEKyUGJbiP5/8StpXzTI1V0kAdxJbcMRqfDPd6egI2H/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199024)(1800799009)(186009)(31686004)(36756003)(86362001)(31696002)(38100700002)(82960400001)(478600001)(2616005)(5660300002)(66556008)(66476007)(66946007)(316002)(53546011)(6666004)(54906003)(6506007)(6486002)(6916009)(6512007)(26005)(41300700001)(8936002)(4326008)(8676002)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTE1WFZDbEliY2E2eTVPa2gzZ1NYQ1NELzZvVUFKd0IvZjRoYjZmWlo3TEVo?=
 =?utf-8?B?L292QndnQkREODV6ZmpuZzNUNjR3NEpQRlJRa3ZuYWtOUjBHTFRzalQxTnYy?=
 =?utf-8?B?UUwzMFBySGtQeWdNSjgrbGJkT0NDRU5HLzhoWXFDbnpQb1lLY1d3c0ZWV1Zj?=
 =?utf-8?B?MXo4QWZsdmdvZXFmeWdVTy84Nm5TaVpRb1NZWHo3ZHJiTTMyd05NMk4wY1h3?=
 =?utf-8?B?WUxkZ21HZjN1c0dCMzUzYW42Wk9qMVRmc21BZGlKLzNCUWlCNmQ4b2gzb0M2?=
 =?utf-8?B?Lyt5QnBEUURLdEs4MThlWTJiYVRlVHRTYW0vNVc4RW5qTjZ4MGppMjRsc2xz?=
 =?utf-8?B?UTllazAyejc0ZklQUURKNFY0blU1LzdmdXliUW8yVDR1eFpUVkVNZnN0aVJT?=
 =?utf-8?B?eHBxdUU1VXVvaTZ6UCtmdWNXZ3BHR3diRFpSZTJrVUVjaHpwdFA0Q0ZEV201?=
 =?utf-8?B?OFBZMHpoL21Dc1czanQ5cXBGVDNVWTh3VHZkZGFoa1lrZWFFV0F3VXhHc2lK?=
 =?utf-8?B?VzRvS2NrSU9xRW9FVEgyUllnUGdYZzFXK3RXTWN4ZjE2ckFVRVdDRWRMY092?=
 =?utf-8?B?dzdReEVCWmpLY3hPWkNFUE56QWRBVG1KamVaZFlFcDBJdk1IVFZSbEtmM3hr?=
 =?utf-8?B?ejJwOVFreVR5a2RaZ0U0cFhML0tzODVNN25iNzExNjA4amYxamRIemZrcHRk?=
 =?utf-8?B?dkpnUXRHdngwWTVUSXZPeUJtM3hRb2dCK1pHbzZxWkltWThWV2dXRXdTU3J5?=
 =?utf-8?B?RElSZ0VLNnRIZUZ1YWtSTW81NW0xT2JKUGhJVnRaZ0tyellvWmU3WlhlaHZP?=
 =?utf-8?B?Yk84R0d1YksxNitzWVJ2bWZkVjBRdmtqWGxQTWx5LzVCVGwxa0RjYzlPVjZR?=
 =?utf-8?B?ZXYzYlM3WG53MlFxMElxcHE4a2paOWU0NXdBdk4ydEU1aURmTlJHb2tBaTF2?=
 =?utf-8?B?aVN2M1VnL1gwT1A3L1pnUExTREVUWm1FbXU5amc1WnplRU9hS3o5ZFZPd0Fz?=
 =?utf-8?B?bnkrb0VmK2tvT2RrVTFaQXdlNHZKTXoxYVRLM05sS0FZb3ZMd0pDUUpkVmxL?=
 =?utf-8?B?YUpSQkRmZkpZdzlwYm1UWVArcytZTGpVNHlzaFZCWEpmejE1OW9FOUxGQ050?=
 =?utf-8?B?aFB1TFhhd3hwN2FNRmwyQjZ6ckR5TTVmaC9ERGRWUnhYQUo4a3pVOTZoKzZs?=
 =?utf-8?B?NTUvYjFhYXRXSVRMYWwvcGs4U3Z4RVVncmtJOThsWWQ0amo1eUYvUUw0YW9U?=
 =?utf-8?B?dG1FaTYranJNM3FhemlxRm83c3IwSm1vSFpZWlRzK2gxVVpJTEF3L1c5MTBu?=
 =?utf-8?B?T0NiazRGa2F1RUtDazF6Y1NHREUrN1FqOGhuS3RpSWNNc2tvN245ZlR4WXdF?=
 =?utf-8?B?TXlyck82N0RFbUxSM1k0SzlNY0ZOUHhRbzJ0bHBvbm9hY0JxTG9BNHFWWWhW?=
 =?utf-8?B?eGcwSVpjTEFwc2JUSkZEd0FTL3BIYzFmVE1QVXJmNlB4cFByZjN2RmpxUjNJ?=
 =?utf-8?B?RXhpbVBmNW5jYkpkamRWa1hlSmlkaEppZU50SVFmUUdQMEs0YklPL1o4RU5X?=
 =?utf-8?B?dUliSzJyRjQxTVR5Zzcyd3g0TkdNVXF0QUdCc0NEVzBUK3cvQkNncEJjdS9u?=
 =?utf-8?B?eWFJQWZoOStTZmFxVmJPajBnRmhxUi9WUzZjZXFwUW5TN01sOXRGVkprV1JB?=
 =?utf-8?B?VTVMejBvd3ZBS2ZmYURlUEtxa0x1dmFveTNEYzNMSGhoM2xOSEF3eHpCM2JI?=
 =?utf-8?B?YXhsWUlSUnhGQlE4UWpYUGZKaDFISXJ3OTMxUHd6endDZ1BFdHkyTURCNjF2?=
 =?utf-8?B?Zlo4WGJBWk15cWQ4NUZFTC9JbFRBOThHQ1R4YUZPOEQ5OHJvSHlvZVFuM3A2?=
 =?utf-8?B?b2M2dTQzL2luRCtmaU9jWGgvR0ROREN3YWM2NWM4ZEZwZ0k4ckFRK1ZXRU1s?=
 =?utf-8?B?NDVBTEhldktNWHR5ZWUvdFJQZDNkWkxpN2FFSHg3OFN2STNEdE1PTnBybWRw?=
 =?utf-8?B?Ky9ERGRuY3F0UFo2ZGxzNHh5N2UwMTU0Q3B5ampSZlN6WmdmNEpwcGFCOEZu?=
 =?utf-8?B?b3laRldCT0RoTnJXalltZmtoSVFvN0kyNkYwanRia2s2RG5ycEFheWJZekdJ?=
 =?utf-8?B?Slg4YWszblR0ejJqanFvVjNkTWo5YytoQmZUWUtBczl1VXRrUEo0WTQzZTJ0?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rFLFn4wZJzal9TYb0LgCDuAmaTxCBjDoc5so1yNlaDALQodv+YL2tI0qFzBjIahElIVFnC7p8Dwsi5KUhzJWD9DUarAIWLIOqfPa1Vy1rzTFod4Gzyov1L59WksWsHQSv4U99dvlxQCGLjkgRi3DGyiny+GTsv46KTr5ErlD2CLcAJsMvMJ4f86WE7N8xZeG7tnSmFl5AKN4kh19+DiSAO2Y88qU9+Mscebyh3XhlKySZ9K7WCaufWlifzZOvk/6hcyawQoThRvUd+kHCJ3ot19Omy83rmXhvIixG+dtr5cn+hLz0JhBzDPpkBDzKV3Ya4g85aQ2IZ9gq8mROJEs7glhalmmOYBKsYPFm+Lx8P+AD2KS/JNBTfn6k5mAkLi3/rtPBPX6Q6vxrK9bRRlMzhjccueZ5ULsdyD1w0w11mG8Bx6TIIrFJwK5MeJC373EAgzejn2MvNbHSUOXDS2o1n0LA6DhJOuYHo2NuRj4lCq2oE972AZJUuaNZEFV/c8rjmpU0SWsCnk3hBBHhXS78pkpLn6qBX9p1QtNzNwKf1drwDtneUbQeOV8FXji6XwY4bX0Sfc0HyHqYHiQAV+b/b2JrAHYNM6l2q7dtkh71iQ30l9GhlkmwfmR57TKhiQrZR6epGEPrXWn8Ou6yw3L9AILkVSAlZPU5p56PgjQP0clYUf52FCyiF3quTDjrOMEs2LXEdlYRn3NycKWrfRfKM7YJWAVPaaFM7yOsFyZ95SWCez0PQUa9NnLqoNcHcVE1o6g+SlK+pGcDAe+SNQ+5fY9CBjEW+EWNNyBPTpK5CGKruo1TlsE/EwJbFMvULu6
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b65bab-dd72-4b3b-b135-08db9f31a82c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 14:53:02.9958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8wm3AO6rMOkj6caCMwiGpM53m2yn3LGLS4PfdWxpmT4owyXhJFRGQiDHpF3UJ3fNoN6B/oNTlDVJsLdgC99SzD4/AyVZ3cus3fveH0AYRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6139

On 17/08/2023 2:15 pm, Jan Beulich wrote:
> On 17.08.2023 14:58, Andrew Cooper wrote:
>> On 17/08/2023 12:47 pm, Jan Beulich wrote:
>>> Our present approach is working fully behind the compiler's back. This
>>> was found to not work with LTO. Employ ld's --wrap= option instead. Note
>>> that while this makes the build work at least with new enough gcc (it
>>> doesn't with gcc7, for example, due to tool chain side issues afaict),
>>> according to my testing things still won't work when building the
>>> fuzzing harness with afl-cc: While with the gcc7 tool chain I see afl-as
>>> getting invoked, this does not happen with gcc13. Yet without using that
>>> assembler wrapper the resulting binary will look uninstrumented to
>>> afl-fuzz.
>>>
>>> While checking the resulting binaries I noticed that we've gained uses
>>> of snprintf() and strstr(), which only just so happen to not cause any
>>> problems. Add a wrappers for them as well.
>>>
>>> Since we don't have any actual uses of v{,sn}printf(), no definitions of
>>> their wrappers appear (just yet). But I think we want
>>> __wrap_{,sn}printf() to properly use __real_v{,sn}printf() right away,
>>> which means we need delarations of the latter.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> This does resolve the build issue.  I do get a binary out of the end, so
>> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>.  I presume that
>> you've smoke tested the resulting binary?
> Oh, another question: Because of you asking it's not really clear whether
> the T-b is kind of implying an A-b as well. Could you confirm one way or
> the other, please?

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

