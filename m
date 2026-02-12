Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNb3FuGzjWl96AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:05:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08AF12CD55
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228722.1534848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUVD-00069x-5P; Thu, 12 Feb 2026 11:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228722.1534848; Thu, 12 Feb 2026 11:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUVD-00067h-2i; Thu, 12 Feb 2026 11:04:55 +0000
Received: by outflank-mailman (input) for mailman id 1228722;
 Thu, 12 Feb 2026 11:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4gJ=AQ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqUVC-0005P4-1g
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:04:54 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a86dc6a9-0802-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 12:04:53 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA5PR03MB8401.namprd03.prod.outlook.com (2603:10b6:806:475::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 11:04:51 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 11:04:50 +0000
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
X-Inumbo-ID: a86dc6a9-0802-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUoKT7CB9VsMZJXVxwt877NEZqzLY0ygwES5k8mP4s+fnj1Ki6ka2X/b7u8mn9zup5QFJSkImS+tbpDyJ5cMtfxNTYYko9feuTaK/jfay7cpAq/xHSLebvioWaIH+Nyf7ONxvANyDoI/GTHKsu4QKnNfRuqAEixfdRjXhpWxn/Y0UDdsRNH1rejdsTEQo45w1ZKJ4f8E35UrhNh8ZILh7oUW/qbv6loj0AkyydnbyBO47gyxQk5fvixiXX/IdcQ6OaxEGu5Q5RyFXlLXRg4l1T5Hhbs22ApSE+W2YSH861g3MMonjCa3Du8ZX/45h4jpR7IDyOSQs7aBCXOCTO9J5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9rIqwlrFxbq2KZIPCbzqUkfAOmnqPZlX21nZrtelDY=;
 b=IU54mxn8qS4a1u6El8GAspnd2YsJsCGhHlzvtjGYr17qdI5bXpx5C1yCegz0b9XPpvvWyAeV2da1wrq+d4gLhS1EFqfmPYqjJtcGeGQsyoU+ASyHuoRhNVCVJYgnKvNNQyD+0+Fds4CSsDSpg8w+HflR6nnI8Dw64WfWaVguxglCmIUQrlkhJsdkceofYOMzJ7c1ayoNP0l/luHRkE9dJ4Hub8xPRoHj0pEMoiNsx4x9y/a8G7fUo8uTMlay2dFkD3jFh9plzbO5bKV089xqDCxnXnXtWMjyfLYXJDSNQcF+ApDUrr2NKkQmN6XiAL2HC37xCRP9nMqGWz9z/lxlcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9rIqwlrFxbq2KZIPCbzqUkfAOmnqPZlX21nZrtelDY=;
 b=JMJmUb9bebEabGCC+X7Z6oXT8CqF+/+DKZNRXhhU5ryCJem7f/tJrTOuxBo8Aa9bgyu5rUGwuqlKX3PR+q7leAjrCRcngCs1Olq6T4qDSnHSmTDxjH6T+l2gP8pmlPHI0JK8AcJp6+MbLyg6cN+i9pDZ9cldV1st091rOiqPepQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f95c3123-48f0-45ca-9583-5628a35de907@citrix.com>
Date: Thu, 12 Feb 2026 11:04:47 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.19] SUPPORT.md: extend security support "lifetime"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <916b8eaa-f5d3-4255-a7df-95f66fa79780@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <916b8eaa-f5d3-4255-a7df-95f66fa79780@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0399.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::27) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA5PR03MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5d21d4-6e13-4c09-ac21-08de6a268b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODJoUmJNL0VxWlhWSVlUQjI4QVhSQiszb0Q0NGhrUTlLaitZeHNFcXRPc2Mw?=
 =?utf-8?B?RDNzcVd0Vmc2TWhCMFViaEl5Zk9MTlNvSHBXdnhodTJnMHhoYTIyaUV4QUlJ?=
 =?utf-8?B?WXhaMVJocnUxWXp6Ny9qL0FDOUh4M1RXdTJlVWNwTFVGUGJMQUFXYnF6d3R6?=
 =?utf-8?B?RXFnWEswMjloNlppWGNCa1ZtSTQwcGpsVVVpNVNnamRQNkpaUjFZU01EWEZP?=
 =?utf-8?B?OEhSRmRGdk0yRkszeFlGNGFEZTFQVEVEME1UVngwOVZhcFRsNElMYUYvQ2Nq?=
 =?utf-8?B?RVBValFUS0lRZytOSmV5WWE4WUxrcUptRURRNHF3WTFFcVYrcFZnOHhFcXU3?=
 =?utf-8?B?TEE1bGpZcTdHVlZSUXp2citWeW5hN1F4djZYQ3lIWURlYW0xakNjUFRqbnla?=
 =?utf-8?B?RWFydkY5d3dVd0tTV0Z2amd4bVR0TzJBVTRicEtDNTBhdjRybXB2OUJZNHlC?=
 =?utf-8?B?UTMzQXI1NEdjenpZN2tLWWRvcXY2UEdrWjRPb2hNT25acnRJQ2lzYWdndFBW?=
 =?utf-8?B?b0RrWmU1NnRzSkJ5dmdUbFZpQ2YvRTQyWXNVamdWNHJlVHROSjFiYUZ0K1Qz?=
 =?utf-8?B?UE9LeXA0ZENsZzhtVWhHS1pMY3FXa3NrWGhCZjg3MXpIYUU0WnAxaklKL2tO?=
 =?utf-8?B?SmloV2Z2QlpGY1ZaRklwVUNZQTFCbnhjUXA2RE0raTNPYmhQZWNYTzc0VzNz?=
 =?utf-8?B?bVBLQlg2bTRIdlNvU0pVQitKeTNUVE9heEF3UXlLU3ZKL0ZJK2xRcGhUT2Fv?=
 =?utf-8?B?MGYrU1Z3MlhsYmo5Z2JzUjVHdUM4aVd4WG5FZXdDVCtsa0xqUHo2ZWRVQXNw?=
 =?utf-8?B?QmRrWWxjWGt1V3h3bDRQa3VCM0kwam1mN0locXpXcXBHTzM1aVExaG91UURT?=
 =?utf-8?B?bWhoM1UrMzFFQ2xrRXdzQ0o1Y3BnYWZwUExEV0E5ckFHQjVVNVlFQ2J2QjV3?=
 =?utf-8?B?N3h5S1lsd3Bhc1l4Vjdtc2RFU0NJYXc0ZlNwNHBGMHhGeUxoTnBFL3VZdkpB?=
 =?utf-8?B?SXpVZC8vOWhDVFNnSTVTTXFubm93b1paYlNrQkNLRzVDNnl3cjRnbDlLSzJP?=
 =?utf-8?B?SUVXVVc0VnJnUVQwdVYwV2JkL1FuNlFiR2lwTWlDTGc3L2h2OHBsYmxXSHk5?=
 =?utf-8?B?OHVBYXZaVXlEVVlhL1FBK1Rkd1pmL0h4WUhtMisxT25YVjVnc2xJWlNTcVZp?=
 =?utf-8?B?ZTNBdUF5aTcwNjBtdlltZGZZQ1MrTktNZFZRWFhlaWUwbG5aNGZzYW1iOWsv?=
 =?utf-8?B?NVRQMmsxK3BJcWJ6ZitWc1J5ejVnK1c3R3oxVEt5Wk01YVl3NFNacFdDT2tI?=
 =?utf-8?B?VHlBTFk2RVJOTGpCZGNkaVloU0N2eGNYdDJ5bjRaaXdXbWtzYy9jajlDTmZp?=
 =?utf-8?B?eGdpeGZHeDVnaTlUTVRMeS8vVCtHbC9tbVhzOTllaFpmN2VmZVZMbjUzUUxu?=
 =?utf-8?B?SDA0ZXJrNVluV0sxYkUvcVFCaUppSWVpMEc1clJzN1c2ZVpOSnRYa29KNzBp?=
 =?utf-8?B?UkNralRsbUZTUXRlNTVYdVhoeExwU3VzTEl3UzV5N2FYNi9VMFptcmo1d21G?=
 =?utf-8?B?MUlBcC9qT3lESEpVZERxYm5XeGJVbWlPNWgwakVzc3h5OUZ4UE55SzBTK2p5?=
 =?utf-8?B?ek9sQ3YvZnFoQVJXVjZobUJZRHdIK29XRkZGSUV2Q3U1KzRKaG84cXlmcHpj?=
 =?utf-8?B?Nmh4REllNjAvMjRVUnlrWXdXM1hjblNDblRITTcvK243d2xPZCtsWkNYemo2?=
 =?utf-8?B?R3J1Q05NRStod3pDQkh5UDc2aFlmaUxYSDRZTldHTUMvRTdMSDFNMnVTdk4v?=
 =?utf-8?B?WHRGREZJZGQ2L0U4RUNVWS85cVplUk9aRWNzNm5vY2M2ekZWWWkxYkVCbU4v?=
 =?utf-8?B?MUhKdXJqRmtrajdHek9jc1hDSkhkTmZYaGtyOXlKWGNRYnp2R2ZVcFM4UFh2?=
 =?utf-8?B?WDhaVVZXMVhhck11dllKekFyeWVrbjhVMFJ5MG9aeHpYREo5bGQyaUFKUEp0?=
 =?utf-8?B?N21UMnVLRm9rMzFnSm1zU2tHOHhJbzJYRzdJRUx0Z0xvTHU1QkJrOHBsL2Rt?=
 =?utf-8?B?U1E3TjZ2aEFqVlZFNVhrc3B0WXplcUdpcUZHM1VvVUt4d1orMHRaYjdwYy81?=
 =?utf-8?Q?vgT0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2ZaTGNSa2xhelJDeVZJYXVrTUtvZGpicFFGbWJYMmxjQis0RThQd2grUVJV?=
 =?utf-8?B?QXRML0ROclE4a2o4bE5MV0d0TUZqY1JuLzdWZXcvK0hGKytMMkRnV1VGUzA0?=
 =?utf-8?B?YnhmalF0R0R4SVZYL2NVa2dzaWZYZStxWFVyNjc5MDNhdERVOFVHTjlqQ0RX?=
 =?utf-8?B?RUtDTUNjQ2Vrb1RLNUgxZlk0RThPQTIvNTVKdkZzS0Y0TWJUMElLRG01Qkhw?=
 =?utf-8?B?cU5YMmc1TzJrSklFbHNJOHo5bFhQcWd1RjI4MDRkUXNZeHAzOEtoWm5SalpW?=
 =?utf-8?B?a2ZXSXRUMjFGcWF4ZnE1OG1hcDFYNnBnRjNCaWVXODdJdFZZRjByaTdiQVg3?=
 =?utf-8?B?ckw1dktITTZxdmhyb0E1blMybTZxTnd6VEpzY1BqUm9JUHBHWWNuNld2a1NJ?=
 =?utf-8?B?a2ptUmlJa2Q3OVo1MHN2allJKzN4QktVUGhvWk8wOUNndU9GSGZkNGFpcjkz?=
 =?utf-8?B?b2lZVHdBTUZwZTNEQW1SYUw4ZEZBb2E2anVUL0hDSkhRTmU0bDVjZUlpVmRP?=
 =?utf-8?B?SVU1aEs5cDhZSUlZeU1FbDQwMUFUQ0xnZk4zVVJob011dXlFSmYwQlVYWloy?=
 =?utf-8?B?RkY0bHdJYVlrR3prSzFPNzRyTVA3am1rd0N1dlNUeVNndnN5aEVObVd0SkQ2?=
 =?utf-8?B?VVFyNDFXY01ydXZWbWR2REZIV0hGc3ZaMlRhMllYVkFWZitIci9sY2NwTTdE?=
 =?utf-8?B?WmlLSzhwZ1JPVnpqRW1vVHRQNFVqdGRTUTFjbk1mWUxGTis2R2YzOEVlS1M4?=
 =?utf-8?B?VzhMMnR6WTdMRnhxSGQ1RUF3TUJSdmI0aEdwMVJ1UDN5SHVETGhDeHdaV3F1?=
 =?utf-8?B?Q2N2OXpaVkp6cXB3RjZYMmdjMTk0SVkrRHdNZFpnejRwL3ZvUERFWHEyZC93?=
 =?utf-8?B?ckZvZHpRd1d5bGdJbVZXcXMra3ZmRzNxTjhtN3RiNUoxYWNNdmtYVmFtdHZs?=
 =?utf-8?B?VmtnbTh2STdxWlRENHBjaE5kUXV1N0IzSkxielJ6amNmWk1QVWRpSWhtaDhC?=
 =?utf-8?B?UWV0cStEcm44K0dzalY1emptZklRYzN1QnRNdkpGenJNTmtueWdyODJ0YjFu?=
 =?utf-8?B?N0J0Uy96ZS9VUHMyZ1pLWkRLWlh1c2dGS1Q1U1N2KzlZbUxwV3hPMkx5eGRM?=
 =?utf-8?B?ZUZEZmRZbkhxWGxMTi91ZXVmNDc1Y1BqQndPRHBhSnRybDk0ZnQ4Ym5WcExo?=
 =?utf-8?B?VEpPeDBWWFRqSHNGRVVqendBUkNVMW85ekRFYUxwK0QzcUVGQ05Rb0tRR3Nq?=
 =?utf-8?B?cEsvd1U2NjBCWUl3MkRaa054cHlWQ1Rjc1Y4SXV0dmY0d1ZXSnUwbFl0TnVp?=
 =?utf-8?B?aGRhdW05akd3VklyaDlJUmxtdTVLMGd4MUdxOVpVWE9RSDlNWGppT25yVTZW?=
 =?utf-8?B?VDZyaDNTQzVmclZtc3lFa28ycWluMUtTRDVBOHdSOGpXb3FXT0V6TGQwWlMz?=
 =?utf-8?B?ejdvY2FhSDlxS0Rwc0JPVW8vd0lTZnBzbWFSeDczLzloRkh2bU1EejFQN1Z4?=
 =?utf-8?B?c2VNRTl1eG5ZTTEvV05ZSjhieE5ac0RZdUpqUWdtSlhpUHhPb3JmSFdjWENU?=
 =?utf-8?B?U2k4Q0c0TndhUk1Qa1hnU0dYRDJCMHdrZ1cydmRjNFJXSlJOOS9md0VrdmZh?=
 =?utf-8?B?SlNTMi9TNlZWUlorWDcvUUNYajV2US9QWGQvT01OcnZaMGplSEpqMlpvc2xh?=
 =?utf-8?B?QjRYMC8xRTlWR1B2emFobzRkOXBlVExMSENlUW9xZVdMUTRHUFpDSXN2MXhx?=
 =?utf-8?B?aU9xYTZKNmlwQklEOHgzVUtsTzVndWJtWlQrbmQ5bVdDNjBUekZsNUhMNVVF?=
 =?utf-8?B?ZVZKd1poUEZkYmx0UkVod2lqMStJakdDeGdYOU9vMDlxc1VEd1hSM2VxUDUr?=
 =?utf-8?B?TitRcGh5b0tPUFpwZDhMbklDKzFtRnI0ZmtLZGZWclBCMGh5MjcvUmp6L0Z2?=
 =?utf-8?B?bU5mK00yaVQxemEzaGU4YldwdjVCMGFDR1F5LzlVbWU3SVlGeDZ1NFUwMjU2?=
 =?utf-8?B?eU9NZlMwSFJBejVXRU11T04zbnZqK21SNnpRS01GdG5YNVBOdzl2WWREdlFT?=
 =?utf-8?B?c1lmcmZYRW4yL25wR0d2bjdGeUJtdGpwbWpYTkpLSnJYalZOWkpGT044UU52?=
 =?utf-8?B?dXQ1TE04YWZ0Q1F0OGdML2x0WFkwcTkxQzJqNktJZHZaTDlrTlNwbU5kQnlo?=
 =?utf-8?B?RUtwNFdZcWtVWVQ5cWZTYmVBd0w4eWJsQmNLblUyOTlBVHBZZTVQbWhRbUtZ?=
 =?utf-8?B?ZXg3alc0bzM3SmtOSHBMNmVUY01Qd1Z6ckJMdjFCZnFsUGM0WEVGRWVoSzhh?=
 =?utf-8?B?K1RJMTF2eDNmSUdnWW9lVWwzSmhCRmpyeTVWZWkyTVA1OFVtenNUZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5d21d4-6e13-4c09-ac21-08de6a268b0f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 11:04:50.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxp/SG8GX1UXL22pwcsfCajPnUOTxzwTP4pZF9pxugEE1+AzavUbjUsJ+yMqNgozLM6cOj441lpRskiw2ZSTKh52qeIwTB36OHkXGORKSSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:community.manager@xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C08AF12CD55
X-Rspamd-Action: no action

On 12/02/2026 9:30 am, Jan Beulich wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -12,7 +12,7 @@
>      Xen-Version: 4.19
>      Initial-Release: 2024-07-29
>      Supported-Until: 2026-01-29
> -    Security-Support-Until: 2027-07-29
> +    Security-Support-Until: 2029-07-29

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


