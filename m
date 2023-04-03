Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD46D43CF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 13:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517405.802666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjIgJ-0004pq-Ao; Mon, 03 Apr 2023 11:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517405.802666; Mon, 03 Apr 2023 11:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjIgJ-0004mh-7P; Mon, 03 Apr 2023 11:49:03 +0000
Received: by outflank-mailman (input) for mailman id 517405;
 Mon, 03 Apr 2023 11:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGRT=72=citrix.com=prvs=45084431a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjIgH-0004mb-NL
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 11:49:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84e3de47-d215-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 13:49:00 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 07:48:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5871.namprd03.prod.outlook.com (2603:10b6:a03:2dd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Mon, 3 Apr
 2023 11:48:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 11:48:54 +0000
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
X-Inumbo-ID: 84e3de47-d215-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680522540;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S/dd1BE3i1wam+A+ho2BHZrjnBdwFWUSnpCe5R7AdTg=;
  b=MgVuGeXXcbzCcHhroo6jZKiHHz+kQK1i5od7AiSG2mac+kg1hK7bkzW3
   o36AtTGc0IHMgohxbSnd/77l+HPOL97bmKgn2vpy0CJer59AS4PmpcoMg
   +ENP0ISeDNL619Y10XPwJEp9TAZrCm7dDWCJizzoPxAlGzggmeitQK3lJ
   c=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 106534854
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QinEg69Q/NogbZ5aysA6DrUDrX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 modUDvXbqrcMWWgKI90Ptm08UgAvZfSzIJqGVA4qy88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmOagQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkJ3
 s4ZEmgqYSu/xPiZ57KFRO01pYcKeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpMSebkpqM26LGV7nU8KQI5W2r4nemoo16je5VbD
 R0axTV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcUbzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsSAIE55zvpd81hxeWFtJ7Svft0ZvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:JbYOwq9OQVtYB+pJ0G5uk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="106534854"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw4KEYrQI5uvc5mTxz77tYbItzblEfPXPZSnBHSWzxR72M2YD/iVQM1DlzoPOMEccewaZvSZoWTNZamliB8Y9MklAtXuPAcIE1bgUQ+YvACwIibvTUZUwoPYVSppKrFKl3pth2PqxzraM77N1huArjpiD/J6Df83opSCUoQgJxEL/r5ZG9eIdNDJCsv1WYAQ+54KJ5Y6MQSAe/jJPfF0oi3uz18l32dCM/hYsyA0p7QvTf5+X20w3348cFOxNgPfA0juMaUS8pfeunQz8pp/fXgXc2vWzd8ff7RL6mpfNZgX8t74dwFR6N0haBX2XPBpAH0XVQUO9wO3OQzeu+0VYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF/0VHEKmXlSYyf2iV8XQgfO8qTiuqIbt5+2xRqLfYw=;
 b=aILlJcOeX/72IpWXPcbM8ucJrpY9xgeCuO9DwF9xvnZ9CFGMYLIEbV7sEUB+jyv7z3zNKa8PGYs1VQft3dCepLzGhGprHWLc/sBUjYU4lWXS7Z07A97dykDITvayNn4Fb1bGY9CpFhyCjWE0s8Gt1DJoQ+SgKwA948zrMGWTz3tRxxZMHZLWY5W/ag6MnP1WVgA2vpw+tHIJhbgiXCQjGXo+SCoMN4rY4s7DBo6mvGrGQLUHOMhWOiZ1PdB/VgdjiHkTI//k5zcvk2XRMXYORGmLXGxQBphTtRKgCBwMKvUFBTzgOQ4Z2rkg3E/tH6MIzDqgsBVPpSltQ5cc2ADTtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF/0VHEKmXlSYyf2iV8XQgfO8qTiuqIbt5+2xRqLfYw=;
 b=MqY3/d7l8Eg3sxUKIiHXl5VU+8yVp89jVDEL/e0ZpFo8LZSMsilGpZumCHH4p6EzgBmWOvMoaNt17sNpspdO/GVwnaGW3Wvi5qoqUFVdRoyiTNcRnmG4XdK4k9i2R6gdg4wwsDv/PEa/QzBAkot0lYrHa29yl4azXDc0ceQnaaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6788d260-fe5c-f3e8-d479-329a2149fba4@citrix.com>
Date: Mon, 3 Apr 2023 12:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <ZCVtcR5u/14/WmCU@Air-de-Roger>
 <9108a58f-da8f-14e4-de88-a7c8c8abb0f7@citrix.com>
 <ZCWgHxCL4yXD6CxC@Air-de-Roger>
 <14d8128d-6f50-99e5-ec98-366318e7be1b@citrix.com>
 <ZCq8yDv/FaOvtTPo@Air-de-Roger>
In-Reply-To: <ZCq8yDv/FaOvtTPo@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4d7db8-8668-4e23-5eee-08db343966b5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7VuoL2vZQ0ZfeE/nfGYHyCSoWyKKVrePIqrmdcTy5wrqzJUaxwYPlczG2jY2yckafAN9P02PS+3wDJTFmpIL0zCYJr00j0RC5cfebOE3ffHpUaXwvCn3Sx37y6H9Wb1CUO5RdmLBpgUHn80UiIN9gCGCqdKAQqox3rBKYkJidOVmg0YpXqt5LD7EODrkEPDH60FB3GbyzHeHe6CfivhgyCLr8W10qFdWi02QEPHbJvDVS8Od0F0War+18tmgIa+pSFSENGttckGkwYlWfYYVgka6E0ez73Hzg7/AQbDt1TbEiKYUg5z2X9ZHsfZLMckTK2bA2WnrJlz7qHuPM3aN4YqUniZvj9Wt4obK3e0M9+Kr5k+bmC+g7lurWgzjePQlQL4GlpzfX0AOdwtKi5XbkIZAARI5u5+MiwwXbWGaIEKb/fYc53V/EDjy6p4FPdgB0nnABEwac+FwaeCCCglAmq8GgFcsye7i8GA6XCZ93pt7NqOk3/aAY+sBPMyB23wOet45lCs9rYkn8zTMHYtKRvW6dF6G6jB4qWRYKf/WMAmOnDUjDHDMHzQvjt4ElA79T83joP1rGlaxQlNu6yxNLXkYPnMWpOCrmQp4D2TuPBfRBVRcOaQ88nx1fQRxXi/fDMd4GWxz2Yeutt6nAo4fWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(66946007)(6506007)(4326008)(316002)(36756003)(53546011)(8676002)(6636002)(54906003)(66556008)(37006003)(66476007)(6486002)(8936002)(41300700001)(478600001)(5660300002)(6862004)(82960400001)(86362001)(2906002)(31696002)(38100700002)(186003)(2616005)(6512007)(26005)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC9ZcWhlWTE5cXp6cHZMV1UxMlFNdi9OaXNIQURVUWRQRVZPdzY1YVMrUW5D?=
 =?utf-8?B?cmhveFNuYUE3L0VjRGNTdjhCZytsSGMxWlFwMTk0ZmdlQnpiOXNXcWRmWlpa?=
 =?utf-8?B?S1JIRzNlbU9iZTlQbzVSdU5GSndZUEo5OGNRbElzU2tXNWxOMVRtMkJoTXpa?=
 =?utf-8?B?RlJOVEdkU3JybjVYTWgzd3ltbmJjK1hoeFF5RDNucGg3ZzZHUGttYUdMbzNL?=
 =?utf-8?B?YmhFVnJRaVZqazlQYmRCNTJTM1ZaYzZrVzlYTmVLeDVnM21OTEZxb0F1Z2ZB?=
 =?utf-8?B?S0ZUc0dMTWdxZFpjL1F4Q1p1SGVrRDZKenh2SGRLVGdOam1zSjQ5VG41cVJ6?=
 =?utf-8?B?YzJidjB6aDVlRk05eW85WFRaYzRGVHJvWWVLTXdyMFhUR2Z0Ly9lajR4NWNP?=
 =?utf-8?B?a0U0T0V5eXZSeHB4ckhIWEVGNmRpek5LOVl1OXJqcExRL1VGWDJOMi9FZDF1?=
 =?utf-8?B?MEpQNWhINTV6UVVIOThrbTFqaWh6bUJwWGU0OFhvZUtkUnhrT1grK3hVMERm?=
 =?utf-8?B?SHYydDl0eU5pcHhhMDFya3pFZGFVMlduU3hWcVZrMUUzVnkwTjVMcm1zMUhU?=
 =?utf-8?B?S1Zxa0lRN3pVaCs0QllEUjB0ekpkZ2JEZ3h4VVk3VDNvU2JSQmRlcHNzVzUr?=
 =?utf-8?B?Z1ZVNk9Sa1o1US9QNVowZHJoamQ4TkRZUFJ0RlNTbGQ4YUFIcVQ4R255NTJx?=
 =?utf-8?B?blZFSEkxM3FtaXlGTXpYSGM2dkhSM05NT2VURElianNFa2pJRjFDSVhEVFIy?=
 =?utf-8?B?MXZ2eWo0RzFPWjFJT1NiQmRWbEh2MXJVdWZDaXhnQVFkVEwrZmVjQWY5WXh4?=
 =?utf-8?B?OEg3cjZJZ1hlS3h6T0k3NnZxSFB1U1FOd0lUZFk1Y0NwR25rL2JKLzRTMlN6?=
 =?utf-8?B?V3p4a1BmWWZvWG9WMm4xTjBnKzN2bFUwVUFUNWxaS01SeTUveXpaN0NhTHhI?=
 =?utf-8?B?OXd3VGNIWTdSaVkwamdkSGZiN21zLzRtNVVxanBkcVhWektKWlBkZkI4c3VP?=
 =?utf-8?B?TzQvblMrbkVkS09NMndyYktRSGIrd0xLZlNxc2t0ZHdEU0U1U3NNUlBHcXh5?=
 =?utf-8?B?SVY5TXAzKzY4TjhVbmxFY29UTUpZNTFkNU5sbENzTjlKWGkzb0M1cUE4UVhV?=
 =?utf-8?B?c2NUVC85Q1M4b2l1TTB5VWlYQVNRSG9ZUStPbTlsajR3TFV4Z1l1WGxSMFRN?=
 =?utf-8?B?QVlBdS9ZQ1J1MGZoZXdKWkRlbTYwYUFBMG1GWVp0Zm40c0k2RDgrckZqaFZa?=
 =?utf-8?B?RS9IMGprWXhoZkdtb3pMWEdVWXgrdHJxU1JOQXlkUDNtSExSbDd1TUhyNCta?=
 =?utf-8?B?b3hiOVJjRmlwS0ZZempjbXJYQmtoK3ZvVjl3MUNrRklyL2w0RUZFbjZjVGg0?=
 =?utf-8?B?V2FnUVVkRURvcEY2NjlHdFJ2MHpoVHdRSy9pZEJ4WnZZREJ6SEdUREhOUEtw?=
 =?utf-8?B?TCtCbHhzTFg3cWZyMGtEOUZ6c2FUbDN5bENWZWt5SzJjZmxVRk1XSjdVaHFt?=
 =?utf-8?B?YUxQdkN6U21zN1NxeFRVc1I4LzlsS3pQaC9EYjJxQ1FBN2tEU2didU5nRFhl?=
 =?utf-8?B?NmJzSkxON0JGelJPSEg0RzFucUttQkZYUEtNeVZLVnR3SURtSXdpMGJJVU4w?=
 =?utf-8?B?L2djdVJ6bzhMZDg1bjFKWm56eG95eFhTc2E5ekhQZjBycHlqd2NtZGpqZ3gx?=
 =?utf-8?B?TkliK0pIQTI3MkhvUEh3d3d5UjNUbEhPWHVtbm8vSm9ONzR0bERoUVptNk5Y?=
 =?utf-8?B?OEtQbHJLUmJ5bGFpY2pVbW1KOHZqOG52NjRFbzJFOXphbC9wTU9NL2JmcDNH?=
 =?utf-8?B?L3I1bkZ5bGoybzNYRFpkU0duU1EzMi84REoxaEdrZytZaU1xOGh6UkUrMnB5?=
 =?utf-8?B?eTVxa1QzSmZQMGNwNXJCcmJmNGxwMEVNY2FUaXJOV1BWdm9VQW1NZkRmYzN3?=
 =?utf-8?B?aFdaUXhjdG03QzVkNTJCU3kvYi9tT3JRZDIydjZ0N2R5TjJNd1JaRGx5a3NG?=
 =?utf-8?B?SlVuWUhoaFlZUUlLd1JYcGRZYTU2c1l6M0pTODRPVGpYdnBDZUJUSlQ3TmtY?=
 =?utf-8?B?SzdFRU5zb3BZbEhaSE9ybDZhd3B0NzF2Mjk3bnQycEtma0J0V3MrclhxN2Uv?=
 =?utf-8?B?YkhsRkJDenMybEpxbWRWVkRPWkZKOXV3WHVYQmhDTEV2SjdlNXlOKzNHek9m?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3xYKrKy1cKejUcL5dFOl2hOOZsjbmoDCfU0yN5i5U7gb4Be4MyaixNcovLefP91AT0iYzSdNyKOLS9U1i+JARaMZ+1NsLAlZJdy9/AD69xdRlkUAU3g4bZTKvF66mfcvDMZo6TIWUqu/vt9MhV8u+q1EMkrPgoH2v5++4MJTqWas5ncmp1aMaMm/FO9HaPtEJxEY79pNhzhTirWT9SBGbWO9CbaQRSncrRV8fTh5vzYtpVmmw4M4ZsRiQQCw8MwO2x9JDU1oLs8mJ7ctmNyzsQILyVDS6TwCVMPPHIqvDh6pIztqXfoouFEYrim43aHiejxOp5lp64saaGjn9O2nXRSl0tOUzn/M31TCNQe4a33hntc+dNKWNEIsl/vSnSD0pYklfNTV+FgfkK+Z0rI0aYscwVoImVKnKcGFk8nIXSLPxyQO9QQBnkE6069wQO74Fkm3Gk5HY45oeRDKT/Iwy++uyGWJHoPS4MhYy36o1ANpcw1KEjpiKGkdEUyhrAKz6jzWBGdjNY0NhxYcmhKWkgmDhz49uraMd4F3FRoBcQswwFUe8nLTBAbj94oEivWvMEJKNfmHM9mkJRvFvlXFZAEEV5S84/mZ3s9g2Tmmivcm8sNHBXhLhiYVkmOvXZKgmZFQIzEzzTTs/6v8z3ha3ZwTkvn1UeETcJYUPaYg1NTMNkJcnE9ZcNv7LFNMDwAdfXpLf+mu+xJ4y/m+SjXqrIC3H4YluLNACoRJDZEdDWcPiwTTV9Qcfb6JBUm0aQohoW5sxFCsN90gxozv8MumytnKofERo08/uLf5xT/0g+l8pg2OeJaPDUWMnJlphzu5
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4d7db8-8668-4e23-5eee-08db343966b5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:48:54.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSZZb7vc48IOamLd73zFxGaEqfKQ378X/ZtOuMqofemymqqygjxrn7btxeXW2Yq16UQCEmUsu0qike0b8AjgeTL27RXRYV/Bg63eUkIZFpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5871

On 03/04/2023 12:47 pm, Roger Pau Monné wrote:
> On Mon, Apr 03, 2023 at 11:55:57AM +0100, Andrew Cooper wrote:
>> On 30/03/2023 3:43 pm, Roger Pau Monné wrote:
>>> On Thu, Mar 30, 2023 at 01:59:37PM +0100, Andrew Cooper wrote:
>>>> On 30/03/2023 12:07 pm, Roger Pau Monné wrote:
>>>>> On Wed, Mar 29, 2023 at 09:51:28PM +0100, Andrew Cooper wrote:
>>>>>> But this does mean that we now have
>>>>>>
>>>>>>   cpu_policy->basic.$X
>>>>>>   cpu_policy->feat.$Y
>>>>>>   cpu_policy->arch_caps.$Z
>>>>> I'm not sure I like the fact that we now can't differentiate between
>>>>> policy fields related to MSRs or CPUID leafs.
>>>>>
>>>>> Isn't there a chance we might in the future get some name space
>>>>> collision by us having decided to unify both?
>>>> The names are chosen by me so far, and the compiler will tell us if
>>>> things actually collide.
>>>>
>>>> And renaming the existing field is a perfectly acceptable way of
>>>> resolving a conflict which arises in the future.
>>>>
>>>> But yes - this was the whole point of asking the question.
>>> I think I would prefer to keep the cpu_policy->{cpuid,msr}.
>>> distinction if it doesn't interfere with further work.
>> Unfortunately that's the opposite of what Jan asked for.  What I have
>> done, based on the prior conversation is:
>>
>> struct arch_domain {
>>     ...
>>
>>     /*
>>      * The domain's CPU Policy.  "cpu_policy" is considered the canonical
>>      * pointer, but the "cpuid" and "msr" aliases exist so the most
>>      * appropriate one can be used for local code clarity.
>>      */
>>     union {
>>         struct cpu_policy *cpu_policy;
>>         struct cpu_policy *cpuid;
>>         struct cpu_policy *msr;
>>     };
>>
>> So all the cases where you do have d->arch.cpuid.feat.$X, this continues
>> to work.
>>
>> The cases where you pull a cpu_policy out into a local variable, there
>> will be no cpuid or msr infix, but these cases already have no cpuid/msr
>> part to their naming.
> I see.  I'm fine with this.  There's still the remote possibility of
> field name clash between cpuid and msr names, but we can likely sort
> this out if we ever get into this position.

Thanks.  Yeah, we can rename if things become problematic.

~Andrew

