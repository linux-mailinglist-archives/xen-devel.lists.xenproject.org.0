Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663EA7AE717
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 09:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608309.946705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2mh-0002Lb-5u; Tue, 26 Sep 2023 07:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608309.946705; Tue, 26 Sep 2023 07:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2mh-0002Iv-35; Tue, 26 Sep 2023 07:47:07 +0000
Received: by outflank-mailman (input) for mailman id 608309;
 Tue, 26 Sep 2023 07:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JCSl=FK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ql2mf-0002Im-OX
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 07:47:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7d00::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e27c1a59-5c40-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 09:47:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9335.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 07:47:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 07:47:01 +0000
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
X-Inumbo-ID: e27c1a59-5c40-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqJD+f9Y6BHYGyYywaRhASDHHUPrFOyRYbYvnkCHr2xlOvbJJUpW3MlCOt+XHqAFfbhg/fRkOhe90ZP+XLxUwvOiUTLt/SHbpyI1YpkOlBRwNwIr+KiJcjRQ4VlP0mjI5fyg5Y/zxIo3d+QEDI4hwTNA1n9gREMJQrc4+00VB8AsVHgGkIhGqzEnO/dVCBNhc0FEqGZ1l8HrPjSIMbehCD6y9M5/9jfj28a4qL/xGC11hUeNKVJJTaRRH3cz4BLB8aKEFzq+T1P8AJaN2kXs7vB7Cde7a1JErGVkb01qD7fMQO1cKi9ONXgY0HAfuKUgm+VdNPPiICYERLW9IGYx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpMPF1Ujjwl9RRM2989cAc9D9umLKJl93kQzxUc2LsY=;
 b=iutTovAzwELlc0z/28kr8YwPh8l/6OUBbJnpaGd1okQU9D1Uvk/Lyhvv1dm6heqC/35cYL+qVormBJEpPA4GnZ27tQuXdcxRA5dP7leagSCKaY6ZRddPnj/JANIGGP/VgpLxsyxKB0wNQB0tSGuTS4gbiyvCaUcl5ZKvZ5bjnqIDXNYIVUGnhCkq3GHDo+mf4bzv//kfG1ZE0dAd7AjV/8gsx64tJawLgxTR15q1hbtiMJd/qCrl6CYISKaRxJh0SoS8yo3i/N/ldqK7QGuG0PHjK5G5vX5ehiBVY6t0BSW9S6dnp0EHzRa6zhqM4TLpUYkJy0FsIf7u90WTEzbi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpMPF1Ujjwl9RRM2989cAc9D9umLKJl93kQzxUc2LsY=;
 b=b49qYowWEa2tpnf50OCtcVggT8r5a9ugzRSCJcByDvkdA5cJQAk4idlnF5eTqfaUSCDIknhFUWuVCELV1xmUw00IcrtB6ShjqIY6hA+Ehs2Tg8jZGwbP5W2i/AReYV0fQI4n66kRh6lDCP8L74ydt9P4cE3sxU1CMtEtoRahQS2Pjafvz2SR3+NgRQ0AoWZuMGtkr4UnjJMUH28Af3lp36idTryGNqARu1EkLP8QB7El8wpGNzAi9LeYt8VAJokJZOJGHLPfZHrFgIa0Rhatks0vwFHhnpqs7c2LeVdHjB8WVrUOW0cjPsDR2Av/pnSaiHgZGbo7ZuZhrvj57WfV4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0be1e32f-5600-7b3a-8d72-84297a1ebee0@suse.com>
