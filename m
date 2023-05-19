Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065D47091AD
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536750.835402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvTe-0005MV-F8; Fri, 19 May 2023 08:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536750.835402; Fri, 19 May 2023 08:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvTe-0005Jq-Bv; Fri, 19 May 2023 08:28:42 +0000
Received: by outflank-mailman (input) for mailman id 536750;
 Fri, 19 May 2023 08:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzvTc-0005Jk-SO
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:28:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272a34d4-f61f-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 10:28:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7835.eurprd04.prod.outlook.com (2603:10a6:10:1ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 08:28:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 08:28:36 +0000
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
X-Inumbo-ID: 272a34d4-f61f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fodBSeiRzbAw97ILtqpoDHRi3TV+ET3FVyexVnpgwz7nO4Lv5vIt4cwmZKnx+Kzp1GyLTakhA33+zDWrjdhcX5askLIScvYVJ9gK2QD7NFkLljRY1DjHMSKr+W2UMx3KEPB6xgz10aa457tvnMV1qilQkq0GClJ7rUcI6vjJNomuiddjgiDwqWoLeXfFAOGhZgEyGCjlAhhMU3gdtsrvzfP12+VAEQ76gD/oc2WWQF+lLSOG/d1xIJd+wULoE5RT3Wx9A0+98Scx+EeOE93KOhnfkissCcYjoEPBYh7kEgNFmHnm28gTFMTDJr7tzQPMOVlsk80QapNkQ26mX5trGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJqWN8/9JNox31rHkgub6+DW10pCtsL9LUee67rr7fY=;
 b=UI9HB3GuJYIEwWnOrid/kbJoN3KNPd1j2cYioVWCvjNyKQOdXXTbvgpjH7lqPSUtouhw0eoWjJKmszojR2dRk7ZYg6r8FB6uLu4EXsLd5SV8in4CR77voVNTesHCx5bC5HCodhkBg1VQi5B2awix9DeKEEiOhfezzNRmlhWRGh5kril2XgZnh4avzwttH1tukdzq4bMQfD/xqPDyn400ke0JGkon1Ar9zKksiLOx6Pgb7px1WUusABve39SwA2B1qeSst0yUo8pVF+gHK4BlIq1uLy7EQsPzvcF/PUW4qyv7tqpkXsh0tNU2fkuLiPfug5XCm8yKW3yhsoWzeHK43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJqWN8/9JNox31rHkgub6+DW10pCtsL9LUee67rr7fY=;
 b=pG6IYRUuXxUZQx1lQpafJCJxTaXzc0XU+rWRId3iKPOuWKBwMYXnoe4HNE+/HqSgmOnB0oqgmPVW1Z0HmtfaPvkaDiu/NNsYcT8zgc2ui+LqhbwLuh4gaqmJxHBcpDdIDE5StGPydLQcNRLf8w9PQnHQ9EWFKnluZGhPpzBgP70f/B2R8hI7yGQm/8k/9j4RN10kuhzMMv7cbaPfx3wPLcds4B4E8U69xmj/S1F+vUa077Kj+hHF09LZjGtGxNN9vAU75Km59j2LnIlaEbSoZ6JjJREn4XDb+PlCjQCxPHOd7fUIYRTj1e0EQr4YGOqy3a8Fbm0yz78CZa3pRYeTlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1145824-b5f3-2f2d-7cd4-97c30fdd9fe1@suse.com>
Date: Fri, 19 May 2023 10:28:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 1/5] xen/riscv: add VM space layout
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
 <7b03dbf21718ed9c05859a629f4442167d74553c.1683824347.git.oleksii.kurochko@gmail.com>
 <d1529686-ce06-a707-de9e-a4b28c9f2e02@suse.com>
 <eef94bf6e8b67a98ad175125e221c75aeb4ba013.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <eef94bf6e8b67a98ad175125e221c75aeb4ba013.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a8fd21-d324-406f-a287-08db58430a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ibzEJoJD+6QM9kK2avIYdL2L3F/O5yVx2AdbcnbOqa0PCU6o52z0EIumcqM+rjlX95zAxrZDCMPWhhyDW2r7KB6VVFeRDOS45Bbzep1pCaMl6s5/PqzmPbPfjaTHimfac9Mg/FYGuulAKrChMDUR2+KSLmuO/B/mbT3ClGS22ub/yH93G35kWRAkd6u+fAsI4SeMesyem/K1ELu5a/phGCzXCjqXkRa5SGXI7dFTLai2Ef+Z82lyM4+3mDNQ9hHW7SBxbcrOwJ+nVZQqCO0S796sAhdEKifXgENg2IWxado8EfLmPPE5MDSPCTd8yW6EvoYoZ9/3khvE6Sk5aoOTOBgMQeFg0+RtTrgpibIwFZitfqVozScA43Z9WCKU9Z7PHKagUnq/eybUmr2wpAOE8BA+ZZhNvqu115PSqZE64SfXk4QKMeScx8QJkhTd0AgTE83Z6S5ppLIH5bVcBQ4fjd756fk8MXOkJqqClPVssY+lhQt669ZpzPOv7b0XJpYazd715OodMAlpClOc/ppLofv07TSnJgGvtkkXhD1NApufpZMaGGTYofAxCU6RmDkNoL4kQMYX7TdGjNYd3F7GWjOwai2GRMGyvHyY90kRN2xAa1pM+/xje02xk+NZiCCuZkXiQm0ktkuhDwqqR1gyvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(36756003)(31696002)(8676002)(86362001)(8936002)(66946007)(31686004)(2616005)(6512007)(6506007)(6486002)(38100700002)(53546011)(41300700001)(2906002)(66476007)(186003)(26005)(66556008)(4326008)(54906003)(316002)(5660300002)(6916009)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3dzaGg4UnhxS2tDUzhZY0N0Vm9Cb0h1V3ppZmJCT0dHaGNNU3Mwc0drY1hm?=
 =?utf-8?B?VkNxNVh3NkNLV05OekNhc2tZNzFJSkh2ZVNMSmtOb3VqRmNQaGpoUzNnRkw0?=
 =?utf-8?B?NEk1UE15NzVWUG5tREFOQUEwY3EzZU9zVnhqRm9uWDhKaGx1bDJZM1hSU0Ny?=
 =?utf-8?B?Qi9FOXJ3a2tJdjJZTC8wMnhOakk1aFk3RWZ0eHQzQmdOUFNuM3BmL2cveklY?=
 =?utf-8?B?cEhjMUpQcTlWYy9pRkpqYVRoSEZRZWY4SUNoT1F3N2ZjL2ZiWDArM0FONXBR?=
 =?utf-8?B?VDRLUE9HRy9pSThCQlBUeUlVaFdPZ0NJOTZUa3pNSTRvMVlPUVVJamphZkdI?=
 =?utf-8?B?RjZHcnNVY0wxK09yeUJZWmxMajZtRHVCZXUrQ2pjSWZtSm9ISFE4eTZ0c3Q0?=
 =?utf-8?B?MEVERHhiK3p6SmVMRG1EMndBcmgxRXoyMkJ2QUJIamFlVm5uYXdWV1ViNGRE?=
 =?utf-8?B?cE1FWFpic0g5QVlqOTV0WHB1MXU4MlhHczI2aVQ0ZS9YR1prY1VRWFIxQWg0?=
 =?utf-8?B?SXRTeUpIOSt1emR6M3NqcUp6eVlxam8xdGZzdjBMdGZZcjlTMGE1VTA2OEZp?=
 =?utf-8?B?QWx2Y0ErVFJ1bkFlU0E4bjE5Vjc2ZTlmRmtrT0kzc0xDajBKWXdPOXEvKzNZ?=
 =?utf-8?B?S09OWXFyKzJSZ0VrU0Y1OUxBM054VVdHQy9NQnpmVHp6R3h3VUJCTVdBQm02?=
 =?utf-8?B?YkYyYzF4ZjdRVFI5VldtSG9WTjZ0M0NhbXRxQS94RFMzRnV6cGpURVZjL1ZH?=
 =?utf-8?B?ZG9va0FXQ2NYNUkyaXhlTHdJeFdWb0t5QUttUElSZC9tUHRMTThqa0JzOFFp?=
 =?utf-8?B?M0pXdlg3NCtqeW9uSllsYVoxVEU3UXpiRnJGdS9sSGRnaGtWUy9vcXZYOVBT?=
 =?utf-8?B?UVVXbGU3M3Y0Z3VEaDRRRkwzUzhWT2VTaWZNOFRHdW8zbzRpS0s3OUtKYzlK?=
 =?utf-8?B?ZDdXSzUwWk5vNGJHNlB0dkM2UFE4UlpRU0tNSzZDWlJOWkxid0JoUFN3eHBZ?=
 =?utf-8?B?SzYvYlNhTlUvTytMb1A5WWxtL3VhcFdEYzY4VDRqUGRyQWRJN2JuVUk3TXhU?=
 =?utf-8?B?QVFqQUNzV2VFbWpNUXYyNjkyK1dOUnlKak55dThDL3N3RGhZRVM2bGpBTXZr?=
 =?utf-8?B?d0RVL1kwREh6VXRaYlBibHRrdFlWK1ZKdzdsc3hhbzY0Z3psT0VqN3lJdWQz?=
 =?utf-8?B?TDI4ZUI1MWtPVXZVbUp1amZpbkh2d0dkM3plSHRQeHZ6OWN5M2tORFQvQitY?=
 =?utf-8?B?QnlUakxMSXNEMnBoSml6dDAvbXFYMjV4eGtib3NtUFRXWmxUc0tacU1iWlhX?=
 =?utf-8?B?ZmNocS8rQU5sNVNZdFJsWHZGSkZCUWJzTVdocjI0Q2xjMGJQWFBFbkgvTkZH?=
 =?utf-8?B?bURydXVRMSt6UUtQQ2NYbTdFTVhxWmdJRXB1eGpCOUJheCtUenFVc3JhQTM1?=
 =?utf-8?B?K2FVeGRRVldLOVcwNVh0eWFwSlN1LzVrS0licG95K0RSZVhHdERndy9Oem5X?=
 =?utf-8?B?dE56cGUzZXlIWGE3V1dTV09GZVZBZ2EyVTZDOGd3ay9zNExQd29Xb25YUjd5?=
 =?utf-8?B?WUFMckNLOE91V2ovZFNzdHlNMlN3UzJneUZ4TGJTS3IzREYvS1pZRTdUbjRO?=
 =?utf-8?B?WEtzcGwyR3NEZm5QdnU3d3R3aEpxSDlrelNET0x5NFZqVTVFajRpV1k3Z3Rk?=
 =?utf-8?B?WDBmS1RrWllsRm1xTzJ1UnRWeERRckRRMGZVN0VsT2lMQXRydDBoVDNUUXVJ?=
 =?utf-8?B?R3RaTDFldExVSmNiS2RlMjZ5QU5nN1QvdHkwTFd5aGp2d1Vib3N6RmdaWVkw?=
 =?utf-8?B?TFRJZFBrTkpwbENZV2ZndEdoVlZkNHhWOHVUWFRCZEtEbUVSRENRMmNyMEVR?=
 =?utf-8?B?RDJZRmxMVU9tZk1VV3VVWm0wWUUzL0pjZHhrVXJCT0FwNEhldEN4cm9OU1A0?=
 =?utf-8?B?Y3EraDRJMmJmMDNhVFBTNmF1Uzg5UCt1ejlGS2JUZGxySC93ZEVwZys3MGRZ?=
 =?utf-8?B?TWVMczFvVnBuMzVuMGFPRFRQWXBjbnptekZZWXliTG5qa2R6NjZCOUQ2UGtF?=
 =?utf-8?B?TkVmOHVFM0pLUXRQQ3VZd3R0UE5vYWRBQnVBYmFPN0JCRTBZRklFZlFwb1U0?=
 =?utf-8?Q?nkigrO0uz41OyrXDANJiTF5HJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a8fd21-d324-406f-a287-08db58430a44
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:28:36.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0In6zVngC9V9yJYRjrzY85JzNcndMXUhiQusTySXynXIN6CtebHQbgvGT+VyD1mfGb+SJ5Vp7y/ykBJ+M+Png==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7835

