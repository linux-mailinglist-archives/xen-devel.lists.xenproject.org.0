Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC66A2355
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 22:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501576.773402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVfBp-0001R8-RZ; Fri, 24 Feb 2023 21:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501576.773402; Fri, 24 Feb 2023 21:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVfBp-0001OA-Oi; Fri, 24 Feb 2023 21:01:13 +0000
Received: by outflank-mailman (input) for mailman id 501576;
 Fri, 24 Feb 2023 21:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6FA=6U=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1pVfBn-0001O4-7H
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 21:01:11 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a66a23b-b486-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 22:01:07 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OHhrd0013916; Fri, 24 Feb 2023 21:00:49 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntnf3p6e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 21:00:48 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31OJRJfe017909; Fri, 24 Feb 2023 21:00:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4a8x58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 21:00:47 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SN7PR10MB6306.namprd10.prod.outlook.com (2603:10b6:806:272::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.7; Fri, 24 Feb
 2023 21:00:45 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606%2]) with mapi id 15.20.6156.011; Fri, 24 Feb 2023
 21:00:44 +0000
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
X-Inumbo-ID: 5a66a23b-b486-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 message-id : date : to : cc : references : from : subject : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=vOy8hyoDklmMCHfsfyOOAR4DHQhdsA9Rm1ZTeHKciwQ=;
 b=Mqc/efwvPzqVZF3LG91gxwN4rtCNrUavcW+4Ye1g/F2k2It1k7KYpiO9uESrLmd9Zupi
 IJbqWdtMkMCKuAFHxEypx1/rUBB/8fRN7zUr7obk9VYE5dfx0kCqfaziBOlWpdX8K2T6
 yUORg59st/2GJhLyZKWVJ+wTCDbgUlh5sgYHFSA3Y+/IpeyzCKD3oAJN55DO2QCs/YEZ
 KHoRUJ7ZufHCOTDW5Cua7hUU5UATQp40KrnZOOCRBvSECSGwir3Xt2CTmPYHRjaYvbIn
 r7QqGRPXPhKz+M4ZkICIaCuzHAuS8FkYRmSM/i2BlTIfj3ehuaqNBiGZr9CyygO1VZyv ow== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOHIc2pcFDJSlp/HX4QCNJU9g4fJp3VEjJhHnMtPYNwImc7O98HE2ezcHlmTj4W7BNtTGMezhHRZ+gqmr3NjaEjOKHPj9fl0AB5eGKmIllJCDEy68dpHMMM8CyjHicxhZXV8Wqm4mQ5zbzSSf/yV9I5EGhlXZjM10C1fBmW3/LO0GEcWG/jgCumNmQDRXgcAJ878UGecr4kzxR8JUHbG73dKxlCkNN4NaL32QAfK0hEbcPtC7S3kO4zfflEkpMoLDCG6gmO7RCtPWMnj9jYuap67z8C9Tmcn30lLaVqTmFg1HE5Y+JM32IQZ/yum+tSA3bnyexIgFUWcYKTGmreUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOy8hyoDklmMCHfsfyOOAR4DHQhdsA9Rm1ZTeHKciwQ=;
 b=c9aoe/D3yttUeNw5Kl0MG3IIrwh2mRSB66ecZ2P01QLzbi8GriUvqWSxpG8qpXBP0xvGapguhT5gizL/xON3qjvXf1w15xgdE2Em2CPGsqJIhnxxFGpheUR0slUUUzvjIYf9bkrQE7bt6CzlNDo8P2ydzXodUdTwZ9yBqabiIaaf0ZQKPzs4YoPkQ5Yo/j1E2mt+eVU1m+xbiX8xZbpIzp2g/xXNX2WMoxFvunprtX4tYt/mxrd9I6CluVM0DPfe72UeBQusDyZHZ0JsmncSGA706WD9EKCgqNM6nqu1GkLuaLoyVfRdoHnm5VUvY618gJ/NUl1saV1p+CWiFe+NXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOy8hyoDklmMCHfsfyOOAR4DHQhdsA9Rm1ZTeHKciwQ=;
 b=IgnfMxoxeqTY3qKmEZVWI7QJNZ2lDQv7MnJitGd/jsU+YUPnNAO8vaL/WX1gTS4mfbwfpLJj18hgGdP983IJUFizhXwyDlTqTJ4Kmaxbsl3Bq7F+t5Kfyh0Crl+cdY2qf3Cj5IOfVu4bfpbH3ty42nmrJ0Llg+LEqM4HudWfobM=
