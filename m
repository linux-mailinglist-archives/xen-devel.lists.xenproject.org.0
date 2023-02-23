Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D0F6A05D4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500154.771389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8eT-0002IT-03; Thu, 23 Feb 2023 10:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500154.771389; Thu, 23 Feb 2023 10:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8eS-0002G4-TQ; Thu, 23 Feb 2023 10:16:36 +0000
Received: by outflank-mailman (input) for mailman id 500154;
 Thu, 23 Feb 2023 10:16:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV8eR-0002Fw-6N
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:16:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25fca62f-b363-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 11:16:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8901.eurprd04.prod.outlook.com (2603:10a6:10:2e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 10:16:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:16:31 +0000
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
X-Inumbo-ID: 25fca62f-b363-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ti7X2zlswAhXWjwTo8/aq7ZoqIXE7p6XrwdI2tDK1WJQzIXQHgj3cdr8BPBAA/Se/t5+4msLSJhEl5iAddhoOQIKBnzDDSgqokoPuPHn2D7OpCXe2hqNN3l9GUdmCzru1y/DZ2hdvL70ZNlC102pZgdBOfMV90BURlSElcVGzjFGVCbtoVflObOJBj1Sca47/1fPor9tl68cBdZwrzCuB68iU+NagwYkwBesEcoL8DnEQ7v4dHEZ7/E+a1qCkf1nc9fvWUB6rJPdz3QJKlsHQxEORdeJ9jJMPbldk29LRETGj5Gpf5IeXfNd1L6hL07R9qSS4rxc+icMbKhYZRyPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVxcu6jhcC7IgDaKNcCefb6aRdLAfRJ9BQZg18sTCBc=;
 b=cklpdSWQqpRc8FdFSSe7KcC5WpYAI6ZPAwHzO5dgSDqRNV+K9S3olYVkXZUqtPKkdL4KmxGN8P40cae1thdf6lwcFwGMxx7JOwaiuI99KwKVE+bf4FQQHh4qDiN7jB3hLGbx+cExYJOrwBae6dQ/sqpwYTPci29aZ5+HEeBF7DV8xnEGHa086cgFyhPTWlXNilVOCcFwAMc9y+1kAX+MmtY2soBa7MHw3a+Ucyh4pn0Ft9B1RjaPgPK9ApN16HDIqs06jIyFLA+Sfm6OHw60RMv+dquLidai67xDROdBBHlIKVpyFTzTCdJFdjju1DB7avoqsSDcCQW8y8WV+lddZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVxcu6jhcC7IgDaKNcCefb6aRdLAfRJ9BQZg18sTCBc=;
 b=Q6zxbCJbqL58R//lx7YWvLTsGB10yxoxz3vRpuMOMUPZdmgs0OvUb/q4u2rj3tqcHKXrN8bR9153papctx/CR8QqTrZKDqigAR1HSPAoGjV+Ur2TE9OX5lBcrSQ2Y3bMX07Jbupjdf+h6z3SyP4oie3arlbNTqnsCqlvJmGKSlWSu39JDXJLaeZ5TtjInzKaZSdjxcUw6W5Qlb3xkWLnxvs0oiaFfFqZtA5lDfJqnWjaRL2EuutWNrty4ePuMIQWjZ8GqOM6rLcQtTuiwG804+O2hzrnssg4mnK+W5fPswoPczdYu6f64BLD9P9Ae08tAqRty2LGXe3nzUJuTalgTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc46acc1-9eb9-8091-28df-405a66879a85@suse.com>
Date: Thu, 23 Feb 2023 11:16:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3054ac-cbd6-42b3-8df5-08db1587088a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pJ+cVacIIAc9BuJZpD2iYB931MxO0xKFehB52JVmYF1LXEJhLV1BE+jObAKAb1HTzKjhVy2jzopmaqGbNyymr1yB5vdpSyoMfV8bBkO/to+XDXDcbRONFw0XDSg5TZa2bPvDw0yg+mXJNMggWZxpVDVCBAW3yi9cjF3hlD9IFlhokxSU95AghcgwZzpMRUXNaE9eZxHlgkFnC0OHzeuO0G7lHkNfWs38iAGgjjpbmFmVoRL+feAZss/c+a95Tj7GFz34ZK8YrO3hxsz83IznoqYj5lxuf+pExe+bmniPcqX0XVifZR8TKtrgXo0e3hR4gUidXwOVlDpGUpm+F7MlCqUWvZY4Uim57KIvroWx90CKoFYKMqvlJ0XvSxlNDWwou9agw0oam/DaRKjRGSUr43QWSq1NdmdB0oy/myyXt3qsDnIWwP9oS3Z56ZJiu/N3sBe8NNWY4MQBIDQIqbyFItyttj3C5sEHTS8nYZo5LTC2835QKIGD1I6TBaINCgX+TKH1GUKT3C/LSeg2mbIe/tXL4H0j0oyV6jQ1OsSCMREBfC4hBGxcnXOdVyuowROUPGKlK4aserc4TeB6jr4SOCTwQIlvXUEt+Ba92KMo89Cn70FiBknpfk4+TxRVjwY9VEtqZrPoZy2LkzvKI5CPp+D2c2VjuGib6uTZU8xP/za1B9wOL/Ck9aNj9s8rFTXZNAzbd6uLO8KzoVaOU5SwNndWyG8FhUhfcyIFW4jZwWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(478600001)(31696002)(4744005)(86362001)(2906002)(38100700002)(316002)(54906003)(41300700001)(5660300002)(66946007)(66476007)(8936002)(66556008)(4326008)(6916009)(8676002)(186003)(31686004)(6486002)(26005)(6512007)(53546011)(2616005)(6506007)(6666004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFpnalQyYkcyd3BuOWc3cWNGaGxybHpFaEhibzhKclpwK2hoVFJVd1VWcFAz?=
 =?utf-8?B?bzE0NmhVL05pZHJtTXl4SDhsNm1CSmhKYXNiTUdITTVuZ2J4aENQVEFHUExD?=
 =?utf-8?B?aVNxNUQzeTJGcWxjR2dnV09rZVZ0UVVEeFFtM3NORUkrWnBNaUZucHJpNy9r?=
 =?utf-8?B?S3gzZkZVQ2NMNHQzQm4yZm1iKzNSbWFDNzRVM3pGU1cwUXZZaDNpOEhrR1Ix?=
 =?utf-8?B?SUI0VXJIdElqMEhlZVprb3RqYThCSXhlbVEzSFhET3VYU2lsbndOM2hxMUFG?=
 =?utf-8?B?MzBTR0NtTlkrVENSNDd0bHEwUlR1c25nUkk5ZjdpVm1POVlaN3A2bEdzK0o3?=
 =?utf-8?B?SEovRHI3aTRLUDhBeWMrTFJ6dXI4YzJERUtJdS8wcUlKOFBzSjFpUmhQZ3lW?=
 =?utf-8?B?TXJERFdIUVowd1RqdGYwR1ZFVHZSd1Rnc0hETVpzNERhWUkwaVVUQUNNeHRG?=
 =?utf-8?B?bXNydjJQS3NmMmxlenlLQzdSM2hqVC9sQm9QQmFBUTUvelBTN25mMHMzb2Zr?=
 =?utf-8?B?bTNzSHZRSy81MEQyeXBHVi9rOU1Ec01kMWZ0THFyaFBLa25FeFhOTVFqS09P?=
 =?utf-8?B?Yyt0TWhSQWZUYXpCTlZLdjg5ZDl2Ykh4bG5vT3gwMVVYQldhVHFVaEFjdWZ4?=
 =?utf-8?B?bEJwUjZieU1FNzVqbUswcTR1Mlc2V3NmYWxqanJtUWlzZzlrb1RnVzZ2NTBm?=
 =?utf-8?B?Q21ZcGRIV0pxQkFjTEk5aHB3KzlYUkdpbzBxbWVSeFVxZ3JuKzdEdG00V2ZO?=
 =?utf-8?B?aG52Qm9jSzJvQnpISDczTXQram5UeSsrZ2w2L2MrNXQ3M2dGN25NMmRDQjhZ?=
 =?utf-8?B?S0RwWmlXVkszVk4veDV0a0JzTFUxZU5sdmJ3Q0dhOTdZUk9xU0NGMzhiOGd3?=
 =?utf-8?B?MzRMcjVXZENrbHNSYWlDdEJnZ3M5THdKdHlibmI3NjZmWlZVQVMyMGxaNDNZ?=
 =?utf-8?B?UTRiekdtNHZwR3NIK2tjekFDRTdSdERrNXp3WjVvL1RWRkhkeDMybDE4WVkz?=
 =?utf-8?B?b3B4TGhQRGdGOVlpcHRjYnl0bHJGbUY5Z0wrQjVqUWxYTXhQeVZNL1E3Tkd2?=
 =?utf-8?B?REpSbGF0aVVsQVlHNXRzbnJoY3RxMVV6RCtTWlVEYVhHb1BaNHZ3Smt4anh1?=
 =?utf-8?B?MFlsaFRlNUo4VnZwNjlsL0Y1L3lWT25tU2tXL1RMY3puTkZXaUVYb1dOVVVZ?=
 =?utf-8?B?OHluSkxoSlZTWlg2ckFkZXFsL3FjdGxoRDNxNEZVaDIzMFFlN3k3REhMUlhn?=
 =?utf-8?B?ZTQxTEczSlJNWGxBRHgrZzI3ZnVUektUUzltZUdqdm9DRGRHem4xR3ltVDJ5?=
 =?utf-8?B?UmtJdjVYaW5XVDloemZvbml2T3dmSmUvaFVrM0RPTDNiQ1Blb2g1RkQrZmk0?=
 =?utf-8?B?WjdmZ29FR2hTNG1IR0UxR3VOWlJpejhjYVNDM0hEY0w4MUk1bHRwZ0ttUEZw?=
 =?utf-8?B?Y3NBWExFZDlJTzl1K0tlYjFmWklzVVpqalovdHhwWldmYWQ2WlZXTktXd2ww?=
 =?utf-8?B?MU1JODNsUW1QUGRON3YrWEhLdkVaL0hMcG5jYTcxanZmMzBtSXVGWGhuRE1i?=
 =?utf-8?B?a3dXbmdKT2dMUVp2WlZyM25yeWtaWnlxdUFVVDRFUHUrV1RrOFJTd3h2RUVF?=
 =?utf-8?B?cm5lTFhvR3JRZFlpck53RW40V2pPVnBYcG1aejVieGNZQkFnVUdNY0N6U0Fh?=
 =?utf-8?B?enlseldkdXRjRVFHZURaMTN3VGtid3lLZlBjRlB6OGY3OXY2QU1YTnBCaTRO?=
 =?utf-8?B?bFJNOE5yZUpCd0VyV21NOE56alZwZTEwaXZ0Z1hKSnZYQnJnYlJFaVJ3dS9q?=
 =?utf-8?B?aEVhZVlaZFRyK2FRNWRhMjVtSFVzM3hiSmRsckprUjhXakRDc3Q1VmJsZytL?=
 =?utf-8?B?MEZkUWc3ejJBMDRET3JLeVRoemVFS0JRcHZhODAwWEljbmtwaTlRQmZFdUhN?=
 =?utf-8?B?dE5tQ0RTQ29zZjViT2kzTWMyOEIxb0pCTWZMZU8xMUZ6TW9nMnJ4RnJ2dTJQ?=
 =?utf-8?B?UDEwK3UyL2NPVTZEbGNMNWNaa0NoR2tISEg4NkgraHlGM0Z4MDEzRURWV0E5?=
 =?utf-8?B?MGtsY05tUUZpYjY2R3BpZFVXZ1hGQW00U3lHcW9IVDN2U3Z0UWhLMnhUZUZQ?=
 =?utf-8?Q?7D+wsjt6aai/hebGOOb6b6aji?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3054ac-cbd6-42b3-8df5-08db1587088a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:16:31.2217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sskSXRl0IvzvqEZa/YSX+MUv2DMC8VGtb8gOArezlWlG7SWAYLb03ktnRWmzrBHiHW47zBZA1SC4/U/RAVGlGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8901

On 22.02.2023 20:14, Demi Marie Obenour wrote:
> To quote Andrew Cooper:
> 
>> I know we've had this argument before, but not calling
>> SetVirtualAddressMap() isn't a viable option.  It's a prerequisite to
>> function on literally millions of devices
> 
> Qubes OS has been shipping EFI_SET_VIRTUAL_ADDRESS_MAP for years, and I
> believe OpenXT and EVE ship it as well. Mark EFI_SET_VIRTUAL_ADDRESS_MAP
> as SUPPORTED and enable it by default.

This is insufficient justification. The main reason why we don't call
it is because it can be called only once. Any entity taking over later
(e.g. via kexec) can't do anything anymore about the virtual address
associations once set. Hence what's needed to justify a change like
this is an explanation of why this restriction is not really an issue
to anyone in any case.

Jan