Date: Tue, 26 Sep 2023 09:46:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com>
In-Reply-To: <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: 247c4b09-beaa-4ca5-5ee2-08dbbe64c506
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uu2E4pV41nZUoy78clZaNOutTLws7jugIOUeETn3vIXNBV4dPuNRESjQFaYQVB0fKgbbjpia/L9vGfk0rlXKC4/lTKg1XyGRxTbDMeBxCiqQA+n9UCwrjWw0ckU1073KzYiOQaZPcVppoad39RYY9bOrQ0vKV15scjHSlTPRustX31AN+34g9sPzQYWPO7exdmHd+klWiJTqFlnzE6yef8GG0Gm57bhXtunEhK+GFrQGdlzsJQ5f9SpCsxZjnQgjBMqVvx/olu645jL5h9Pn5cA+nR3XIRtb3kc9n4EQbeS61iQcZIWb2zsMgbn/DUUrwm2CZKxxRh2xcOdAEL1Gvqs8Y/Qdht5+Lz8JJeE1rNMfFTQa+MlOdKIz4MyLSAiQ1DGz2NCOUG8afcJrzzkxiw8hsIhy509X1NJZWu+ATAaMWBIm+Y73EqMfmtoD4ufWci96bxzPxGuSmErlCXLSia0zpiiMxG7XsiZNMEvYOz5lhMwuyDjAupxPDtbR2Lb6WM0o9tBbVCYhXG5/eS8lHQXSc+Nbw0SyqOnQvsKt8Nq9r+Mm78hl0yleRCDSb0gh1MgXCd3CDV1e5u0Tg+e/p8sqsNbJ2bY8FZvO4Nn7v8SROKG1nEqrC07IBoEavVu6+I9S8n+8TI4/anxxZimmTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(451199024)(186009)(6486002)(2906002)(8676002)(8936002)(31686004)(6512007)(316002)(6916009)(66946007)(54906003)(66476007)(66556008)(4326008)(41300700001)(478600001)(6666004)(26005)(38100700002)(6506007)(53546011)(5660300002)(83380400001)(36756003)(2616005)(966005)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0xtM3laMDZDNDFKWjdWV2U0bkdBU2NaZ3h5a0xlclBpd09NUldEdkFYbitL?=
 =?utf-8?B?eFlRMWFobWNzbTliZDhhNDRwamNTUjhrK0ROcDk0SHFiakFENTh1MlhrdUN2?=
 =?utf-8?B?S0kzazFzaGpOTE1CanBaczJHRDJ1VnFiWXRMMm5sRjFmb3hLWWdWeWpaOGl6?=
 =?utf-8?B?bUticTQ2YWhKckplZ1ovQjdESGdSZWFqWGFIWFkzbkxQNWt5c2M5VG8wQzdU?=
 =?utf-8?B?eG9wUDdtQ0s2bmdkTEpZcTJEbUdyUlh2VEJWcURhWUxLNHBJWHRsdnFrZVlR?=
 =?utf-8?B?WjJGb2FNY0FGV21ZOVA4OU41SFEzMUZucmdVWnJyOXNFRzhXV1lHTk5lRmxT?=
 =?utf-8?B?V2xrTDZ2THpLbkVSOGNkYmltNy9Rc2VYaXhHS0VHcXpCUnV2MnViOTNPcXJw?=
 =?utf-8?B?bFhkRHFNSXdMOEs5aTZYendpUTFMOFRjOG9OeWRGeTZRYkhmSXAzMTk2ejNW?=
 =?utf-8?B?bzlHSmxIaW9iTStxNlQyTmRrV2dicjNXNmlJNHJ2eExuMkEzdmdSUFRXbGRS?=
 =?utf-8?B?NGJwMDFGdWQ0WVVua2IzN3JRaE9LZEdUNGVhdEpBMEZLSUtaelNXU2IrSnkr?=
 =?utf-8?B?MVNTb3BpdFdmZFJxeG5OR0NUM3duc01mb2xPUzdhYWlSVkJwN1hVMnpnWUNI?=
 =?utf-8?B?UnFzYVg4Z0MySVRtc0NuajVZNktHQkN6dmU5QnY1bHNrc2hFa2xHaTBYaVIx?=
 =?utf-8?B?L3UwN0NyTU02UUdiYlA0bHhBYk82eXFNY0lIZ2gwa1pFdys5Y2hRVEJ6Q1Nw?=
 =?utf-8?B?Yy9IemxkcVlzWFpLbHROWDYyQkpKcDVDSm1udzBESVJHOU5CT3A2UkNWQ0Np?=
 =?utf-8?B?RHJFZC93c2IzY0hTbFh6QStoMUdiM0pLL2dMTENxOU9GSHZoOEpGdnM4ZmhB?=
 =?utf-8?B?M0Q5WGkrZVdWc0k3ZUEzMWdLMys1WFN1RlRPZGxFUjYvc0lIWFNTR3UzeXJN?=
 =?utf-8?B?cTByWm9jcFNNdXFuaTN2WTNjQyt2bXRFcGNyc0QrNEJZME0zVURRQ3pNZ2lY?=
 =?utf-8?B?emNaYndEN1BacDR4NmVoclVZR3Nzd1dNTkVwSXhPRlVEcndudUVuU1dpVzRN?=
 =?utf-8?B?eGpUU2w3bDlQQmNZdXBsUHR2cXFpMkQ2a3gzOGlteDIxZXdacDdDN25qeFQr?=
 =?utf-8?B?MnpWTXEyZ1dPVG1YRXVaMUl1alVpUU5PK2xHcUNIeEhSNVRJWHFYTE02dlE0?=
 =?utf-8?B?ZDB0OXFlNzZ1aWk4TWhlVkFtZHVieEVJa3Bhd0hCMUluZ2tDZklLbWJZTU1x?=
 =?utf-8?B?VHg2RWp2NVI0ZE85ZU1DR1ZhL3ZEWjdqTjhGTDR0M09peFhHblpEd201V2hR?=
 =?utf-8?B?ZEFGTE9HMkN6NHpSVG5RQUsxdDdyVzJWdHlRejF3RkFRcmtCKzFmQ0JVUVRs?=
 =?utf-8?B?ZlZxU1htcVJ6bE1RM2NGM1FOVGNRVGo3YVJ1UkFybit0U09abFVzVUdwb0Rp?=
 =?utf-8?B?dmw3OVBQbS82R1BNUWV3c0xDY2ZzRjNBcjZ4ZnFHZjNwTGhxRVVmVXE5aFRP?=
 =?utf-8?B?Z21KMGhuRnN0eXpKTENXZVFEcFhodXNpQjFSdkY5ejJQclFYK3lCRTIxWERK?=
 =?utf-8?B?czRxazR3bW53U2hxTTFoMUR6NkZGRHd1Q0pKdFdkZUFEckkvY2FLUEN2UFhI?=
 =?utf-8?B?bnloTDVmTGxNV3FNY3d0ODN6UzVMRFBFamtTbzMybkIyd2hIbm4xbUpxZSt1?=
 =?utf-8?B?QTlxcXZpeUJlSFN5ZlNaSDdaWVh2c05ZTmRFZ2lMNFh2MGV3OTNNRmZkT3NM?=
 =?utf-8?B?a0RaWnc2QVEzeVZFKzRsOUZ2d0oxMlhyK1pCNk5DV3lZTFBNRGdXQzJaMVRT?=
 =?utf-8?B?QThYbW53WDdCN2cvazZLdHg4Ris3azlyM3N4M0xHcUYwVHhJQ2lSMm9vMWIx?=
 =?utf-8?B?eHpGTG1JTWJmQjNDeTMwV1NlNEJvNm9BeC9zWnFPMnRTR1JNNWF6SGRucDJZ?=
 =?utf-8?B?NnJ0OEMxbS9HZ282OGxTZjN4M01VbUZvZ1hicm1uUVRud05IQkFYSW94RXhM?=
 =?utf-8?B?dU5mZ3czYmJEY1NtV2pqNGNwWTVZSEl1WEszZ1QvM0tydG5QWHZzam95OUlk?=
 =?utf-8?B?YUdtV0swRnBPNXd6QjBWcHZjdnloa0swbEFzQUJOYWltMVMwUFhzMjArRjEr?=
 =?utf-8?Q?3VOK1ax/FN77lZ8MoxXJ0FDY4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247c4b09-beaa-4ca5-5ee2-08dbbe64c506
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 07:47:01.5719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRY7BWSkj+CsBwuQDd1MiwF8mMOtN9wGsKg3elThO4b7FMBpHeZqNHSFg9oqiYxODvvUhVVfrfH0G4sgcFEkWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9335