Content-Type: multipart/alternative;
 boundary="------------uotFtvk1TJ01T7YycLlyAdqY"
Message-ID: <a7897030-d420-a741-074a-6e21e7c1629b@oracle.com>
Date: Fri, 24 Feb 2023 16:00:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20230223093243.1180-1-jgross@suse.com>
 <20230223093243.1180-6-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 05/12] x86/xen: set MTRR state when running as Xen PV
 initial domain
In-Reply-To: <20230223093243.1180-6-jgross@suse.com>
X-ClientProxiedBy: BL6PEPF00013DFC.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:21) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|SN7PR10MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: e5315b1b-3504-4f62-7559-08db16aa324c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DDbngg3yay68QbKCVmIhheTuzjAVnlid/6E4H/LeSEHeLZet45j37ae09slk09tNAD8fX/B89YRs/OBaVtSRK8R5DhdJinX7rYreRwGwcR2rR7yw5v0WjFx9JHVZLfBQbZzkc0J086i/q7uwCs80aHI6k0fLGSXxl4XTOEup+9g6CvN5i7f544L+lw2J9MHkitfob8yXr4tq/cmV+tmSP71mhoujSrbrV/+JUxy8ohf/xhAaYQ2Llg99RSqRnASYC0lpF55h0PWPuQGEQcCe5XbgP3XnMbhTlozcUTWNlOIbu1d1sL2PNJEQaEFWK49f0MQxVZ0JSXCuccouppgIbG9+/WI/3DQrLwAGpLe1QRtpvoj1dACD0Ab+pJir7ggFTUF8pUZHQl6kLjEYjCO0DKv4OwlJdKl29LQUqEPEgRyhZzoBBl07T/q9c8HwZjvaIt1V4VS6ZvHMcNEX9Qh7sjzqeeai+ae1T8saZb4Wj7q+sSAyf6RopVtm/XNvD8syChaWMgCr6zebrG/NFYHaMrRaTKVShkegv5GR+pKHMfeqdYNwpjNWYtsuckAJ18JeGQUEELH9pmHncww56qm1qcB0En+ffNRQOUGtekv54m30N+9ibAFgI3JG8s/aAx5F5Q/a2CatJ3D4Kf5o3QDkP9rFbKpxx+VNOkL+3rqNBgvaPmKAAPNHTWoD5eAHSBhe0jMAn758HYUw9w7Gak+nlZR+7JWyn62wvzmyRhOV5xU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199018)(31686004)(44832011)(86362001)(31696002)(2906002)(38100700002)(6486002)(478600001)(53546011)(33964004)(26005)(186003)(36756003)(6512007)(66556008)(66476007)(54906003)(41300700001)(4326008)(66946007)(2616005)(6506007)(6666004)(8936002)(8676002)(316002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjhPNEhyK0VUVDZKYzRPYmRRN1ROMlRWbFJRK0RENG9JVFpMYWZGMTRGMUZG?=
 =?utf-8?B?WmRDTHZXYUxVTVJlS1FTMld1U0lzMXg3YW9GUHBJSmRWcGo1OE5Xbk4vOHkz?=
 =?utf-8?B?eS93OHB6M1FXRXJqK1dYdmdlRlF6UWt4K2hoMDJuMFhoNHBvaTVQcnBQYTRX?=
 =?utf-8?B?ekpOQ3V4QzdubUxLZHlycUVzOWo0cEoyWGs1U2pGRUR1eVkrMERsLzdmZ0VS?=
 =?utf-8?B?NUNEcnlpYm9TZXBBQVREUCsxNFR3b2xLUTR3Q2dKdlF1ZndJM1l6MnNRMVdr?=
 =?utf-8?B?WGlzTS9TTmNydFZUM0lIQkRDcS9qbTZYdmoraVdjWnY1VTNuSUF1elc5YmJu?=
 =?utf-8?B?S3R1U081M0pFcHdiSGJ5SzNaa2p2MGJMbVVxNXVSTDR2QjJQdGVCbVFlR1lL?=
 =?utf-8?B?NGhaUUcxMjdabkRDU2EraFJraktLRzJMTXFmR2JIWDFkenZ2UEZmaHk4bWNt?=
 =?utf-8?B?NUpLLzFyQ0xqUkd1SUxIT05Rb2dUbURPMVpsSkR1L0JrSWVsK0pJYmRaRWJk?=
 =?utf-8?B?VVJlK3g3ZFR3NHI0NnI5MnpieFVqdDB5dzROTVlVMW5lcmtZcjhYbDVVRnI1?=
 =?utf-8?B?SjBoempaaHZaWHVKN0w1T1N2TzFtOElxZkRDQUc4bTZnbXBKWjRSYUpJQ0hC?=
 =?utf-8?B?YXBhdVgwKzBlb0VGUGJNa2tvTXp1UWQ5emp4TW5uWEltelRwU0hDUWR6OWor?=
 =?utf-8?B?RXdtREE5OElSMEZlSUZuZXpRWXNaUFZrb255ekJzZ1VOMXFnbHRJZkRNT1pV?=
 =?utf-8?B?SE9zRTFROHp1VnBpOEtjeEo1VVVYM0RuVFhQWGdvZXlQd0ZNOEZUUjlJb1gr?=
 =?utf-8?B?SlVGdkRUeENXQ2tJUS92TWx2M2xZNGdZSHlBdDlQN1NkbngwY2dUNXdZTlZI?=
 =?utf-8?B?Z3pQVGV4THNScW52N0Y4Sm5MU3JrM1FvTmxDWVo0MU1VR1N3VFY1c0NZeDNR?=
 =?utf-8?B?YjlyNkZyaDA5clhoZVpyK2V6Mm1ycmFDL2dMTm11YXBPREpiM3dMKzNjRFRM?=
 =?utf-8?B?Q3BJcDErakYxL0orb1ArdTFZQUt5UHZIR2o4ZG9zQUdHeGkrbVRQZlNHOFMv?=
 =?utf-8?B?RnBoMFdrK21ndmc5cjlNWll5dmVDVWVvVGxPSnczV05EMC81UHlqWE1keXIw?=
 =?utf-8?B?VEptcEdPUjFNNzhqaytZc21PZ0IvcThNaGU4bzZOY3lkRmRRYkRSQmJUYzll?=
 =?utf-8?B?di9yUUlETDVDb0R3NkVWb3lpMVVsanVrTDkzaDRYdzBrckovbUV0YzJ5UTR0?=
 =?utf-8?B?RDlNMUc4Y0pJMDNtc2p2UDRrek9halEwSTlFTjM3VGl4UjZUdFFIZWM1aXBa?=
 =?utf-8?B?RVlLUGxaakg2UmNRQWdTejZ4MFZma1lwZFJUc0NvMXFmV2xFRy96ZS9nbFhT?=
 =?utf-8?B?NXVXdmRMZ1pWRVBGaUNtaVdGbWh1NUkyU0xXRkxrUlhjQnRtY2x6dFFjaDd1?=
 =?utf-8?B?Vkhhc25BdzlTcC9Ka2ZIWVg4eTFjbWpTZUtzNi9tbUs4aVgwUVBXbUdVUjV4?=
 =?utf-8?B?L1VNUEw0bWJJdlBnNTJvK1ZRYjNJUUlwdFpmWHRaRTQyaUI5ajFsRjJ5TU01?=
 =?utf-8?B?bUpaQnlmK1Q3UW1HNmxqV3hqQW5TOHJzeEttTmZ2cGpXdmtTYVprNGUyZFlP?=
 =?utf-8?B?dEhyTzRmWHlwREVOU3kyOE9ENmpTSituRTlacFFZQ3RFMjRwNzc3L0EyODJX?=
 =?utf-8?B?bVNYWnhmYTdBTFUvNklPcWlVUE00WC9zc0l5OHJDMGhoOXRDVWU0dVlOMDRL?=
 =?utf-8?B?R0lIT2R2eld3c3Rub1JvUEY1Tkwxd2ovakxGSVVJbnJWanRjdXVCcHdoYmZM?=
 =?utf-8?B?akI0Zy8xcWMwaWU5M3g5Q0ZjN3JJSFJRbUY0dmVQdWYxclVRRldtaWZYbXRj?=
 =?utf-8?B?TDUvWDJwSVFoODdQNkpjUlBZeW44cm1QaVFaUE5LcFdqNUR1VUZlVkZDT240?=
 =?utf-8?B?bmxLL0lKeFl4dkJMbTdzVXFZMGp4ajUwam9IRlRiMElwRFlCOTVsVytSMmdV?=
 =?utf-8?B?eFN6VytRTkdwYklDMUxBcFJpWUZ6bjRiODcrb0w5SmVLd0tWSnNlLytRWTBu?=
 =?utf-8?B?eDFXaWZQS3gwN2c2OTNCMjJtL2w5YjVaL2U5S0dDTS9IWTRzSE9Wdlc2TCtz?=
 =?utf-8?B?NnFGSS9MVUxvSXFvYXlDWElDbWJPekFoY1NoTk0wZkNMcHRjclJlaVZzUDY3?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?Mk40a2VaeWtMUVNVL2ZQMWJqNCtXZE9XY1kyWHhucWo1TWpKWlJyTXF3cElz?=
 =?utf-8?B?NWY1K3VtVTJlL0ltVldzMzlZMmYvZ3Y1YjQ3Q1ZrVzdidWJRMWRMQ2hPVWpM?=
 =?utf-8?B?UVBUbVlYNDlPaUhkbzh2VllvT0RNWmVCbXBMMkFETmRoNjI1SWpLaEsrZGI2?=
 =?utf-8?B?MnNRL2EzUEt0KzZEd0tHOXNDb1RiZUxPUzNpZHBqbE1ac0Flb3lsZmMzMk81?=
 =?utf-8?B?TVpPaHlXUEJ4NmtaVHRyNW51ZjBPQ2FkVnMzME9pR3lkc3RZd2prSVhXVWhV?=
 =?utf-8?B?WkV5Sno3M1g5Vk96VjhsdHlRMjZQZU9oY1hoaXljWGN6VDYrZlhrZm9LdFIr?=
 =?utf-8?B?YjhyckJzTUlSQVJzNTdBc0xtcklmUkNMS1lSQ1hFek9RZXRSWG1Uc1pXTTZx?=
 =?utf-8?B?S3BxdjVtVFV0ZUE4KzRtai9hdG9EZWpmMmVWUlo5WG1kWFRmYzYvblZnNzF1?=
 =?utf-8?B?cnRNWEc2bFV2eGNRT0dLNlhGMlpUT2xyM2JyZ0NUNXBrT3JRMllPaG1hbFQ1?=
 =?utf-8?B?V1hUSGR4T1VWaDU0QWJ5eFdFWlR1VmFVUTh5NHowelVWMXlvdHJJTFFsUExa?=
 =?utf-8?B?dmhhd3ZVLzVpOEJuRkM5cmZGUktqa0Y4MVhtZFFZc0tGSFJCbU5qMlpkQmQ3?=
 =?utf-8?B?eFIvZmdOejdGc1BTQitHNlU4eFpnaGJnRitVOG0rMDFBeURjLzN3TkVlK1Js?=
 =?utf-8?B?M3NSZndpeEF6Vzd1QVpZVUFRd3VUZE5Zd0l2M3o5MnowcVNaWm01ajYyRmt6?=
 =?utf-8?B?ajJ6b3VlSXJjU0N3a1FpTi9DLzh3RmJoN2NnUmtjK1VDYVZRUldPZmtsOXlE?=
 =?utf-8?B?Q2VDVlQ0eVF4NEdCejBxcUNuT21XanBqUTNySEd0WnVlb3FiUWpvWHNqd2Fz?=
 =?utf-8?B?RU9PTStza1hCYUZURmhvM2dwdGx1VFFNOC9NMXBLYXpRSkhEZUZDT25UYm5k?=
 =?utf-8?B?QmpGUHpidWVaR0V4Wm45Ti9SQkUxcXRyczIrODRYQmFpNUNFWFZWdzFnRWR1?=
 =?utf-8?B?SzRaUVVyb3FSVTBoOWpMQlFjSlYwZVFYMk1BcVMreExrV2gxckZrUXV1c09r?=
 =?utf-8?B?aDlpMWRuc09QamhiL09FNjYzZjNvRExLYzU0TkJQRmZwbjdycVVOWitSK3Nt?=
 =?utf-8?B?QjQ2MHpyeHVOVUt3YW9UakRZeENCaFdFZlRhOFNubFFWeDdLM2xqNUJNYXc0?=
 =?utf-8?B?ckl6OWVjN0RCeFF0ZlpnSHh6dm8zZk5GR050a0cvZUZzTlJNeThTaTY0cXBX?=
 =?utf-8?B?UHJ2MWgvSkliTDVFYmJlTlBSa0lmaDY1TmdRNWdiV3RucVBVK0NWQ1pvL0Q5?=
 =?utf-8?B?SU93dnZUQmNoZ05BSkxMcWZvbGtaeGtjcnRtUlRXV2ZMb2pWelNzOFJGUmNR?=
 =?utf-8?B?aDFUb0RxVkUweWc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5315b1b-3504-4f62-7559-08db16aa324c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 21:00:44.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjB88uS0vXjeEM0401Nz1x2cQ/ydsaXUutLTZLfBKYcRlw7BqAT0yVTGQGQh8btKx+mTjXFor7ItLdXQtfohTYr9WSvJ7Re1wT2pJ1UIzoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6306
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_16,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240167
X-Proofpoint-GUID: 49OyB_PtiI9uC9bpHgjiHA5PuqX_GZt3
X-Proofpoint-ORIG-GUID: 49OyB_PtiI9uC9bpHgjiHA5PuqX_GZt3

--------------uotFtvk1TJ01T7YycLlyAdqY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/23/23 4:32 AM, Juergen Gross wrote:
> +
> +	for (reg = 0; reg < MTRR_MAX_VAR_RANGES; reg++) {
> +		op.u.read_memtype.reg = reg;
> +		if (HYPERVISOR_platform_op(&op))
> +			break;


If we fail on the first iteration, do we still want to mark MTRRs are enabled/set in mtrr_overwrite_state()?


-boris


> +
> +		/*
> +		 * Only called in dom0, which has all RAM PFNs mapped at
> +		 * RAM MFNs, and all PCI space etc. is identity mapped.
> +		 * This means we can treat MFN == PFN regarding MTTR settings.
> +		 */
> +		var[reg].base_lo = op.u.read_memtype.type;
> +		var[reg].base_lo |= op.u.read_memtype.mfn << PAGE_SHIFT;
> +		var[reg].base_hi = op.u.read_memtype.mfn >> (32 - PAGE_SHIFT);
> +		mask = ~((op.u.read_memtype.nr_mfns << PAGE_SHIFT) - 1);
> +		mask &= (1UL << width) - 1;
> +		if (mask)
> +			mask |= 1 << 11;
> +		var[reg].mask_lo = mask;
> +		var[reg].mask_hi = mask >> 32;
> +	}
> +
> +	mtrr_overwrite_state(var, reg, MTRR_TYPE_UNCACHABLE);
> +#endif
> +}
--------------uotFtvk1TJ01T7YycLlyAdqY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/23/23 4:32 AM, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230223093243.1180-6-jgross@suse.com">
      <pre class="moz-quote-pre" wrap="">
