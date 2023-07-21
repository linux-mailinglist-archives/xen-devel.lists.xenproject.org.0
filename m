Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB575BF08
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 08:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567355.886298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjnj-000340-Co; Fri, 21 Jul 2023 06:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567355.886298; Fri, 21 Jul 2023 06:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjnj-00031n-AE; Fri, 21 Jul 2023 06:39:43 +0000
Received: by outflank-mailman (input) for mailman id 567355;
 Fri, 21 Jul 2023 06:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMjni-0002fw-09
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 06:39:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe13::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e8a37e9-2791-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 08:39:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 06:39:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 06:39:37 +0000
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
X-Inumbo-ID: 5e8a37e9-2791-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ec3ay5viu9UwOGDrRfS/uzHLbYA4BNzhzwp/VBv825IFHFWw7ywxPeClw9bVNSD+RAuJTG/NJyjk5fpfSN4r62edRRqn6rb6TggFKZwAn8rPHE8rYCcXffvckwE2C2IPIqDMIace9fvXE9chPCAKz9uXvHU20kjBzU2Ony3f4SKGsY6iQGIHq2lQai5+GX2gv6fMja0ymhzoUGqYOBpLZC64RpFah0TAj2O0iJl7OnQ3YwBA5e624mMwbhOPjAc0O9Uf1U1vxWt2L/DSzj8wySdvK+BCRJW/0UdQ+ez47dJQCEkVvZya4rse0VXZhmXDHK5E9U7nEWybakAlicRO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9NCcKMpSbwUgHA9WwKD5asGHZbQNl87/iW64kIUCu4=;
 b=WMsHMlsYM9hm3I+VjyRZfA0mRbi82eFvtrvdSfN9dW0jayHOmDN5sD0owx92st5zuYCqZubiriQVU1Rk7fz6+ayuV8pFZllDbwXGw7jQbRMmbAV9fLZr4NwsT1RmRISy+9q4oyZubIAI3wcm0AI9SnmQGEykv27xYoWu7CRWm/h8Upx9gSortL9VSon8mVfpReb2utpDYBWqtDk5+7WQyXrF4iLrj23qwwbnj4ex1X5N5pANLS4myCJzsgvqgofLPvi69jrnPmp9yHQ0FIkcRI3Nlj/E7dD+6S2MTZplUCDwGoFgI0LljCfaszJqRwk7Jes4M6ZaAqAViMt8hBQ4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9NCcKMpSbwUgHA9WwKD5asGHZbQNl87/iW64kIUCu4=;
 b=GkUt/nD2galrhLQkalseRzLc21VMK6nbB64Ry7uB7VlpnBitE5wHD8QvmgEyZPFWPC5KbGEj6vc3h7ihM3qJZpyZn4VMd0g2AnMm2dAlxkb4sT9h7SlWtCJneyc2V9dUZaGnCKj353detU/OP0JqHv+in1nmreY+68c+6QfH0uu167ePPyDn2Nb1CgheFDTFQj4lhPX4w2vKHQhxw/YxqEzampIrml3rzGo99xYprVkUbJmOLFfOHShBGA/r39X0gCWNWS/lcE1MJLFlJbfGFNN3MC4t1pPqy5d7fQCX3JtzJykxNpVCkh0jjcS3z/ndqfmiEhKlH+V3ZzG3aSeCEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94ae50bc-d4e5-3700-dd84-a783afb832e7@suse.com>
