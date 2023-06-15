Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA23D731FE1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 20:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549785.858524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9rXL-0003FB-4B; Thu, 15 Jun 2023 18:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549785.858524; Thu, 15 Jun 2023 18:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9rXL-0003Bu-1P; Thu, 15 Jun 2023 18:17:35 +0000
Received: by outflank-mailman (input) for mailman id 549785;
 Thu, 15 Jun 2023 18:17:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnOU=CD=citrix.com=prvs=523455384=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9rXJ-0003Bm-3W
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 18:17:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e33095ba-0ba8-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 20:17:31 +0200 (CEST)
Received: from mail-bn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jun 2023 14:17:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH8PR03MB7308.namprd03.prod.outlook.com (2603:10b6:510:254::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Thu, 15 Jun
 2023 18:17:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 18:17:24 +0000
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
X-Inumbo-ID: e33095ba-0ba8-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686853050;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kN1yyi2xoKBZlW9i2AiQxJMVMuLPWLSm5ef/dogZ8lU=;
  b=Wi7ya3fzlO6irTP0/5LTDXdVw3FYW/x+F8afWRAytFDIpFnJzzVSrWEs
   Sx9XdDa747ilr3zvxzgeDZJe7H1XU/F3Eq6aJ6y97IgMoCxtTtrZNRVVk
   sWFuxKpFF22dzcXrXOZN+8ghy88YysDmO5tw7bFLNME4A/I3OOHd3ivnS
   8=;
X-IronPort-RemoteIP: 104.47.51.43
X-IronPort-MID: 112962350
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qGG+U6hyXpicccigqTsHAPQ/X161QhEKZh0ujC45NGQN5FlHY01je
 htvX2yDO/yJajf8eNxzPtvk8RlQuZDRn9VhGgJkrX89Ei4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaDzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQyD2FSVjSOndia752FG8RrnOAGMMnCadZ3VnFIlVk1DN4AaLWbGeDgw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEoluS2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTefpqKQx3QX7Kmo7MDE9cFjkpsSFknWzAcpgD
 FxP0yU3ov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Ys11xTGS445FLbv1oGuXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94aRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:CoCbValumBneHMrTcx0d+4aTk+npDfL63DAbv31ZSRFFG/Fw8P
 re/8jztCWE6gr5PUtBpTnuAtj7fZrjz+8T3WB8B8bcYOCEghrPEGgB1/qa/9SIIUSXndK1s5
 0QD5SWY+eAdmSS4/yKnTVRa7wbsb26GKfBv4njJyAEd21Xg3oJ1XYANu6IencWeOFUbaBXKH
 KNjvAsm9K7EU57UizDbEN1OtT+mw==
X-Talos-CUID: =?us-ascii?q?9a23=3AhB0woWvTemnKrl5wHSfFcGuE6IsPVSyC9FPdOXW?=
 =?us-ascii?q?UJklXGZCSU3u15KNNxp8=3D?=
X-Talos-MUID: 9a23:Qp7+bQpxNLcWg0goLCEezwlOH+JrvKOTNFg2nM8ehO6UbgV/IjjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,245,1681185600"; 
   d="scan'208";a="112962350"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKEyC9Cb7uUMfNTUtNSUlnjvlGxP5Q4Jiwf27SKBpp42RFbQ7b/4ObA/87UKh4ea/DexwQXeU1DHDDtw1syBNbfBnG0T2A7pQgWU+GTyKbu3gPRWdaa+LjW2N0Yey/UFjymMhtyZtOYFGNL7aU12Stft5XKRrGrQvK4oO+OSuKOgVa0piZXyrfMBbn0cWu8hOMGUg57dmpd4Qxh18hN98RuSfgo7RocbPLcJkCIy26NRnGLe0KPQohZVL15YXwS9fXJmSSRS/Z15SfP4J76JSyYLHem97ckjoctzcKYz6OnUDmalCpJfK53tNaS54hZ4cgKIMFG5Sl1rtSFzxH29wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fJRxw4S4PmsbnyYquTXTmcIyivHNuY0t4uzMFeJBvE=;
 b=CwmqYsiT/mQsGa4oI6iiilh9me01PfuXpRAzlkzRdf499fBvxwbTueUCuGNA3yT08wg0mfWKTpsWNZway81CKcdTp3o8c8p3Ji5aHtZZ9h9vsG8vmOZF+JfIPkCiVHBHiaLXkn4s7tO6t3Vq74r/grUDBAs6eN9jyGylxJEnuTPIlxfGzNQBsq3OozRkI/6wYYi92nqpr5c4CMN5kWmtfuQ2zhL9LmzYdzcQXrpHHsx1hAKiug261FmqfILhGDLOTQFwjroeu9UjvuQPe62oXfaP63y1Kftvid/UREnOMyE074kymplIOtiuiAoQuKMZomjdpa+yFfLBGJ38f4kAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fJRxw4S4PmsbnyYquTXTmcIyivHNuY0t4uzMFeJBvE=;
 b=NG0HBkbzW/9CXU31fS95fZZ5oQZtZeTILHviKZGWkYxex/94k5uT0NfUHIirDJI2otNBUsMpK8nnXeJL2/eUY9L+sXb3l5iU5cCzvAuSUHMJiECI8+BirrbzsSYuwqKktCktQUsw3PEZ8Gn6TRuZVEcvnTvdofBYq+DpHk+tDe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <50fe5a44-2e26-461b-1676-abae665816e6@citrix.com>
Date: Thu, 15 Jun 2023 19:17:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-5-andrew.cooper3@citrix.com>
 <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
 <386058fe-e9a8-d0e1-c3a0-3f15a4585bd5@citrix.com>
 <cf30658c-daa9-7e4a-11e2-c56e4513fd8a@suse.com>
 <8a44c577-07e4-fbc4-d402-efa581042079@citrix.com>
 <35ac1ede-73ed-c748-9eae-06b156145274@suse.com>
In-Reply-To: <35ac1ede-73ed-c748-9eae-06b156145274@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH8PR03MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 395ef228-4630-49cd-b09d-08db6dccc474
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bD8h80uB2utnrgVP0Yp5M1cV5Py55cM1TC+khO1KV0mICxMm1fGTi+u/W1TzNhNMxwkClkI+7RlKph9Wm1+if9ciWmjjqBQwTx8JbMwhk2ubFcw3GWP7mM77lpjdFnF0wuQtqi1vR39ouB5bZNAXIiUTgB3yLfbscwWMOzS6dBStUa+8lKdvPtrWorVfmPbmKG8gsCNmWI9PiJihcungM3O+TA/RPoN3KDctKLCbZiJo2U4cmFjDCeXj6+AF4ashZv8vYSMLEXJ8aOVs9ozbTzoXllggjnqytU0tZ4qzxQYH4nXONx66NtQT9ot9ICHsMy7q/cmU6TtEUPTAduRJURRW7cJDFS1Uk+alJmx484cTlN3TAinDS0jiR3ETmoJQELjWV2IiekF3YndPy4i8Fhx9OrqQ7Sgkrv7q97HN5IcFtkXbpahxSlElwLxhGQF0N7MRBFO/r6MI0vJF/LgUWL+1cHOgsgLyojSVzF0oRJzPOxJwD19z8CadIhIBy3xrlJie7p+IeaNhmrbJCf6NVvlaeTIGf9McXp1iBVTt9o8yzQIO3raxP0K+pbVoQ6HtwemGXl7dh3QkqwzMC1jiwtlVwHSN03TU9o9OJxLKBrMChIRXt9uAYLxB6TMKca+Btd/x4ghsm2xxm53KXl6x0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(5660300002)(478600001)(31686004)(54906003)(8936002)(41300700001)(316002)(8676002)(6486002)(6506007)(186003)(4326008)(6916009)(66946007)(66556008)(66476007)(6666004)(53546011)(26005)(6512007)(2616005)(83380400001)(2906002)(38100700002)(82960400001)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1ZnOHZoa0xyQ0RXYkhWdWh3K2hwOTNsR05MWXJGVXBUSnBWb1dlODRsT0Ry?=
 =?utf-8?B?ckU3Z3pSdm9qZ3dhVVE2dFoxZ01rRHdVb0JjVUorYzZlb2ptbUIvNjRValZT?=
 =?utf-8?B?aEFiMlZqK0dwYXdiYkd5V2JOYmFMV2lmMStzZ1lxUmdLMzVvalplNmJXVlFC?=
 =?utf-8?B?UldHemJWYUcrOWhaT1R3ZmdyaWQwcEswemN2NzhDMk9sQXFyUmJYUVZyU0Nj?=
 =?utf-8?B?Q0VGa1JMNTAyWlIzUGRRQTJaZlZRWGkvYmZtMmVYd0tJM2ZQeTlHRi9kYlJs?=
 =?utf-8?B?RzlDdEkvaFB1OU1mQnF3VlgzVXVZRmpzQ2hRNmlxVkh4cE8xN2NZQWZJLytz?=
 =?utf-8?B?RE9yUEI4Zk9NK1A1VDdGWDdWa0J2a1ppZTIxR0dvMjNCTWs5YzZ1S0ZSQ1dU?=
 =?utf-8?B?NVJrU3Y1K1E5eWl6UWNKVE9pUGV6dVRrQnMwRlJXZ3hPRitHalM3K09PcUY3?=
 =?utf-8?B?eUI0bGFQNVNvblV5Q0FSSVFKK2F2eUYrbTZxTjZnY2p5Ukl4MElYWXFiNzBs?=
 =?utf-8?B?TVZpNnh6bmhXaEttbUo1eFlKZ2wzbWl0cnh2dWliTFVMS3E1K1FpalpIdmN6?=
 =?utf-8?B?RDRzRHlqQUNXL2MrNmF4NFIzQzcxMHh2ai9hcHpzK3ZuTlhLd1dmVGZ6bHNG?=
 =?utf-8?B?eTJGS1lwcFVNenBWRkJqWlV3V05nVnRwOXB0QnNRLy9DazUxWWJKT2xtNUtw?=
 =?utf-8?B?OUg5WVNwbHFUYndId1BOdmdEb3huNnZPUnBNb2x5YzMrM3JiT3I3ZXBuTjJX?=
 =?utf-8?B?eDBad2FMakp5R2FjQnkxbUV4dGVIZlNnbDEyWXUyMDlFYU1vbnNQcUtydGQ4?=
 =?utf-8?B?OCsvaUZyVlF1T1BvWlUwQXZjdU9yYXlCQy83eHhEYzJRL0ZxYmdvcElFa0Rh?=
 =?utf-8?B?TUF6bWtMemF4cWx4WkFsOFRGRTM4Q0hsVFZkbXNDYkpLMEh4WEhFalU1Wk0z?=
 =?utf-8?B?eWJlaUxwbG5YQjB5Ukh0akovaW9RbTg1WXA3eWpRTm5WaS9peTU2U2V0ZHJF?=
 =?utf-8?B?QlllVnAzTFNoUXBxbmhJdTdYT0dlSUV4L0M5YklkUzhLL0ZENmhTaTVqY1NT?=
 =?utf-8?B?dDlQNUhBVjE4L2xtN01IckZVSkRJVm85TDZDWWczeFVjcWJSNTFTNVg0MEcy?=
 =?utf-8?B?Z1NWQytlK2MxRjc4NzkxeFdycGZROTE1Qm5aWUlweWFXc3MrMnhyYmxNTk9u?=
 =?utf-8?B?RkhJbHRIdWl6L1MzMVFDbTBVajVaMThncWk1Qms2OHY4eHRyVkVsWDl0SUZp?=
 =?utf-8?B?cGdYM0JWbXlYNC9Ob3NsN0ZQeS9jam5sdFBRZmVjMFFDeEFBQy9LRGQrY2RB?=
 =?utf-8?B?eUNMTERBdXYvRHFIYmJaTmpBTFNiVndvanRKQXZGcndZM1lJRXZ3aDlCTW8y?=
 =?utf-8?B?ZWNNUGdhWUpLV09takJxQzNGV1ZsQzVuU0pWV2JXUzB2YmNLcnZHeGp6akEy?=
 =?utf-8?B?WVNoUnNpRlF5WWhTaHZYZzBjdCthRi9udE9LWmFRZysrSlpIalZGNWRkUEp2?=
 =?utf-8?B?dXRPK0REUTJ6OThreko2UkxxYjBkQkNtSWFBT2lXOFUveFowVnVYdWc4WGRa?=
 =?utf-8?B?cnFGY2ltbEppbThReGxFRTNpbkxMY04yY3BKS3pSNjZvVkx3blRGeGN5WktB?=
 =?utf-8?B?NXArZ3JjRDZtNWhwZDNvb3krR1ZISkhMeko3Wk5jQ2d0NklYOVBDVU5ueFUr?=
 =?utf-8?B?TXFFSis2WXh4ZUU3cFd2TjBzMFBPSW16MVdrNGw5ZElsTjQ5b0pReWs4Q0tl?=
 =?utf-8?B?R213V0I4S0h6cHFpRXNDbTAxeTB6dDJ2L0NQczhRT2xka0g3UmNld0lmRFFF?=
 =?utf-8?B?SC95M2lXR3BVL3lZUTZmWEhCVTl0czluQkFmQ0tic1RhNkNDU3dUOFhLbGlF?=
 =?utf-8?B?YVJWbE9xRDdZVzJ3L0cxZmhCN1hvRFZGa3lzUkZBUDVSd3o2UHM0TjRWVk9D?=
 =?utf-8?B?Z2pQS1lTdmd4dlhOWkxYVzA0bE5oZEVGekdTYnZSa04vZTNiVDJLU1hZVXc0?=
 =?utf-8?B?ZllJeURZc1JKSjNmZTNiNHYwalR0bU52cmVzbHIrb0VlZzFqanhCWGZXK1pa?=
 =?utf-8?B?ZktVeHhUSzhEcThvN0o1ejREL3hEcmNMOUxkdHFFOWpBT0ZxVE5CNzNkVFB1?=
 =?utf-8?B?VHF2eXV1S3o2dVVwL1JZd3JFcUhJZEtpcitUa0JFNlMwNFFtc1psckVZQ0x3?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	celK906iLjdjiv9yTB9LQlgGdrN3/eqzuz1usURSmsg7I5QkzeR6Wqbnz4vIsZ9hsaYHYwr8zt8TKjoZWt5C3X+6/fKZA5BmDShZkHq33kCbATtnzUej3A8Z6129zdC0PEk1RnP+hTtbl1SdXdKehdmFp94MGwc5J2rQN5GvL1l3mRpKZLBl96rwLSNe8KT+ZSv7UmWGhdSDu5stc8WPM+EyDruePecc4mriiKtYfS8DN2hX5X2e3c7xGdesFizEKZBgpO0aY3EhvM537Z5Fj+E9p6QvA/gf+4XjvAFGnL1y29+ks5+Zm1H8zBvLj8TAjw+UvpkkzrZgsmXn+CKqAcnOclNYvxvpfEu+e9YRM+vMp7dkqvNNXKPNFGj/srZWBsGlf+udKSCnRy+x1jTXEzoS5SQM317BUKFVLUQWLOHsdhSQ/3/zqGBGhxf0xdDhPD5nu3Awg2neNem+jtaq8RIk85gB6rUcEKRpiZQBHCjwKDuLOsla5fQi1B0hkORsRvS+/Murd3PdBWOdUzMkemPQ36T0+Y+tpFM9OliVo/3KcTK+0Jw/7xfYqZ8Eb2eaYjR/VTCyNY4X0kzLZXfqEk24cpXAbwqO9xHXFL93d6u2uxu6QKRqXN8KOdwqmcW2CPMEPbNFnr+guEJKjep2vRN4IyiX6OY6mW5zg4Ci7jRpcusWKlGkOQ/vTL+XmpjddWB+IgcIN4QCz2uHPNyTj9+e+hTr1yZel7EzN5kjmZEUksLktA8GFe/Zh9F1WlynKE5/sLX2xB6wiW9H9s56El+j+c3wGrLPI4GIVoZYYzo8Qqe2IwWFrykkvAtMEp/x
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395ef228-4630-49cd-b09d-08db6dccc474
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 18:17:24.3380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnSsJjcyWcOjPjScTZpfe+ZOH1NzGpNNMcxDvXti509uVgAQ2AGpM/BzUFevW2QvnK1DV8F2swt3hCalAEl3baiR393/7RH0uzY6tumYaSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7308

On 15/06/2023 1:13 pm, Jan Beulich wrote:
> On 15.06.2023 12:41, Andrew Cooper wrote:
>> On 15/06/2023 9:30 am, Jan Beulich wrote:
>>> On 14.06.2023 20:12, Andrew Cooper wrote:
>>>> On 13/06/2023 10:59 am, Jan Beulich wrote:
>>>>> On 12.06.2023 18:13, Andrew Cooper wrote:
>>>>>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>>>>>> predictors when empty.  From a practical point of view, this mean "Retpoline
>>>>>> not safe".
>>>>>>
>>>>>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>>>>>> statement that IBRS is implemented in hardware (as opposed to the form
>>>>>> retrofitted to existing CPUs in microcode).
>>>>>>
>>>>>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>>>>>> property that predictions are tagged with the mode in which they were learnt.
>>>>>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>>>>>> alternative predictors but restricted to the current prediction mode".  As
>>>>>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
>>>>>>
>>>>>> CPUs are not expected to enumerate both RSBA and RRSBA.
>>>>>>
>>>>>> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
>>>>>> linked, absolutely nothing good can come of letting the guest see RRSBA
>>>>>> without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
>>>>>> this dependency to simplify the max derivation logic.
>>>>>>
>>>>>> The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
>>>>>> dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
>>>>>> "somewhere you might run, Retpoline isn't safe".
>>>>>>
>>>>>> The default policies are more complicated.  A guest shouldn't see both bits,
>>>>>> but it needs to see one if the current host suffers from any form of RSBA, and
>>>>>> which bit it needs to see depends on whether eIBRS is visible or not.
>>>>>> Therefore, the calculation must be performed after sanitise_featureset().
>>>>>>
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> ---
>>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>> CC: Wei Liu <wl@xen.org>
>>>>>>
>>>>>> v3:
>>>>>>  * Minor commit message adjustment.
>>>>>>  * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.
>>>>> With this dropped, with the title not saying "max/default", and with
>>>>> the description also not mentioning "live" policies at all, I don't
>>>>> think this patch is self-consistent (meaning in particular: leaving
>>>>> aside the fact that there's no way right now to requests e.g. both
>>>>> RSBA and RRSBA for a guest; aiui it is possible for Dom0).
>>>>>
>>>>> As you may imagine I'm also curious why you decided to drop this.
>>>> Because when I tried doing levelling in Xapi, I remembered why I did it
>>>> the way I did in v1, and why the v2 way was wrong.
>>>>
>>>> Xen cannot safely edit what the toolstack provides, so must not. 
>>> And this is the part I don't understand: Why can't we correct the
>>> (EIBRS,RSBA,RRSBA) tuple to a combination that is "legal"? At least
>>> as long as ...
>>>
>>>> Instead, failing the set_policy() call is an option, and is what we want
>>>> to do longterm,
>>> ... we aren't there.
>>>
>>>> but also happens to be wrong too in this case. An admin
>>>> may know that a VM isn't using retpoline, and may need to migrate it
>>>> anyway for a number of reasons, so any safety checks need to be in the
>>>> toolstack, and need to be overrideable with something like --force.
>>> Possibly leading to an inconsistent policy exposed to a guest? I
>>> guess this may be the only option when we can't really resolve an
>>> ambiguity, but that isn't the case here, is it?
>> Wrong.  Xen does not have any knowledge of other hosts the VM might
>> migrate to.
>>
>> So while Xen can spot problem combinations *on this host*, which way to
>> correct the problem combination depends on where the VM might migrate to.
> I actually view this as two different levels: With a flawed policy, the
> guest is liable to not work correctly at all. No point thinking about
> it being able to migrate. With a fixed up policy it may fail to migrate,
> but it'll at least work otherwise.

If you get RSBA and/or RRSBA wrong, nothing is going to malfunction in
the guest, even if you migrate it.

The consequence of getting RSBA and/or RRSBA wrong is the guest *might*
think retpoline is safe to use, and *might* end up vulnerable to
speculative attacks on this or other hardware.

And the admin might know that they overrode the default settings and
forced the use of some other protection mechanism, so the guest is in
fact safe despite having wrong RSBA/RRSBA settings.


I don't know how to put it any more plainly.  Xen *does not* have the
information necessary to make a safety judgement in this matter.  Only
the toolstack (as a proxy for the admin) has the necessary information.

~Andrew

