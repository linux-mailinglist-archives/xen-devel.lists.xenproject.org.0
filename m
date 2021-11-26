Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6379E45ED00
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 12:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232580.403319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqZlw-0003F0-9y; Fri, 26 Nov 2021 11:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232580.403319; Fri, 26 Nov 2021 11:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqZlw-0003CL-5z; Fri, 26 Nov 2021 11:52:08 +0000
Received: by outflank-mailman (input) for mailman id 232580;
 Fri, 26 Nov 2021 11:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqZlu-0003CF-Ba
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 11:52:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46597f08-4eaf-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 12:52:05 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-fuTeFXlWNICBOM2NAM-E4w-1; Fri, 26 Nov 2021 12:52:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 11:52:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 11:52:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 11:52:01 +0000
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
X-Inumbo-ID: 46597f08-4eaf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637927524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9PgOImdRWfcwOGjbSypjOtLTYYj+S+Au2mt+2qxoQwc=;
	b=dlN6hAC+ovFY1t55+/47UwNR1MGJJ6I90WjJw7Wjd49hBvSR4pQF3Yd7HKqeAv+R3FYeON
	lLmPn4ajLpBt86CTWWDIxXNuHPi9Q4BXlGeR5XhxiXXoITiiYAsjOuC7PO2LAES1PHpQGJ
	G8Y5GCePxcjWHFuDXp36wHlqkXV76DQ=
X-MC-Unique: fuTeFXlWNICBOM2NAM-E4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIV00Rk455ysMFTKi64LrJvCR2cTfT1bOVTR5x++QpcVmPdaui1FMYZNWEYjz9pDRp0tVz5d5okgCSvIfkeN8HAsrDrFe2JPDOfCarzee1xr3awnxttxs0lwxcKEsY3DuwCnu4SwIF1vSSX791MRoL6614NRba00/tMwxOD5YL8L0MEa60hjqEbV2i/8xnVO6Jijhmx8sdE8fNJSzPfEJsFFgi4xw4a4AXVtEXbyM7v6qIHKSyWX2fwgm5CZ+hM94q0jC7ptpeODwFm29g2BF3Z/qVoe7QpdL3HlXqzObTcG+1YVVZn98S8AxlbqZuRxmB0zbDQvzDnE5Qa5GQlEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PgOImdRWfcwOGjbSypjOtLTYYj+S+Au2mt+2qxoQwc=;
 b=JtUzkdm6TN5jTWiInOMF4F3gW0OmG4VgW599A2ohfLQpSFGLRMqLXRMJ7agssgex7fOCMmgE97CbbQKP80tfpCtas5tEQisdAODPab2/Hdzgg0AhS8fhm/oxgG1ysYb8tsW/ik3+AzGmB4IYklWNxFXeN2GVRvmHrN1QusWFtJJbSC53r/mhKUSmITQJIghP+IoZsR7cV9WPowEZ9kWnCs8ELeYRP90YJhJNPXFSB3D7LKKiF8AhvLzX4j7Hm6HXMXVY/GoH3emrjgEo7nb3Lek++enmZHJxoB7yeqKyfrHnJYr4hIe2nh0ayjrzOurvRXG1pyED9STa+uAjynECHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