Date: Fri, 21 Jul 2023 08:39:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] tools/xenstore: fix XSA-417 patch
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230720150459.31111-1-jgross@suse.com>
 <6e858280-c778-883c-0f8d-2afa737232fd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6e858280-c778-883c-0f8d-2afa737232fd@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: e69796fb-f0bc-4ba1-1fb2-08db89b54102
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VGljGv6EEddSYJahZIBDioLtEM4uW8/IqDUOfcpQeo4W1PMHCwKqgRUfGnJ4zjsceaj3fR+OTtQYahvI9He8dxaCkbcIHR8Uyk/odNf4vYwRpOaSH6Zwbd2hLBbCOWpf4H1zxvVg/R8gUCtaIjGh5pKdBv92vk3qYQVDBgmfPDzAowZ8RsudS4UeI9spBsQEDn9xUSOPKcx0bGN1mFOZe9dlPpWYKrJKBqBvCKEQluirvfB7OdEZaxN3wTPnjmwKlOkTMRhkbU6J+lVG1PmTMEntxkkJe/FJG2uZC7ktAWDLTfpWLr+IcNQI7FcWbpAcPPaZHi953tsAG0lFtCBVELnFEJaQxnOebL7UVAONFX3URhfuJJVxCTkYgFFVSrzU91X+g32en0ZIAz3DDM2/b7Co8Vf7yQdA9Lh+bR5SqXuhm4Tzq+VmbfKB0gms39HAezCtCV+xB7cb/r4/1bmkhruiWmYpFfvpiCtp0FxPkk9AHwfBYcA8plNxalmYodH7DKMFZd18ceqiTW5rPXbCuOCpCrNsEXz8oN0M6KBZdhvAEdNUnJNigIrYXpLozbVcXf8FJxIqUbxkkN1Y9PGqQujLiUV1SOoZmav0/Ok9BJxE0/IeFEQYnZluCqnCG9Xz9JUU/joeuTxsQOmdw4XIQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199021)(31696002)(86362001)(31686004)(36756003)(54906003)(110136005)(6486002)(478600001)(38100700002)(6506007)(53546011)(2616005)(186003)(6512007)(26005)(83380400001)(2906002)(4326008)(8676002)(8936002)(6636002)(5660300002)(66946007)(66556008)(316002)(41300700001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjFJTEl5b2NTV1J1eDM0M2E1alQ0MndxU2g1eUNyODlDd204aVNVZFRLdDJs?=
 =?utf-8?B?cjdpdDAwTnZhVVpFTnkvRTk1S2Jtd0ZEdC9XM2pmM2hET1RvbUtWUTVqUDBH?=
 =?utf-8?B?RDZweWhDQTVXdFAxcm9YRUlDdkhLVC9sazkvUmhscXAweDJRR21JZTVFVXhj?=
 =?utf-8?B?VW5hd1BmOEJPSGRtcWJOOE56T3piTTlaTHdNNGpoUlJoNi93K1g3VDJBT2FY?=
 =?utf-8?B?OE1ISFpRZ0Q2OE1icDgwSXZVZlZLc1pDeDl4Zzc2ckoyWHhNM0ZjQU9QRmZz?=
 =?utf-8?B?ZUFoR0t2VzFMNVBzOWdJSTFNd3JXVmFnc29BUkpUZ094Y0tteVVRREl3Uysy?=
 =?utf-8?B?eTBxK2xLYTdFMzd6dlEwZ1V4QVozcS96bjJRUUdOUEM3WUNUbjNwVUg4N2Nz?=
 =?utf-8?B?WldaaGROK1R1VHVHeldQODkwOFVhK0tHVU1iVmQybUJvS1RVYlJSNWQ2Z2wr?=
 =?utf-8?B?ZFQxZWJycWFZRVZKQjFYalRXT1NnQlN4Rk9ia25LdUw0MXVESnpYVjgvZUIw?=
 =?utf-8?B?aXd3WHVUczFWMkd6aTRKVms5a3htTWRoQTZncElGaDUvNklBdW1aNWd4Uk1w?=
 =?utf-8?B?UXYrbTN0TUJvWFpYNjVZV3hmdUIxVTlNbzlTQUNhaUhJQlJmSzVKRURtWGlJ?=
 =?utf-8?B?Sy8wREpxMEJOcGg3STh6NklsTzhBNnZEVjBpcjN2ejJGOXE5VW5CNllmNUR3?=
 =?utf-8?B?bDRnem1kWHdMYmtMS3RxYlJmTXR2dzJoNzBCRXdtM3RFc3NUeVNnM0I2MHYr?=
 =?utf-8?B?eGNoRDJDT0ttY1lFb3o4WkZHTE13V2JqL3A0Ym8zVmdkYUVMcXFKOHJraXc1?=
 =?utf-8?B?bnBUTloyQno4Y2E3T2dzMzlKSjNLR1dJWkdWRW5EZHJOUFNPcFAxQzJTVTFs?=
 =?utf-8?B?a3lUT0k2ODFSa3o5eitkdFZGVjZNZlN0cXl6VEdmRkZXVWd4bmNkYitSRTh5?=
 =?utf-8?B?cHBnVk5XTE1mZXRFWWo3bDdTc3RyWUtTeXFJbHlPVS9EdWlxU3NPOHgwVkxm?=
 =?utf-8?B?cUNuQ3dBd3lhNzB1UmdVdlUvKzVaSGZRMitEbk9jYkp1VUdxN0Q4TDhtK3p2?=
 =?utf-8?B?cE9vaG1ITzA5emNkV2pQdm9QZGdEN0FOdFNaV25QSHF4bW1sYXpQaDhRRmhX?=
 =?utf-8?B?MDRTVFRxb3R6SjhWR2JMTlhwYnZuY0UzYjhsSHB0NDhpbUQwNmxPdUxqNUhr?=
 =?utf-8?B?SzdhTGxCR2RUVXArbmUyNXVyV0o3ZDNpTGt5Z3VDSmo4OWNqSlpmZ1p5cDJw?=
 =?utf-8?B?Qk1MdkE1MUpJQW9ha2JETDVqdDBEbDhOb0ozVDJlTjFuMEhiWFk1YVM4dFRY?=
 =?utf-8?B?MFZvcHNkR0pXMHFodTVkVUplTWtLdHNnU05wOU95ZHlUOFZQWXozemx5OXB2?=
 =?utf-8?B?bWhGenRXekdmSlBDY0h6WVNISDZpQVRLdGJEcWE0SHNvdWw4d3MyUHM1VmU2?=
 =?utf-8?B?OVYzYXAxWEcrZ1Z6YmYzNDR4VmRmNzAzSURmV3RjTEhGRzlPdGJGZWN1WGtD?=
 =?utf-8?B?cnhSUGtyblRTSmlpTEZCVVMxK1JIZEU2eVltTkpPVlIwSCs0MmdBYUlFajBs?=
 =?utf-8?B?b2dWbVZwZGl0aTFZN3laTXdHOGFLeEhyWXM2WHRPZlJsVWZHc1lWSHhBTDFx?=
 =?utf-8?B?MHdvZUgzcDFib1NWNXRUdWptM2JWTUQxd0ZWUWd4Q3haUlZUMnpJRTZtN2Jj?=
 =?utf-8?B?RXRpb0FuUm1RU2loUmdRbWdCbHN5Z0lhYTRFMEFyVFZoZkFBVGZYUmg4TUFO?=
 =?utf-8?B?dkpIOERCSnJ5aXk0cWxnRE9EdW5BMy81Sk5yVWlNbDZYZHdHQmJEcUVQU2Zl?=
 =?utf-8?B?YlB1cHNKc3V5UXdHNkZxZGZUQjJmS0xEZjVQeXFpRnBWZktySDhJam03N0pV?=
 =?utf-8?B?dEJkZlBUQlRrdHZYYzV2bDYzZXduQkhDQXlsZXRrbnRHTVFZb3oxZHVlNHhw?=
 =?utf-8?B?S2RxajVIU1o5RFVFNXYrOVdNenlTMDlsdW0zSTVUKzRmdnRvYVZ2NVBKOUY2?=
 =?utf-8?B?T0tXRzBNb0prYUUxRDd5TnZjUkhpMkR3dVc0L0pUaGpWTzl3LzZ2MkJIMTZT?=
 =?utf-8?B?dUhYT094K2VzQlh0MkpWc2d4WUZCSXp2TUlOKzlPS3pCVktESWJmMEE4K3Fo?=
 =?utf-8?Q?o0cn6s5s0aWrkWsm+Ev6+aICr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69796fb-f0bc-4ba1-1fb2-08db89b54102
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 06:39:37.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /C3+6rP05nayODFraY7mct23B9YCwVUWBVGQt+AJocKSHT14f/apcRfznccmlZ51sGitw4Gd+tEbhW6tizG5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

On 21.07.2023 00:34, Julien Grall wrote:
> On 20/07/2023 16:04, Juergen Gross wrote:
>> The fix for XSA-417 had a bug: domain_alloc_permrefs() will not return
>> a negative value in case of an error, but a plain errno value.
>>
>> Note this is not considered to be a security issue, as the only case
>> where domain_alloc_permrefs() will return an error is a failed memory
>> allocation. As a guest should not be able to drive Xenstore out of
>> memory, this is NOT a problem a guest can trigger at will.
>>
>> Fixes: ab128218225d ("tools/xenstore: fix checking node permissions")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

In the interest of not missing to add this to my to-be-backported
collection, I've included this in what I've committed just now. It
correcting an earlier XSA fix, I guess we may want to go as far as
backporting this also to the security-only stable trees (i.e.
through to 4.14 rather than just back to 4.16)?

As an aside - note that 4.14 is about to close.

Jan

