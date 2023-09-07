Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEB779704F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 08:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597114.931302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe8ls-00051p-59; Thu, 07 Sep 2023 06:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597114.931302; Thu, 07 Sep 2023 06:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe8ls-0004zI-1q; Thu, 07 Sep 2023 06:45:44 +0000
Received: by outflank-mailman (input) for mailman id 597114;
 Thu, 07 Sep 2023 06:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qe8lq-0004zB-Pk
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 06:45:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2981037a-4d4a-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 08:45:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 06:45:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 06:45:38 +0000
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
X-Inumbo-ID: 2981037a-4d4a-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hw7TYHLVzT0q11XKnZWhKFkV3mSMbXJ6kJ6Az3KqqJe2+i0cKeYDwufUCjIV0PGsB3hLltwqb5SVfwM3XQp28Rbu2peiy1srNe2BF58dc7/RVOb2WoBS6KTy7Ae23nkQvTJD3jpcmAuMotcC9+28jqy0EQPIEmX3V2soGvlbY54xO0HzK2NUO3Omn2k2kby43Xy6qZD60g8wZA1+1rAyx0nJDXPgEyM7gcPCKo5ZTcqagaFijx+tROAKQuk6T+YpiHmzwJjKjKexPsyQDJWxMgUvtJLIb2E9BaAsz5lTXr47HGJeX5RvDA4x/ZmhSaWxlp77sJ3E8FmY6+25XCzh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTEq8pADGz2EO+j7a4nuwMYO9LhYm+ZTH593a7lhEyU=;
 b=QxXlHiJOPMGWsgIIJEUEWgubg7YQFFZ4eQeJoYO7FvMdTFr98YEi6GEXivg/6/wjtnJyXlWWsjLG1Wmk+jb4S9oWdpB8tjWGQ16gFFrPXg93tANTqHtZqVU3YIgqxe/deWIncnQQ64EYF4tcbZMs/jB0s09UgUfRWDxT85SBDHoKfnyIX4d7k2kGLgHP3DhS6udzQnnkv4TZZjc7e1VRib0zRf8UWMZRSnZcTXPwskdFSEmVORnXdGghfOLpVQ7E74Mr5AjrI98DdEFWHogNePgW+q9rxFYTplD3m6w8Hf9XTupppSC9mG4CbDN1WpjAh2Lt/1B02riMXfRz5SnRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTEq8pADGz2EO+j7a4nuwMYO9LhYm+ZTH593a7lhEyU=;
 b=TRrO8OMQALRsQ9bCV6VK2mh3aBF5YLw8s3gRbXOBAYhKKwMH6hodD5oUOvaItg8b4AQ1tW7UZIa7xLWmC7eRrCVf+CIPxaJ9gFqHHFryrElL3W2Z65A2yssU4vhUfV4xI5cwr9ijDVJPk4oFpV9/cx8ZeNGSJ8w7ORYYpvLe6vXiU8SzgshAM1jrofD6vgPZdmJzFxtBu9k2ogVvLEy1Ht5lXx2fRQshInXEDOQTbeGpLUERv7Eqt9cb61ObWaLZmap9YZwMlaVruSvBnBvcUUziBr3vPlmWGQtDmxdo883/qp4bIqJKmIFwPaYDmb+0qut4EOGqQUMPY91tEIEQgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86d27be3-a6bf-9b52-2d25-0e398f742942@suse.com>