Date: Fri, 26 Nov 2021 12:52:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5d03d65-56c3-4765-015c-08d9b0d328c7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41913435DD70C18759E6D6FBB3639@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NolMyYIqBqpIxWUNIHteMjIP9/rNXIMBNMzEQZwSpRbVAOYlolCCmHdzjvFWhlWR3kH1htLOighqeV2TLDQ+zrGEoP9jkfCbGGUYUZRWoeDnMWHE/VPBzyyllBSzmU0Dvk1yEjV/hkWl9L1MPf8A32/cn45T5YL6Bz7mSCf+M9/J4cbZG73th491pl3pQgJ+M5X5H4tqSOFEtJQ8l0nifbyeTK8UXK+zfi45OBVQtNVy3wVYGz1B5UINzTvqJIKpT0zAx6jP8EnWNCy0oYbCrMZ4khz3ZcaYpgSwNGz9bMsYpPNSaF9fUbvFIOohO768nYFQYz7lrUD1Ydg4lZxDULZ8sdMGBQKRrRyJj/jt4OEeQxKV85KTAWCzd2Uvu1VsarrHEbxgHVBkRnfjzyDSD/d3rjoN9awahKG/fnstXdT/1/aJmTK6Ix3RguuR4EaTvaLZy/dN8veTqEpH6iy6V9IjCC+wNtIBMZFarZsEJfm+kG0+2AvYH/AN6aF9eJjgI9FGPek9/El9Fgub/KstHPJOJvaijnd0rNXAO9HRYyW97HVgXsNVP+rR2bGEVs1Ditnmjg7jVuhyVYT023o6KnA5ZkLxCSM/5uM71qXwsuLszaw1HOK6aXzmBXsL9BckTWAOHRVllm6bc0OG7zKSGNZC+dmgV4fHd7wQ+uDf0srTZDtKzdQC7Rt60nljJYBsWolFQfUYtSdLYAV0AA/6SQOg5fmpXC/07CuwHoj6kVDJgtW8IEgI+4WHhX+VXBZi1Cd6F9sYmi2uDDsWUTaVClCDouRFoh+gQ7ArFJdxGUrxwaWhHg+rji4KTh+SeAR4w/xHEad33uYzf+/Fym+vmGwd/990aajHrXwIVsd2QaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(2906002)(38100700002)(8936002)(5660300002)(83380400001)(54906003)(31696002)(2616005)(186003)(4326008)(31686004)(86362001)(66556008)(966005)(66946007)(6486002)(36756003)(956004)(8676002)(6916009)(53546011)(26005)(508600001)(316002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVV3aDVIaUZNTms4NXhYbXNlbU1SdmpHcWxRcEZCUmpkU0p2bzkrNVVJOThp?=
 =?utf-8?B?b1ZVMDNzblpyN1JTTW80eG1Kb0JZczgzM3Z2ckNnemYyejNHb3RuOE5MNmdT?=
 =?utf-8?B?dVdJZW96N2IzWHh5WjI0dWNON0k5akxiWHdyWk9VRjVtL2R6UUdOVk81OVZZ?=
 =?utf-8?B?QWR1QWo0M3pwMDVJVmk0aDVxQVN3S3NEcHF0U2pYdFZhc1FIYlpNL0JaOERa?=
 =?utf-8?B?a3pvYlFuWTNwZm9sbmE2K1JDdERyWlBoVk5lYy9RV2tFTnlQVUwxU2hOK2VE?=
 =?utf-8?B?L1F6a1djSm4wYmtkY3VSQTY0UTZyWDd1eEFxM0FEbnUzdUxzUzhrUlJHTVRR?=
 =?utf-8?B?blBsTVNzZVhiVkJxMnBxUWc4bkg2VExxVFN2eXNXQU9qZTdOY3lYejdReDR0?=
 =?utf-8?B?RVpuZjdib1VLUFY0TlF4VWx4OXVJUDhJajF5N0RwMVlSc3E3OVlPTmNSUWtv?=
 =?utf-8?B?RVBtYmhFQjFMaUppR0pCaEdjV0lEUk5Nb1RkVHhHOWdoYWZ1ek1BWTlmYVVE?=
 =?utf-8?B?bW5wL2Zoa2Y1R2FxUDZPVVgvNEhZUkJBZjhaWjkyZU0yMzk5WnNJSHdmMFJ5?=
 =?utf-8?B?QlYybzdzSFdPWUFqNzkxdVhHR1d0dDJEc0ltcmF3aFg2OEd3UTArNCs0MDZR?=
 =?utf-8?B?Y0pvRUphRVVDRnBNU2FwbHVhQzhvYXJ5OXFSVzVxL0xQL0hqZGI0NjNxUXRv?=
 =?utf-8?B?L3U1YXZkeHE1ckttVFJETU9EeWNCMjEvamJGU1pmc0psWGtNcDNjNzBoTUNj?=
 =?utf-8?B?RmU5TS9VeUs4QUsyN3BMdVo3SXRSYjEwYk9wTHpFMjJwcnNXai9ZSFp6QWYz?=
 =?utf-8?B?bFNxdXNQNHQ3UVkyMkRxeGl2aDdsSXZ2ejNWeWdSV0RBMFZhWmhqZWRLcm1M?=
 =?utf-8?B?SC85cTAzbjBTcko2TTU3eFNYREtSSnBOV3N2Tm5Ea1ZZcU53MjJuQlRFS3FP?=
 =?utf-8?B?SnVWVFlqRkExeDNMZmt5ZGJCYmRVZlpSRE5nQVQrTVd0R1paZnZHZVplNTRW?=
 =?utf-8?B?Y2ZFcVNab3dqR3NTODlGYURNblVSSFhEdWVjNHVoSmZPS1VRQ1I2SXZVZHA1?=
 =?utf-8?B?OWhGaE93OVlkamxON3NnU1R2MTZSeUp0amdUbG1oZE81TW9TUnNZck1pRUx6?=
 =?utf-8?B?ZS9KTVVHMmdpN1Q1TDgrZndhcnpyem82a3VyQ3l3Yit6aUorY3RyY3RjRnh0?=
 =?utf-8?B?aXBiem4zYnZUaGl6aWdtLzlyWVBadzBzcUkrd3dDRDUwR2VyWEw4LzBjZEND?=
 =?utf-8?B?Mk0yeE4wZWJDMVdEQkltejdOVVBPazFseDdLSUdQT2dSRGFhdHc5OW5aNnR5?=
 =?utf-8?B?TjFhSlVIOGpJdTM4YjA1TzdITnhMdmhSaFRjTzNMWEZQQzFJR1RLU0JzL0ty?=
 =?utf-8?B?eitTQ1grV3JzSktYNk42UjV0M254ODJOVWUrckcyVVBpbnIzUEoxSGFPMWJM?=
 =?utf-8?B?UVV3WXl5TDdTcjV5YmlpM3d1Rkl3MTNCYWJlSEZNbGxWbXoraFNwRSs0c3lr?=
 =?utf-8?B?WWtRNUJ4eFZjbE9SVno5ZzZGS3lWNXRRSWllVzFwZXF6dEpRT0NNVms3TGxp?=
 =?utf-8?B?RmJVcU0vY0VpSWtKTFFNY0VEVldVdGdFMUcvVnROTHAzTTd1TmZrQ2FCQVBz?=
 =?utf-8?B?QnpLVVRKY21VMHdhNlhNMkdxZTdydlFWeVdLbHdrUHBWZUxNZkJ4T0RLa1N4?=
 =?utf-8?B?VnhoR29ndmMxRzZmWC96U0xqOWl1K3JNZm1GK245ZlRWRERVZ05vcldTTnp1?=
 =?utf-8?B?V2dvdFlXV3ZzRE9STTR1NXArRm1ITGFwYzFRKzZHVkRZTUR5eXFkUmo0L3JB?=
 =?utf-8?B?ZUlaYkwxeGs4OG5YbWpNUmdyY25SOWtMRS83UzdXYlN1VjZLb1VHSW9DZ1Iv?=
 =?utf-8?B?d0xpZzNRaXJiMGxvY3JIMDZLcU42QUhuMXBCbTFqNHl0a215MUZOWHhnb2Z1?=
 =?utf-8?B?VWVnQlk0SFdwTkZGQXUwT2V6Q1NEQmI0R1RPc09GQmtyQzh6VTVRcVNpNUlv?=
 =?utf-8?B?Z29WWE1UbXc3cGtNMmN4NldWNDN2UlFSWFhZYTE5clRKdFVWWDFqTEMyZTdp?=
 =?utf-8?B?UGxwbmdiMjBJOTR6QTMxanFOcmNsR2hSU0lNMnJUL1BKTTNUd3NDUnRiQVRv?=
 =?utf-8?B?UERuWEZwNlZoa0tMdW8wUUlWK21nV2hKSFQ3dXRNTWo2N0lKWFJIck1PdDlx?=
 =?utf-8?Q?dtS7SkvjWDjbkOblgZisCg8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d03d65-56c3-4765-015c-08d9b0d328c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 11:52:01.9763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqKQtF3CLLLmmM0+QVbajjMbO6DxnclFiwwdnA5tNnbUdL5Fg2wwGerMqU1qCFU+0nphFG62azQosfx0jHowwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 26.11.2021 11:04, Julien Grall wrote:
> Hi Jan,
> 
> On 26/11/2021 09:12, Jan Beulich wrote:
>>> Anyway, I think it would save time for everyone (you had to manually
>>> delete signed-off-by after all) if you just copy the commit (including
>>> all the signed-off-by) message as-is.
>>
>> I don't think I see why you found it necessary to verify the S-o-b set.
> 
> This is a list of difference with the Linux commit that was unexplained 
> to me.
> 
>>
>> Also note that, for things to be useful in our tree, I may also edit
>> commit messages in mechanical ways (e.g. to change file or function
>> names). I don't think you can expect a 1:1 match in any event.
> 
> I am fully aware that I can't expect a 1:1 match. However, if I see a 
> difference, then I need to be able to explain it.
> 
> For this case, you provided some sort of an explanation but so far, I am 
> still waiting for a link to confirm that the signed-off-by match the one 
> on the ML.

I haven't been able to easily find a mail archive holding this patch.
However, to me

http://lkml.iu.edu/hypermail/linux/kernel/1710.1/04375.html

clearly suggests that Jiri merely took the patch and applied it.

For patches 2 and onwards the Linux commits contain links (which I
did also retain in the posted patches), i.e.

https://lore.kernel.org/all/20191104185107.3b6330df@tukaani.org/T/#u
https://lore.kernel.org/all/20210604085656.12257-1-thunder.leizhen@huawei.com/T/#u
https://lore.kernel.org/all/20211010213145.17462-2-xiang@kernel.org/
https://lore.kernel.org/all/20211010213145.17462-6-xiang@kernel.org/
https://lore.kernel.org/all/20211010213145.17462-4-xiang@kernel.org/
https://lore.kernel.org/all/20211010213145.17462-3-xiang@kernel.org/

Going through those made me notice that on patches 4 and onwards I
should put back one more S-o-b, albeit for all four I then can't help
thinking that authorship is really the other way around. But I'm not
going to put effort into finding out ...

This exercise also made me notice that I have the last three patches
the wrong way round. Not that this would matter much.

FTAOD: Are these further inquiries of yours actually intended to tell
me that I should not have applied the ack that you've sent first for
this one patch?

Jan