+
+	for (reg = 0; reg &lt; MTRR_MAX_VAR_RANGES; reg++) {
+		op.u.read_memtype.reg = reg;
+		if (HYPERVISOR_platform_op(&amp;op))
+			break;</pre>
    </blockquote>
    <p><br>
    </p>
    <p>If we fail on the first iteration, do we still want to mark MTRRs
      are enabled/set in <span class="add">mtrr_overwrite_state()?</span></p>
    <p><br>
    </p>
    <p>-boris</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230223093243.1180-6-jgross@suse.com">
      <pre class="moz-quote-pre" wrap="">
+
+		/*
+		 * Only called in dom0, which has all RAM PFNs mapped at
+		 * RAM MFNs, and all PCI space etc. is identity mapped.
+		 * This means we can treat MFN == PFN regarding MTTR settings.
+		 */
+		var[reg].base_lo = op.u.read_memtype.type;
+		var[reg].base_lo |= op.u.read_memtype.mfn &lt;&lt; PAGE_SHIFT;
+		var[reg].base_hi = op.u.read_memtype.mfn &gt;&gt; (32 - PAGE_SHIFT);
+		mask = ~((op.u.read_memtype.nr_mfns &lt;&lt; PAGE_SHIFT) - 1);
+		mask &amp;= (1UL &lt;&lt; width) - 1;
+		if (mask)
+			mask |= 1 &lt;&lt; 11;
+		var[reg].mask_lo = mask;
+		var[reg].mask_hi = mask &gt;&gt; 32;
+	}
+
+	mtrr_overwrite_state(var, reg, MTRR_TYPE_UNCACHABLE);
+#endif
+}
</pre>
    </blockquote>
  </body>
</html>

--------------uotFtvk1TJ01T7YycLlyAdqY--