On 25.09.2023 09:24, Jan Beulich wrote:
> On 25.09.2023 03:25, Henry Wang wrote:
>> Hi everyone,
>>
>> This is the reminder that we are currently in code freeze. The hard code
>> freeze date will be in two weeks, i.e. Fri Oct 6, 2023.
>>
>> The planned date for 4.18 rc1 is this Friday, i.e. Sep 29, 2023.
>>
>> Also, below is the (updated) critical items on my list for 4.18 release:
>> 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
>> https://gitlab.com/xen-project/xen/-/issues/114
>>
>> 2. tools: Switch to non-truncating XENVER_* ops
>> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@citrix.com/
>>
>> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging | 6a47ba2f
>> https://marc.info/?l=xen-devel&m=168312468808977
>> https://marc.info/?l=xen-devel&m=168312687610283
>>
>> 4. [PATCH v2 0/8] Fixes to debugging facilities
>> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/
> 
> May I ask that at least "x86: support data operand independent timing mode"
> also be put on this list? There were other x86 items we wanted in 4.18, but
> I think they have been put on hold now for too long to still be reasonable
> to expect to make it.

On the x86 maintainers meeting yesterday two more feature series (i.e. leaving
aside big fixes) were identified as candidates to also add to the tracking
list:

- runstate/time area registration by (guest) physical address
- annotate entry points with type and size

Furthermore may I ask that you keep an eye on the physical CPU hotplug
situation? It continues to be documented as fully supported, and as long as
that's the case 47342d8f490c (" x86/ACPI: Ignore entries with invalid APIC IDs
when parsing MADT") would imo need reverting. While I had indicated that I
would do the revert, a patch to SUPPORT.md was meanwhile proposed (which
would of course further need accompanying by a CHANGELOG.md entry), but didn't
really make progress since then. Yet I also didn't want to "needlessly" do the
revert ...

Jan