Date: Thu, 7 Sep 2023 08:45:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] docs/misra: add 14.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230831015316.531167-1-sstabellini@kernel.org>
 <58f72b39-701f-6f7a-eba7-fa685d35b8cd@suse.com>
 <alpine.DEB.2.22.394.2309061819150.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309061819150.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 705fcaea-4e15-4f3e-7c05-08dbaf6e0bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oMRS4cZDr0jqrUmk0hhxy7VKPy0feNldiYwLP4VBSy1Jma3PqnOBo3alUCZGjIe9MMccjDtQ/MSO+214QIBcofHFXsCadtjFx5xiKErvfyockXUsmQEYFdA724B3+eIeYa5ZnYasL59d0wLCAvAjmIoJHBioL4G7myke3Vvf23Vz+TbRnkKkI0iDGiis5bb8QcL8v7cmGGykRSgWFfkYcOTOdvhYygD2o1S0K7yY3etEdbIOWyQPCtIqmFATF6lcxeMGTr/oe+0mWjaqWB0PGwKmdX58DNkNUgHg72leYTEMSTWJreTclrEk9ID7sKYhJjnQjkfpcA1bduxznmhwagsK8GFNVwg+vEjRtlW8TaFZ7dfnkFFIcbGZ3XQN4cMbWJxgC6fbSp97GVCEORMsSI8mGCm7Kk1uQnHuv86KsAJ2w17GelwvSU472P/e4CxWwzGZVQAjkpTKCQOG7+fpQyWYlScermm7uv0l74epMbuK+/UEC5y8iX0M2knHF9cLt95k5rgprepL40oR4V5yr/f8EPiGUmmbWxOfQhkdnsvTEFSmT0gQqzorw6pHL2EbVq3iQO8LwNLWqX97XSlJBtm78ulu6rORZ4UCsRLKawLz2+SycRQq+P+WxcmunizsI5HU4ijFQL/SweJlyOqcQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(1800799009)(186009)(451199024)(38100700002)(36756003)(86362001)(31696002)(478600001)(2906002)(6512007)(53546011)(6666004)(6506007)(4326008)(6486002)(8936002)(8676002)(5660300002)(31686004)(66946007)(6916009)(316002)(66556008)(66476007)(41300700001)(7416002)(83380400001)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3FnRGsyUlN5L2hENkRiWVN6MkcwcUJ1RXY5aUhzMXUwUVMva3RucC85ckJu?=
 =?utf-8?B?ZmdKOGlycGFBaWZZWU9pTTNqOCtMK09pVUZKTUh3MG56Qysxb0FLemc3V2Nt?=
 =?utf-8?B?V0NiYWRGZHdHZ2xBdE5sc2I2NndOYzhkRFluWmpuQWZ5RGc2MG1zRE5GNE1N?=
 =?utf-8?B?ME44RHRJakNjOGltcHpVb3plMTIyL0JqL3dLV0FBUUdlRkVuMTI5TDEvNWcr?=
 =?utf-8?B?L2JnVTQzNTZLWnhkMGZ1MFNoRXpJWEhSUDNqb3hrUDkwYnBQRWJNZFFERUV1?=
 =?utf-8?B?ZjF4L2czVmI3dUdPQmpGYSsrNkxjSHVDZGJCaHJYQzBoVk1BOXZoWTBycm9B?=
 =?utf-8?B?L3lKNW9zcE5vdjJtdU1CV3VoUTVqVHhwMWQ3N1kwcnpGV3ZpbzZ4djcvNkc2?=
 =?utf-8?B?V1hVViswWnV5aW5qSi9PWTV5cDNiR0s4R3ZyTjNVT0tmRHBMZklHYzVzTHNh?=
 =?utf-8?B?b0QrZEtxMmFNNUZHamx0VjR4UmxuMG9hbHp3QmVWOVZ1aGtueThxYW9JOTdw?=
 =?utf-8?B?bzlYTHNyR2wycGJaZ05nQjUzL1plTm02aDFMenZjQmpCNjFKYzZ5YmhlNjVO?=
 =?utf-8?B?Z04xNE42OVlXR2puVHZXTGxaLzFGL1BONkdDa2pSQ3RxeGQyV0pBWC8rQVdw?=
 =?utf-8?B?VDEzVDFTZFRJR2o0M042Rk4ydGkwWWc0WVk1TnUraW41cFhYWjNrS01yZ2dy?=
 =?utf-8?B?a3lZbzBhM01rQ3dJREJzQ3hobFh4VER1SFQ0d3FTUVE4c0Fua2lMQlNZR29z?=
 =?utf-8?B?KytVZjBxM28rdzJwMXFYY1JSMXBDUkptQ1hHQk1oTGJPaTc1cjJleGd0dEVL?=
 =?utf-8?B?NkRpdjJ3QmttMkNNN1M2YnFxd3Rick00VXRKZzRLRUZDMFRSK3NtcFdVa2Yv?=
 =?utf-8?B?aUxzcTcvcHhobGlSbmw1STNZVERkdTMvQ1lQWFBpYmljejU4S0tsSXFLL2Ja?=
 =?utf-8?B?L0lDb3Rka1hmelNZRXdxVW10WFBmQWtabHlTYk1CYnBIS3lLTkVZMHdGOUJQ?=
 =?utf-8?B?ZkQ1VjVnYVZJbGNVZC9vbEhubWhKTDAzTlAzdjBQa0ZUOFdxRFpvd0pKWnN1?=
 =?utf-8?B?dEc3T2pTL1B4dmNDUm1wRUJ1MjhYQ0FnUWwzdGxGNnZZRGhaMHZXMGozdTYz?=
 =?utf-8?B?MS9YMjNqd3RHSW93UWVPYzN6OStoL2luMlp4dU03b3UwRmYxM0FVWm43Qlly?=
 =?utf-8?B?SzNzY2psalpnNm84TUNmUy9BaytuR1JTcjkzMXhUUWNjMWVYNGwvMWhJRDAx?=
 =?utf-8?B?TnJuVFEvbWIwc2VuTmFhVUxaMkNPU1BORFJCVlBHUE15aXNMSUg2enVwWHdV?=
 =?utf-8?B?QmQ4b3JyUDJnSGxsVUdKRnhVVUhEN21LdzhLUzFaWFgxbFJVR295a2RRNVg1?=
 =?utf-8?B?UVk5aHBpR3phdE5panZ3LzRZZ2xZMzlWNGpjeC8wZkN3V29OVWoxVTV5N1JQ?=
 =?utf-8?B?c1RudU4vQzhvdWFXMEtoNEYxN1RyV3kxZ0ZUYWpPTzZlQWQ0Wit1bWI4cWtu?=
 =?utf-8?B?RHdVTVJ2M2paRXJOVzZwWWZNaGhZR2NqSDdBZ1czemd5OFN2SmIrR0theWFN?=
 =?utf-8?B?WTU5ck55aGZ1Rk5NQ2FxZDNTZjNQcktRdDBOQXh4bmY3UWNRTDZhSG1WRWMr?=
 =?utf-8?B?a3lXak9acWdLQzlSSnV1M2pzOThIMmtjWEUwUklvNkJMaG5HZzdPSnBzQmlw?=
 =?utf-8?B?SzNSZUVaUlI4T3FqM3VweUtxUkNWRlZSWGpFOVFmOW8rUlozRnZvcFRLM2ZN?=
 =?utf-8?B?OFovdGo2a2FrM0RXZXFYRHgxc2dCb2dVTS9VZldjS0p3UFdHYTVta21JeklD?=
 =?utf-8?B?eStuYUVpWHRaTWkySzBKZjRBM01KdnBlTWdsTjhJcHFtNmU1Z3U1Z0dkSFhW?=
 =?utf-8?B?bGJhQlFib3MyKysxK3lEVzh3NmxnWmVndS9NNHEzVE11SW1jZlVQY2o0M29p?=
 =?utf-8?B?YUtGUXU4Sy9xVDNGQjdFZ3lYTVk2Ukl2cENhakpUN0FxNzQ0N1ZEQllZN2la?=
 =?utf-8?B?cFU1Q0dUNFNpek1sLzQ2VEZVYWthclUybzQrY0JpRlZRUTNPdjBjN2VOVytQ?=
 =?utf-8?B?TjFEVWlvMnRzL3dteU8vQjk1SWlQQnZoSkx4ZVNOZ2ZUdFVLRHFxVUFVNHBz?=
 =?utf-8?Q?oA8D2Lc6IDs/fipcQh05dLn9R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705fcaea-4e15-4f3e-7c05-08dbaf6e0bfd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 06:45:38.6726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7omSlBSh8zjmAfjLXrF3F5Anv8G4Xc6dBbNNVYJhHNsTwLjB/u2lVne7N//Ss/o6rDcGFLg7Iro9ueXz7kbGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

On 07.09.2023 03:21, Stefano Stabellini wrote:
> On Thu, 31 Aug 2023, Jan Beulich wrote:
>> On 31.08.2023 03:53, Stefano Stabellini wrote:
>>> @@ -332,6 +333,17 @@ maintainers if you want to suggest a change.
>>>       - A loop counter shall not have essentially floating type
>>>       -
>>>  
>>> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
>>> +     - Required
>>> +     - Controlling expressions shall not be invariant
>>> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
>>> +       checks, and other constructs that are detected as errors by MISRA
>>> +       C scanners, managing the configuration of a MISRA C scanner for
>>> +       this rule would be unmanageable. Thus, this rule is adopted with
>>> +       a project-wide deviation on if and ?: statements.
>>
>> As before - switch(sizeof(...)) and alike also wants deviating, imo.
> 
> I added the switch, but without the words "and alike" because it is not
> clear in this context what it would allow.

Well, what I mean here are expressions involving sizeof() (or e.g also
offsetof()).

Jan

