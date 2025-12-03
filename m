Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3279C9DAFF
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 04:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176417.1500904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQe0W-0006M0-W9; Wed, 03 Dec 2025 03:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176417.1500904; Wed, 03 Dec 2025 03:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQe0W-0006Kb-Sg; Wed, 03 Dec 2025 03:58:24 +0000
Received: by outflank-mailman (input) for mailman id 1176417;
 Wed, 03 Dec 2025 03:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xHXm=6J=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vQe0V-0006KV-Jg
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 03:58:23 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d79291f-cffc-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 04:58:19 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 LV3PR12MB9403.namprd12.prod.outlook.com (2603:10b6:408:217::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 03:58:15 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 03:58:13 +0000
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
X-Inumbo-ID: 4d79291f-cffc-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgcEzmpVj98v3Vuf5W6xN4gKmCEJ44FCE0+p7yVnxvulcYG8pNnowH6KtPS9k8d8w36T2F/waTcN2xhqzNi63JOhszYCuD+TfwF04zYPZzECeS3Y0vzcW8TYtJj/xudaCUOxrsk0Wwc8lkdtUUNyC5hu7fjF+lM6eUDhiHA9CIs+Wb1vGPlBKpH4Bcp59alOIBGNV+zUaP6rkNOb9bgZFvtJ1W3LtGRTnXaYnIQijb9N2Nr2d/fZ5FTp1gt4Gk9IinDFoWdJsZ+RQ4F2W1Egy585c6PKkh/+umZo9UwbjDiLcOCjOZqkkzP5KnIOEm7MwzBjS3KYz4WPHgY9JZu80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlgJKKkJQHNlB7lz9jydKGxQANbBJMrrV0q/RBpeZw0=;
 b=KvWlcnY3u/bIlauCIk0tUJoGWZ7UgUrMN/m7pNDkYL26KRxzkR8dhlJrxHjx8S/U3853PSWVPOCCd4ckxZKZS/bcM7OD/iPfgFstJDD+KmWmqh2BjnyzOyTP6+3bUeiqITrXXrx+iv/2zaBl8ZhU1US7fffB9xqyN+ACWacAqcPCUtvc3ZvuVBFNkDwmwoz+aGq5Yv/2gVpGHoGuDMTVnJsnVAEz32u7OmwvCbk+mmUETU0GZRvNIgLoxXnyDJ9QmGWyiO2s5kjBAvremjYuwYrP9G0twJcHc6Ah4JMGY8U59HUx6M/xR+Fs/hBasiuZnxGxT+0T7C3zeI+o4aganQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlgJKKkJQHNlB7lz9jydKGxQANbBJMrrV0q/RBpeZw0=;
 b=GSM5KVyjLuVuw95jytKvHKitOX6qgXQp2i+G5CqG6stlQpRTmJJHiuKZn7d3tcKh1uTVgBMzidYwI8KA2jLgvtGks9Pq+jfQMO+M+ZUJ25RwBZZgbbqRa2e1u6xd1ghYE2PkvOg3EDhr8QhpAgtdO+DYHhoGSdnoBeaGRYeOqyc=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: RE: [PATCH v4 02/24] xen: consolidate cpuid library
Thread-Topic: [PATCH v4 02/24] xen: consolidate cpuid library
Thread-Index: AQHcWtXJjf66LsUGrE2uxhJqk+lJcbUC9piAgAlt5QCAAB1GgIAC0yUQ
Date: Wed, 3 Dec 2025 03:58:13 +0000
Message-ID:
 <DM4PR12MB8451D17CDE692270AD3084C8E1D9A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-3-Penny.Zheng@amd.com>
 <6781dbd7-ddce-49c1-a359-0910e91bda43@suse.com>
 <DM4PR12MB84515C97AE3F68E676FED174E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a37b1779-6516-4e9a-8736-003c8e61aeb9@suse.com>
In-Reply-To: <a37b1779-6516-4e9a-8736-003c8e61aeb9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-03T03:57:55.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|LV3PR12MB9403:EE_
x-ms-office365-filtering-correlation-id: 1b32b71d-3f7a-4ddc-8e3d-08de32202e70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHVjbEw5V0NydzhqeFkyMk84YWs1NTFLSkd5MFdHNzNIM2RwNnZBeHh2OXYz?=
 =?utf-8?B?WFFJZGJCRWxWUjhLT2QxdXFNbHNLZW85MFNsTzFLTHNDVmNHZ3ZFdzZTQWJ3?=
 =?utf-8?B?RGt2Zk5ibFYyZkk3czQwVld6VDZTQlcrM2M2d3A1ZzllYWlYWUZJSlNpd0Y0?=
 =?utf-8?B?c21YelJ2YmFwNzM0VHRmSWZwMng3YzcxNUo3eXFUdzA1RFlUQW5JUzUyUnNp?=
 =?utf-8?B?SmpjcXlyUkFFOTFiU1dkS0hzTndJZk1OUFNiL2s5YS83MEtNVU5uR2ZhTjRH?=
 =?utf-8?B?ajU4RkVhcGNpcmtCK29XYy9Qb3NZMmIvUFBhbzUvS0JEWVBka2NQckNCTU13?=
 =?utf-8?B?ZzVQQkxhdzQ2U3NWdlRlOFVNa0ExdDZpUEp4RlRDczdIaVdVcXBib0YzbDVZ?=
 =?utf-8?B?TSs3Vjc3bmE2K1RuamIwUmQ5Z1A2YnBOVVE4Y1UvSmpUQndIOWc3bk5ZYk9B?=
 =?utf-8?B?MG1JQ0twMzRobDRCVm9UQ0p6WlRaaW5wMW4yOXNIRllrczk4Q3IxcmdLclNm?=
 =?utf-8?B?VjJTdWNOQWd4Mzh6YVhJdSs5ZkZDWnhEeFlPOHcyaTA4MzMzQXVyc1hOWHQr?=
 =?utf-8?B?aVVlcGZMaG5kaXlFTTBNVXhvK2tGZHNERWtBbjZFYktjM24vd084M2toQU9n?=
 =?utf-8?B?RGxkOXhOcmpYS2xkcVJ2QlZCT3ZVN0xVdVlSMmRJN3oyWmtiWWhOTyt6TFQ2?=
 =?utf-8?B?NVdEbWs1TlRFOUF1RVUrNkw3RG50aXh0d210RFpXdUY0U0xXS3BscFdNTjgr?=
 =?utf-8?B?UTc1amFmaHRYdkNjbVhRdFltaFpDMlFLM1RaWUMvV1pmTWxhN1VJY2F0T09D?=
 =?utf-8?B?YWVUWlloR09JSzZPcTlzbXRwc0l1ZG5YZEFHZEROT3BnL1gwZkFZVjNTZUVa?=
 =?utf-8?B?aFMyMkQrY2NsckFkM1puWUdUQXZ1ekp4dUM1di9oVTJvMDBKRzJFcU9HRlhY?=
 =?utf-8?B?QlN3ekpTb094dTRBQUdqR0hxVGh2anNMeXZHV2hQcy90WGtNU3hFOU85MTNl?=
 =?utf-8?B?blJnem5Ham5CcDIxUXdLczFMNmQrNTVCTHJqNEVrQXpWYjZJZm0yV0NudnBl?=
 =?utf-8?B?eC93bHZBTFdhU29BczFwU2ROQ3JPWC81Rmg3YzR5R0FyeHRlYm1Hdk1OK0d3?=
 =?utf-8?B?ZGJFZGJ1bkI0NzVzYUg1MFZ4YytSM0lQOVcwTHk1Q0xvam90RzFXKzJSL2U1?=
 =?utf-8?B?eXlNdXMxL2FWdEZZRWljRlo1dEViLzJDcE1mNGVSbjdkU21zTGdMNUR1OE1P?=
 =?utf-8?B?NUxrbEc2OVEwYWNpd2U2VzNyMTBGRWhEY3lMbGZ3TVZkcjRsd0V1VStWNW1K?=
 =?utf-8?B?Q2lNRzQ4eit1UjlPbTMvcHdhdU9LRTJEQUk3MTc3bVVvSlZYTXFDclpmb1pz?=
 =?utf-8?B?NmlBdnNzcm1EZC9oU2hEWWxnZllQRVRCZ2VPQnhpMlpQWTYrTGQ5RFlmTCtE?=
 =?utf-8?B?S2ppVC9Mckt3VzI3U1ZsUHNoUFZVbmhyUWZ0WmptUXc2dmJYZXl4SjFDd1V5?=
 =?utf-8?B?K2VydEVhYk5POG8ycXFNWXUwQXYrS1l0TmZCcFU4eDZWMk5sL2tOUmpLUWIv?=
 =?utf-8?B?SkZuTnlwbVgxVUdVcmhzdU1ybTdIRUFJaStCMTRZczNWdGgvdGFwbTZ1THJH?=
 =?utf-8?B?VlRlSlZDTG9xam9lbUROMHdYaW11WDg3VUR6RTViUndTWmFjd1ZwdHFpSEVO?=
 =?utf-8?B?V3BZdG9GL05PTFhIdG9CNmZGZ0dGRUVWRE80cHJ1SEs2d3cxaGJ2eGY0MWh5?=
 =?utf-8?B?RUZLTkRPdm1iR2UzcWZmYmRVcWpjbi9ISDBMMTB2UzNwRXd1amg5WCs5T1Ux?=
 =?utf-8?B?SnV6ZVNEZkFQNi9tRTZOR1AvL3c0T05QWkRTd1p2U2V6M2grNHE0Z3djM1U1?=
 =?utf-8?B?SEkzNTJESHVBSHcreFVmUGZxVVk3c1BKZVV0VWlaT3ZlaWRrbjV0RXRIK2o5?=
 =?utf-8?B?MmY5YTNUUkRTdm14YVpBQWhOd2xmSEVYMkdoRStKTmhvYkF6K2N5YXE4Y1hy?=
 =?utf-8?B?eDRWMUkxaGZ0cnB5K1h5NG9KVVEvNEZQdlR1UGZ6MC9uQTV6NWJ5M1llL1ZZ?=
 =?utf-8?Q?+zc3/X?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjB5dCtMbXhLOHFuWk1FTGpYbmd2dXdId1NQampMN3VvcHBGYk8wOUh1UTM3?=
 =?utf-8?B?TVNMQmlGUmdQT29uUVIrdDhLQXlLbzZ5NThpY2trMFZTMDNyZ1YwL0xWS2ox?=
 =?utf-8?B?eWlqaGlnVFp1UlBWS0w4V2gxOStBTXdnNGNrOHlIa2QxT21WYUdqeU5KNU10?=
 =?utf-8?B?QmgwSUlUTlF6Nk80cnZxQ3dTT0oxNzc1bWpHRjZ0Q3FZOXloT0hpTmVTR0Yy?=
 =?utf-8?B?blROa2NIYThFajZMYXJobFV0MjQ3QW1aNWsvbG50SnJjWFFaMCtQUlZMcFVr?=
 =?utf-8?B?N0owQ1NoTDRwa0txcmk0anlndkZBdzBYc3J5dnA4NHRPR1M4U0VZTXZhR2ZD?=
 =?utf-8?B?ZlU2VWJnNkc5TW1ZbUpKU0xHWVdSZWkzZnBoVTZmbmFuK0krcUt6SnJDZDJT?=
 =?utf-8?B?T2VQZTAyRWJlaGE2U3RNNkNBWEpEampaRGRVK3ppbmJJSkNxT0xhOW1lMWdZ?=
 =?utf-8?B?MGppNElsUUhBLzhwS01qVnd4RkhsaHJzZ0tkUHQzSW81Q1Z5LzRDVXpTcGdU?=
 =?utf-8?B?MEM2T3ZTNmtoaFoydVp4bUdsbGtxL2NNZ0hwUzNnUnVhcU4xK2FJVDVjQTRG?=
 =?utf-8?B?dEV1TFVxQkswY2h2di8zcmI5S1NjbWdSTmJiNnIyY1ArMm9NemIvaW5sTFpi?=
 =?utf-8?B?K1UrNlZMMTd5N3JKZGVablBHMkZ1WEorWDYwd3h6UFJPdFNpcVNGTFNZdi9t?=
 =?utf-8?B?TEU0Qlp2Yk9Kd2U4bEJPR1FkU2JpYzgzbzd1dU5QMGNiQm5wbnhrV0tZNldV?=
 =?utf-8?B?WklLYkVIbGErTFhlMG9mcXJkUU5sNzRDaTR1VlMxbFlvVGQ0UVhJZ0U1THhX?=
 =?utf-8?B?R0Rhd253cmNCRU0rTGs1T3hVTjJRb3BVbFlsbTdNSDFyMGhOOGVrOWp0K0dn?=
 =?utf-8?B?NTFJSU12emxaTC9NcDBXWjBhV1lUdnR6UlFHbk5YYXAzTnllaU9tT1Y2dkFJ?=
 =?utf-8?B?d2FEM091ZWw5VDJNYnJzeVMxT2k4a05UMFVxTkxsVUt4azZ3YUNpN2IzOG9m?=
 =?utf-8?B?ZGttZ3BmVXVLeDVhWGNsczRFRWtBQy9xYkhWRERjY0t4aDhTR1NPRlpvN0dx?=
 =?utf-8?B?dHdBSlhQWEtROVY3bDZzM0c2WDJNb3RBV0ZKYmJSdEI5ekg1SWpDUTBRR3Bs?=
 =?utf-8?B?ZS8zMlJlTDBCSm5OWUVwWWNsbk5pUXN2VGpjV2FYaUJSMFZFdkdsT1Fsb1FS?=
 =?utf-8?B?MWNDSFI4VjlubkIyaCt6bkF0REhreFJBMUo0MFoxUzZpaWRwRDllOENCQlUv?=
 =?utf-8?B?eGpFK0JSRUhLZUtGVFhOaHlSanNVOTg2V245clQxQTJRVVhSbktMNEZ3WHdz?=
 =?utf-8?B?M0dWcE5nczV6TzRTQng0cFl0dklxb2NHMXA0UTBzZERQY1ArZndPb2gyeWN1?=
 =?utf-8?B?VEIvQ3pZK0M5Z3diSnhpc2lwM01MdFJoSFowVUttcDhSSGpEbGlSRFZ1TXdG?=
 =?utf-8?B?M2tRRHcyTldremlMdC9GSGYyMnpFYlByT0w3UlJhSCtNNC8zcGRtVUNoR29F?=
 =?utf-8?B?eCt5U29ZSEw1RFEwVFlGUnh6UXprZFQ3YnNYSjRQbFQxUUx3T1VtWXJyVm4r?=
 =?utf-8?B?MFRidnlUN0orOFgyK3RWTEM3Tlk5UnpiMGtFTWZyVlZmN0lOVUZMenFQcXo0?=
 =?utf-8?B?TEpINFVuTWRrT0Z2TVh4WjhoSVNEbTQ3V3JxaklSOW1rUnJ1TTF1THJrdmQr?=
 =?utf-8?B?L3FicVZHWEl6N3ZZaUJTRVUwRmIyK01JaTY4K09jTGRSMWJEZHB2NWVTSTZT?=
 =?utf-8?B?WjEzbG04bFQxYmNmOHNtUkxrRXZHVFIwT3pGaVJXcE40b05xZE1XaDlGQzdY?=
 =?utf-8?B?ck1OTmVaRnN3QytUVzkxZm5yZldrdVdCbFA0bU43WFd1U0NOL3hkZUR5U2dy?=
 =?utf-8?B?SUxCUUVTY3dpN21QUUxyZ0NIcTlqNkNudmVrRTRMdVIwOGhpT3h5ZmFyMG4r?=
 =?utf-8?B?OEV2cXJpVnU4clVZNVdnSWNCYWVSNFJMWlRHZFlIQUd5WkFFcGFBQkl4aUUy?=
 =?utf-8?B?enc4VHZ1RWZLaWtQRDVvdU1iNVM1YTRsUzJHSDdqb09KL2tWWEQreXNNVjhZ?=
 =?utf-8?B?M1lyVElBNXR2WjlYVHBMaVIxUlo2MzhuRVYrUjVTa0IzNENZdmRiaXl2dDU0?=
 =?utf-8?Q?bzTQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b32b71d-3f7a-4ddc-8e3d-08de32202e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 03:58:13.2530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqfeqEIzD2On2/P+gozL0IAeQxciKyD7GJhzkZN3oEPJUBzuFaOhBBl6/YUUdTSm7+hpS/IMUg0ZPNbGXG8UTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9403

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMSwgMjAy
NSA0OjIzIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0u
Y29tOyBSb2dlcg0KPiBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEFudGhvbnkg
UEVSQVJEDQo+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NCAwMi8yNF0geGVuOiBjb25zb2xpZGF0ZSBjcHVpZCBsaWJyYXJ5DQo+DQo+IE9uIDAxLjEy
LjIwMjUgMDc6NTcsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjUsIDIwMjUgMjoz
OSBQTQ0KPiA+PiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPjsgQW5kcmV3
IENvb3Blcg0KPiA+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPj4gQ2M6IEh1YW5n
LCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgZ3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb207IFJv
Z2VyDQo+ID4+IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW50aG9ueSBQRVJB
UkQNCj4gPj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+OyB4ZW4tDQo+ID4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDIvMjRdIHhlbjogY29uc29saWRhdGUgY3B1aWQgbGli
cmFyeQ0KPiA+Pg0KPiA+PiBPbiAyMS4xMS4yMDI1IDExOjU3LCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPj4+IFRoZXJlIGFyZSBzb21lIGNwdWlkIGxpYnJhcnkgZnVuY3Rpb25zIG9ubHkgcmVmZXJl
bmNlZCBpbg0KPiA+Pj4gWEVOX0RPTUNUTF9nZXR7LHNldH1fY3B1X3BvbGljeS1jYXNlLCBhbmQg
c2hhbGwgYmUgd3JhcHBlZCB3aXRoDQo+ID4+PiBDT05GSUdfTUdNVF9IWVBFUkNBTExTIGxhdGVy
LCBvdGhlcndpc2UgdGhleSB3aWxsIGJlY29tZSB1bnJlYWNoYWJsZQ0KPiA+Pj4gd2hlbiBNR01U
X0hZUEVSQ0FMTFM9biwgYW5kIGhlbmNlIHZpb2xhdGUgTWlzcmEgMi4xDQo+ID4+PiAtIHg4Nl9j
cHVfcG9saWN5X2NsZWFyX291dF9vZl9yYW5nZV9sZWF2ZXMNCj4gPj4+ICAgLSB6ZXJvX2xlYXZl
cw0KPiA+Pj4gLSB4ODZfY3B1aWRfY29weV90b19idWZmZXINCj4gPj4+ICAgLSBjb3B5X2xlYWZf
dG9fYnVmZmVyDQo+ID4+PiAtIHg4Nl9jcHVpZF9jb3B5X2Zyb21fYnVmZmVyDQo+ID4+PiBXZSBz
ZXBlcmF0ZSB0aGVzZSBmdW5jdGlvbnMgYnkgbW92aW5nIG90aGVyIGZ1bmN0aW9ucyB0byBhIG5l
dyBmaWxlDQo+ID4+PiBuYW1lZCBjcHVpZC1nZW5lcmljLmMsIGFuZCBtb2RpZnkgcmVsYXRlZCBN
YWtlZmlsZS1zIHRvIHJldGFpbiBzYW1lIGJlaGF2aW9yLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1v
ZmYtYnk6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0BhbWQuY29tPg0KPiA+Pj4gLS0tDQo+ID4+
PiB2MyAtPiB2NDoNCj4gPj4+IC0gbmV3IGNvbW1pdA0KPiA+Pj4gLS0tDQo+ID4+PiAgdG9vbHMv
ZnV6ei9jcHUtcG9saWN5L01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gPj4+ICB0
b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9NYWtlZmlsZSB8ICAxMCArLQ0KPiA+
Pj4gIHRvb2xzL2xpYnMvZ3Vlc3QvTWFrZWZpbGUuY29tbW9uICAgICAgICAgICAgIHwgICAyICst
DQo+ID4+PiAgdG9vbHMvdGVzdHMvY3B1LXBvbGljeS9NYWtlZmlsZSAgICAgICAgICAgICAgfCAg
IDIgKy0NCj4gPj4+ICB0b29scy90ZXN0cy94ODZfZW11bGF0b3IvTWFrZWZpbGUgICAgICAgICAg
ICB8ICAgMiArLQ0KPiA+Pj4gIHhlbi9saWIveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsNCj4gPj4+ICB4ZW4vbGliL3g4Ni9jcHVpZC1nZW5lcmljLmMgICAgICAg
ICAgICAgICAgICB8IDI3MyArKysrKysrKysrKysrKysrKysrDQo+ID4+PiAgeGVuL2xpYi94ODYv
Y3B1aWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNjAgLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ID4+PiAgOCBmaWxlcyBjaGFuZ2VkLCAyODMgaW5zZXJ0aW9ucygrKSwgMjY5IGRlbGV0aW9u
cygtKSAgY3JlYXRlIG1vZGUNCj4gPj4+IDEwMDY0NCB4ZW4vbGliL3g4Ni9jcHVpZC1nZW5lcmlj
LmMNCj4gPj4NCj4gPj4gQW5kcmV3IC0gd2hhdCdzIHlvdXIgdGFrZSBvbiBzdWNoIGEgc3BsaXQ/
IFBlcnNvbmFsbHkgSSdtIG5vdCBvdmVybHkNCj4gPj4gaGFwcHkgdG8gc2VlIHJlbGF0ZWQgZnVu
Y3Rpb25zIGJlIHNjYXR0ZXJlZCBhY3Jvc3MgdHdvIGZpbGVzLiBUaGUNCj4gPj4gc2VwYXJhdGlv
biBhbHNvIGZlZWxzIHByZXR0eSByYW5kb20sIHBvc2luZyB0aGUgcmlzayB0aGF0IGxhdGVyIHNv
bWUgb2YgdGhlIGNvZGUNCj4gbWF5IG5lZWQgdG8gbW92ZSBiYWNrLg0KPiA+Pg0KPiA+DQo+ID4g
UmlnaHQgbm93LCBJIGNvdWxkIG5vdCB0aGluayBhIGJldHRlciB3YXkgdG8gZ3VhcmQNCj4geDg2
X2NwdWlkX2NvcHlfZnJvbXssdG99X2J1ZmZlciB3aXRoIE1HTVRfSFlQRVJDQUxMUyB3aXRob3V0
IHNwbGl0LCBhbnkNCj4gYmV0dGVyIHN1Z2dlc3Rpb24/IE9yIG1heWJlIEkgY291bGQgYWRkIHVw
IHNvbWUgZXhwbGFuYXRpb25zIG9uIHRoZSBmaWxlDQo+IGNwdWlkX2dlbmVyaWMuYyBoZWFkIG5v
dGUgdG8gZXhwbGFpbiB0aGUgZGlmZnMgYmV0d2VlbiBpdHNlbGYgYW5kIGNwdWlkLmMsIHNvbWV0
aGluZw0KPiBsaWtlOg0KPiA+IGBgYA0KPiA+IFRoZSBkaWZmZXJlbmNlIGJldHdlZW4gY3B1aWQu
YyBhbmQgY3B1aWRfZ2VuZXJpYy5jIGlzIHRoYXQgdGhlIGZvcm1lciBjb250YWlucw0KPiBsaWJy
YXJ5IGZ1bmN0aW9ucyB0aGF0IGhhcyBvbmx5IGJlZW4gcmVmZXJlbmNlZCBpbiBtYW5hZ2VtZW50
IGh5cGVyY2FsbHMsIHN1Y2ggYXMNCj4gc3lzY3RsLCBkb21jdGwsIGV0Yy4gU2VlIGNvbW1lbnQg
Zm9yIE1HTVRfSFlQRVJDQUxMUy4NCj4gPiBgYGANCj4NCj4gSWYgb25lIG9mIHRoZSBmaWxlcyBp
cyB0byBoYXZlIG9ubHkgTUdNVF9IWVBFUkNBTExTIHJlbGF0ZWQgc3R1ZmYgKGFuZCBpZiwgcHJp
b3IgdG8NCj4gdGhhdCwgdXNpbmcgI2lmZGVmLWFyeSBpbiB0aGUgZXhpc3RpbmcgZmlsZSB3YXMg
cHJvdmVuIHVud2llbGR5KSwgdGhlbiBpbW8gdGhlIG1vcmUNCj4gIm5hdHVyYWwiIHNwbGl0IHdv
dWxkIGJlIHRvIGhhdmUgYSBzZXBhcmF0ZSBjcHVpZC1tZ210LmMgZmlsZSwgd2hlcmUgdGhlbiBm
cm9tIGl0cw0KPiBuYW1lIGFsb25lIGl0IGFscmVhZHkgYmVjb21lcyBoYWxmd2F5IGNsZWFyIHdo
YXQgaXQgdG8gbGl2ZSB0aGVyZS4NCj4NCj4gQW5vdGhlciBvcHRpb24gbWlnaHQgYmUgdG8gcHJv
cGVybHkgbGlicmFyeS1meSB0aGUgY29weS1pbiBhbmQgY29weS1vdXQgZnVuY3Rpb25zLA0KPiBv
bmUgcGVyIHNvdXJjZSBmaWxlLCBhbmQgdGhlbiByZWZlcmVuY2VkIGJ5IGxpYi15IChvciBsaWIt
JChDT05GSUdfLi4uKSkgZnJvbSB0aGUNCj4gTWFrZWZpbGUuDQo+DQoNClRoeCENCkknZCBwcmVm
ZXIgc2Vjb25kIG9wdGlvbiwgd2UgbmVlZCB0byBsaWJyYXJ5LWZ5IHRoZSBjb3B5LWluLCBjb3B5
LW91dCwgYW5kIHRyaW0tY3B1aWQtbGVhdmVzIGZ1bmN0aW9ucy4gTWF5YmUgaXQgaXMgZnJhZ21l
bnRhdGVkLCBidXQgY291bGQgYXZvaWQgZnV0dXJlIG1vdmVtZW50IGluIG9wdGlvbiBvbmUNCg0K
PiBKYW4NCg==