On 17.05.2023 17:56, Oleksii wrote:
> On Tue, 2023-05-16 at 17:42 +0200, Jan Beulich wrote:
>> On 11.05.2023 19:09, Oleksii Kurochko wrote:
>>> ===================================================================
>>> =========
>>> + *    Start addr    |   End addr        |  Size  | Slot      
>>> |area description
>>> + *
>>> ===================================================================
>>> =========
>>> + * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     |
>>> Unused
>>> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     |
>>> Fixmap
>>> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     |
>>> FDT
>>> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     |
>>> Xen
>>> + *                 ...                  |  1 GB  | L2 510     |
>>> Unused
>>> + * 0000003200000000 |  0000007f40000000 | 309 GB | L2 200-509 |
>>> Direct map
>>
>> The upper bound here is 0000007f80000000 afaict, 
> It should be 0000007f80000000. 0000007f40000000 is start address of 509
> slot.
> 
>> which then also makes
>> the earlier gap 1Gb in size.
> do you mean that it is better to write start and end address (
> 0000007f80000000 - 7FC0000000 ) of L2 510 slot explicitly?

No, not really. The ... there is quite okay imo, because of the differing
upper bits. I was merely pointing out that as you had it the gap was 2Gb
(from 0000007f40000000 till FFFFFFFFC0000000, leaving aside the ignored
upper bits).

Jan

