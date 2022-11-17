Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97262D4F1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 09:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444795.699855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovaCS-0007Wx-LN; Thu, 17 Nov 2022 08:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444795.699855; Thu, 17 Nov 2022 08:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovaCS-0007VB-If; Thu, 17 Nov 2022 08:24:44 +0000
Received: by outflank-mailman (input) for mailman id 444795;
 Thu, 17 Nov 2022 08:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovaCR-0007V5-JC
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 08:24:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48cce6c2-6651-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 09:24:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7604.eurprd04.prod.outlook.com (2603:10a6:20b:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 08:24:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 08:24:38 +0000
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
X-Inumbo-ID: 48cce6c2-6651-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgBc/R2+7/l86KuQAC2TdSRsrCf4QYrK72HTHf0wU/NFUryoc0c8kRjjGEaAB7TNZQ//AduENRQlFDtx9Z2oPIgV6ONDMH3vLme9gStlmEVMFEeWxP5hBFIBSBZGsdieGQxuLLeNJyQVjhuO3qxRBowX71F+2xS/msvsxjUgefyzzTfkV91VZMDTE7F1DGD0A/8rvD0mtNNi4SSscmTW1xy4GgJNuu7foPX4FlOhAZ8efj9fM0jFYZBUF7FzSqcWdJSdhNhNbhpS+kHqyInAK2n++vkinqzoXqNtCIG1RMU2s3Q7WARLsfHhTmNQmR5467Rw4xL2NTk8tf0s+B7ApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5QUOWx2yaIUU2v4e2qHioxPLN1Ucatf7wWz4lH5g7c=;
 b=nQJjJril9gtVGsB1+A7pXfRlbrpIhcV02DsUSdJuQohhH9eHX/r2ZYghLUYcervkhoHey4qPiEU8sDwXp4HhwK0t13FfnIZE2nu9f7yKtvvjvR/y0vSk6Kq6ws7XUkdDHy7fPMPJJdDArWbeKUXD7xZiO5u0pI+PbvpHEG+smSQpFIzwJpTlYGN90ed4CUnEQBrM3UHiBYC/UNS1yCupQZQ5y+CauHR48t7nLp0T4dU1J4iFUx3ok4WwqX2hzdXWfSJZE2QWOGHRmE1jFXnrvmQ6YBXiA7ZboO43BnqW0yROOHVzXn9UPAzGoWC9gzb9uHa6gJZ8a6boYs+DPi/ycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5QUOWx2yaIUU2v4e2qHioxPLN1Ucatf7wWz4lH5g7c=;
 b=Ry+J4U9jwiCbIZjVqEkOomYmXiT6Ptpbpaxdu5Gc9/niiK9SUnGtlsO3X+/JlV+oke51cSEq3BSYYxql5WHdzE4SQ1Kprbtx3k3YZqEzTE+ApIuzGfhmyffuge8Z4LOIqxwdiyCzf9tSE7bSu5ANi2qDOms3dTkVsitvbFCRtBvJxyYxeVF665kc9V2mNgpKEtJ+mHh8VWRdK9M9IRVjrKbtpzUuy8voAKweypkLq1cWOozDKqQmGdxrCt+VNcebQdRpw3+yyarxX7twcXq7Xtm0UAH1MVuVq/0DgA2mfoQ+dQr5DBygeK/GBkKxHJTiHelUI2WoG7am2G+OzM8k4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4f853a8-deae-7c7f-6786-38b994c5a444@suse.com>
Date: Thu, 17 Nov 2022 09:24:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20221115003539.19502-1-andrew.cooper3@citrix.com>
 <29469c16-856c-bce7-c556-66622e349f1c@suse.com>
 <2334ba7c-d744-c1ca-8f67-b2013e9c5fe4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2334ba7c-d744-c1ca-8f67-b2013e9c5fe4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: f6415377-46f9-4589-875b-08dac8752b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lQ/27qKMIu7O1zCmXrtEki4defnJ3IMTk5O+yj/a5aSawhUlH130/zkj+LYP6vIreuo3nWZ6VoByFQt4qKGlCWkw++bdJ81fqzbaYnLwzSIrVS7bg4pTKNGh2oglgCCGefPrDG4PiG2dSbcV6K5UQjRXfFovEIn4CJYhq0sAT0iQqeFHHPG4FCj3o/jydya+8tlViB4G8kGIpo13ieJSGwKNDvP/U7zjXp4Y84sqZMxzHkfO8hKAbO/peftXKbtNF229tJJ23UkVjUR6euTVuUKwYhrIGJ400PWwmuXN6+6BBF33zJ97uW4squUDu/a4olZMuSk6A6JkP+CQmslFBU6YjTEiNiWDodXMfRlkQnCJD7Mjqt1P5v+bFhrLE1YkhK7LWCyVN/rQtbCPa/frELoiS2Us4jQ11H+P215IX45au7oz9S7CxQd/xJkZXJNIGcoK1MVznCAz4AuwkYYPkUaVADCzy2aotWypRK+MB4esYguO00F6+r8z8yjdGhkFg8+ievWUQUvjE7UQyrs+luwdxxBu99+VFreNTXOqupW3JGHX+y9G+f+YOOSWVsOXti1vI3udjfkP7/6ZZqdiKUhBIG9PEWjysEDCtU0jtk+8qhmZZuX2KlH3ffKiTLf1dW0+YpKY1Fk46UR7tuRH4VloudhdU8Z8TU5OpcdOmstx0ymivecMuHxjzGJm3A7+eS0H/87mnnLo7Dd9OXRAUt8cTLS7NQhpJw6sQhP4Nho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199015)(86362001)(38100700002)(31696002)(6506007)(53546011)(26005)(6512007)(186003)(2616005)(54906003)(6916009)(8936002)(8676002)(6486002)(66476007)(66556008)(5660300002)(4326008)(41300700001)(36756003)(66946007)(478600001)(316002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WndDWVlDTklQSDFBblgyc3l1dkFxem9GTU11a0wwNTlJSVF1L3lqRE1JckNO?=
 =?utf-8?B?NnkzODBqRVZ3T3prcEVqUDRTM3UyMXgvUm9WVThLZy9JUU03VFczak5lMUVB?=
 =?utf-8?B?ZzNvZ0swZUEveWtqeWRQN1pWVm5DU1N5NEhWRS9CTG5nZnprUExFT0dOcW1k?=
 =?utf-8?B?Sk1UK09qVC8reWJ5LzZFMzhNUGhEM1R1TDNaT2FZKzRPQWhOOHlhWnRZVjNo?=
 =?utf-8?B?V1ZOSm5uWEtWeXU0bmVzK0hxZDRGb2Y5YXNVNURtY0dOQVg1ZWtrQTBrbnRG?=
 =?utf-8?B?YTdiWWRKQnFsYngrNm1EUG4wTUtOU2x4UkRIeUsxM1hITUJ4MHhXcC84QWZH?=
 =?utf-8?B?TWV3ckEwNmR3dW02NnRkN0NtVUk5UUNSem9TMjFVUlFSUzMxTms2cmJBQWVo?=
 =?utf-8?B?dVhENGVkRmdNalVVOVEyc2NOU3RGNXVIaGQ4WHZCUmNvTHZNTWtOYmVQbXhW?=
 =?utf-8?B?cHdZdXQzbHBWemRYeUxac1l2M3E5WUJFNjg2b0t4S3QxaEhVRTNCa0ppNkU4?=
 =?utf-8?B?QlVTYlJDMHdSR2FBc0RqODJpZENMWE1IVDVIeVNtS3BSSjdvSWNrT2dyMVd0?=
 =?utf-8?B?M1g3WU5zMk1BdGxnTnBvcUswOVg4cFJBeDZJREFDT3pmdTJYWjF5Z2hJeC8y?=
 =?utf-8?B?MUIyMm4yV2FlVi9MQnVEUVZzUnNWdDNBWkpTLzZ4ajhQaGVVUGdqV2hxbXNQ?=
 =?utf-8?B?OEpQZ1hndjFOYjJ3OHJTRmx5ZVVWKzlHQjQxbms0anF0TkFPOU5hYWtJa0ZT?=
 =?utf-8?B?cFZxcXUyQWt3bVBub01rWjM4ZlZzQzFVQm5NMlJrSHNBZllyV0RtZ05sd3dk?=
 =?utf-8?B?MUR6Y3ZTWWNNRlZ5WlFHM2FmK2VYNUVvMXNhdURVV1RDakRlMHNLMytWa0xn?=
 =?utf-8?B?T2c3WW9RUjJIWStjYWx5L2RLQTR0ME92TlVBUm9vd3ZHdVhjS250SU40UXls?=
 =?utf-8?B?VkwydEdUT3JqamFrMVlEdzFXdTJrNjJKb0NXTWN5aVRiUTZvNlBYNEl4SE53?=
 =?utf-8?B?NGk2ZWJlSk5vL21wRzZkRGtLM250UE1FdTVVWkhMSFIyaU11OFdwMXB3WG5R?=
 =?utf-8?B?WU1Vekw3eW5JdVh2eDZSN1NYRUFuR3NiQ2xQbHdyWE5tU3M3S3gvN1NUc3dq?=
 =?utf-8?B?endQOG03VmlJamxOU2lWdEVGOVNyWFFXYmJBZzFKWEY0dHcxWmhXNTRxMkp5?=
 =?utf-8?B?ZnhWY0M5d2xFLzBkM2VPMTNTODZnYVVPUENuNkxxME5xb3p2ZVhXL0NUbit1?=
 =?utf-8?B?Nm15ODFUVEROK0FuMEtyTjNmY0pQZ0k1RmNsRWdpSDVaN09HUlZPcXkwVGFG?=
 =?utf-8?B?bjlvRWg1cnRzTEZFYmpzWFpCeW4zVUcwWE5KQU10UEo4QUVNWUwrejlPN05a?=
 =?utf-8?B?eHpVbUQ2TkhhOXNVbXAyVjBuZTRpa0Rhb3dnU1J6MU1MVVVYTWhKZ3pvQ3Ev?=
 =?utf-8?B?OUNzcVR3QnZ0NndpcUo0RW5ibFppTnpBSDdiNEkwWXBtNXVvcTNFczdMZlha?=
 =?utf-8?B?dTVBUjk4NGxLUEY0L0N6NFQvL2tIcmdHU3puL0N5eDZCLzZhSEcvcm9nVzNB?=
 =?utf-8?B?S2pncmtrSmZubjE1NHhBNzk4WTZuamJaRlZZSS9xeWx4YXplQ0lSOWRPS2FC?=
 =?utf-8?B?N2tHWXdidGJLRG5wa3k2TDRMd3hqY3dtd2h2MklBTzBBeUZkSktHMXJFRDNO?=
 =?utf-8?B?Tk1QU1RFdmhMRHJleEZVOEphTnFBTDl4TGlyaXBCVjFyR1d3SkE1bEdnS1Q5?=
 =?utf-8?B?bzZrY2xoRHZYVFN6RHVGTlk4S21hNndWdHI5ekZTNlhxYitqb2x2ZXMzYm1K?=
 =?utf-8?B?WStZb2ErTjJWc0kzVFBVMU9iRmVLRGM2WDB2cW1KZDZnMVFmMCt0TWJjSHJ2?=
 =?utf-8?B?dTRGQXprbkFpYkFBQWpQNlBoRTA5YTJwRTN4R3lQWjhFdGlmeG9ySWwydzRV?=
 =?utf-8?B?azZUVldWK3lZeWZ5dVhsc3pjSzNDeGdpdU5IZ2lNVVQ0RXBnMnYwZWdoTyt3?=
 =?utf-8?B?UDlGc2VETDVRL09iREJrK2NKNHBTNEgweVdRcCtTem02R0FCbFNEK1FQNEds?=
 =?utf-8?B?SEV6dE1hSld4UzJKQjN6bjdCdXhqM0lHaXNIeWZ0RUpYdUtJNFYvN056K1VY?=
 =?utf-8?Q?qsz1eWaVST8Vdl1oU1Zy7Mi/v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6415377-46f9-4589-875b-08dac8752b16
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 08:24:38.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvZT5Q+6HpMgTfyolAauECGYtjAufdJESEkqWb3tnSc7nLTwDGHhqKgLoCKzHEuPXkYKulUA0fS4rM2N3xu5+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7604

On 16.11.2022 19:14, Andrew Cooper wrote:
> On 15/11/2022 08:49, Jan Beulich wrote:
>> On 15.11.2022 01:35, Andrew Cooper wrote:
>>> I was really hoping to avoid this, but its now too late in the 4.17 freeze and
>>> we still don't have working fixes.
>>>
>>> The in-Xen calculations for assistance capabilities are buggy.  For the
>>> avoidance of doubt, the original intention was to be able to control every
>>> aspect of a APIC acceleration so we could comprehensively test Xen's support,
>>> as it has proved to be buggy time and time again.
>>>
>>> Even after a protracted discussion on what the new API ought to mean, attempts
>>> to apply it to the existing logic have been unsuccessful, proving that the
>>> API/ABI is too complicated for most people to reason about.
>> Like Roger I'm still having trouble seeing what ABI you're talking
>> about here. Yes, there are internal handling issues, but that's hardly
>> "ABI". And as Roger indicated before, anything domctl/sysctl isn't
>> stable anyway.
> 
> It absolutely is stable when it it extends beyond domctl/sysctl into the
> libxl API, two different xl config files, and Xen command line (for PVH
> dom0).
> 
> domctl/sysctl are the very least of the problem.

Which still leaves open which "ABI" you've been referring to. As Roger
and I have said - it doesn't look as if we couldn't change the meaning
we internally assign to what libxl has started to expose (and what the
Xen command line option simply mirrors).

Jan

