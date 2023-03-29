Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87976CD3CF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 09:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516092.799661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQed-0000vA-CR; Wed, 29 Mar 2023 07:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516092.799661; Wed, 29 Mar 2023 07:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQed-0000rr-93; Wed, 29 Mar 2023 07:55:35 +0000
Received: by outflank-mailman (input) for mailman id 516092;
 Wed, 29 Mar 2023 07:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phQeb-0000rl-SV
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 07:55:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13e3dc2c-ce07-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 09:55:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7810.eurprd04.prod.outlook.com (2603:10a6:20b:237::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Wed, 29 Mar
 2023 07:55:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 07:55:29 +0000
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
X-Inumbo-ID: 13e3dc2c-ce07-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUW+GQs8nNwFSyb0N2EoUJnnTb8b04LjywLP85c9owWm16yDVf3enuivMrOSdBlDLH5pP1zr/hKgKTLFIjzVHTGfvYc3YxghkM/bd5735vPdzh65C+CbDzzpki7l0Am2Oo0Sff210DYv8K/ZzmE6GEz1paqA/0aSrNBnJxL61AIKocIauzEAtcZ4p/Op4G+CbbSeWO3xIiksn0rpGt4nIjoq+11ro/2ZD807iOscbKieOT5x41/TCKijPdL/Za/5X6GKJryqdVYEXO5VIq0/Sfefk0lVoUXPmTKfnq7J3vWOWUNRp4TVrL3uZP5OWgPZKU0mDOd5KWsOEsl7KuVejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aw+6nKsp25v0JyTW/mJ0Av+Mg24DK3K6bNYchYNO60g=;
 b=XszwJ1pXSTayxRcMPE7NHa2ajdZlfuaxnPhF89zIp+cxGjvmBK//1kwlfyialPaM56i6DuN5Dly/YEnf9FA4FpbdX+QVku++xLqy50pHhoUGyU7sJkY27iBJbBfyEngQ7SsnT/za67EedMINX+6O5Qzk0yTPmUB2/bZUU+oXszly6JH2gc9YSd/bSopjVmzQAaBOh5csy9nJQDGunPApyhYe60Vw2yyst0ybUa26ZKNLLH3rC9jnAZPWkS2fAnShhc/Zoo9M1c9gf8h2PdomZvCwfqvwpkISLNxe/Qdzt+UPDHcLRIarCHWP/pdXSKe0Iut4ZmGzmuDmXrGLTvFKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw+6nKsp25v0JyTW/mJ0Av+Mg24DK3K6bNYchYNO60g=;
 b=UZTyAhRNu6rM/5XrUEYwQgdps8P4H16P72IKrxQPvHc69c+RVyVYvq1HxjDCI/8PAQYsG92BJeqrn3F+fC7oM/mWVk+ppIvEOA07rIobcvxaE+2KZ9giBt0Bk9gApJpeMTTZJV8wiIonJqpB+symwLUWnGBYLOVsXU/jr/Pwt3NNUfvLP2USU2SVkjjsN+UzuhbWgqnebh/V7+EEn59KdKugSZBcFSiZ4zE6Nb9wMb4kQ/HrxSnXppP2JSNIAiELDZwdbZ9KDzd5hO9QVw2Fk6VZUlR4023x382DvMBtptRdtlmlZ9vAGoUEHv7wWwd6srBDlcsUqEqUMGQJeQ3YpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85db0f26-7f3b-7956-a25b-f5b09db217f7@suse.com>
Date: Wed, 29 Mar 2023 09:55:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230324121738.4920-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230324121738.4920-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8f7b86-3a77-42bc-da61-08db302af6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ir3L2c47cCYq71ueZp2Ee5vyhhxthBHeH91PDrWd1ZAjl87jCnlBVjNSG9NfqA3hxbPd0xKCXfwYtBOVslstA4q5/XTq+P7CV3WpQVY28kgxW/aZTy1KoJqZhbDXU+23qGhu0iEMHQY2UdPwGFBawIaxwP2e6gpW5U3fvjopMgPJlCG6b8tJAVgr0mLO7UPLv7UQUkbdjwjly4L+TqfQpsz64MhFRGSrBiBNQDbs19Cp0rVWuhvxu/TjU2IYqyF2MpcH2Km1T1IApoA265FmoRc3arplhu7C7bZN9SNRnMrLyEE8ZJnV72R0uMXqylirotX44XE91nU1OapVHHs6JwWTAXryw/i76tmpRdu1Qt4KLtk6CDkDR9hJPNDaY4c2PG4FExve4WM60iC47iMtG7NLWNkI3xqqVo9XJdYSAYhMkO5biLZqoZY8FxMxF//jlHIkkUx7Pysqm+eiy2R86MA7Lo0Ixtg5+uQ6emDpneWpzcXmj9cGbrqADI2xrobAArUgU8DkRG0ua9EjDDw37+aeBbf2lH5gRs90eAvP8B1/6VWgv5fSz0Dof+nNnBaZypy2Y8qo+UyWcbv1Q9uoiA8ZIIU54CCYC1W21N+SABI87/QNH7lDTfjqhWhxOgCu5vFrb4iA4B8+UCgIPRVGXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(2906002)(2616005)(83380400001)(6512007)(6916009)(8676002)(66946007)(4326008)(66476007)(66556008)(478600001)(53546011)(26005)(316002)(6506007)(186003)(38100700002)(36756003)(86362001)(41300700001)(31696002)(5660300002)(6486002)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L21aeEVkajMrYXorTGd1R0VzaDJ5bXBCYndRV0lDVkx2WDg3SmI5NldSS1Fm?=
 =?utf-8?B?dHNLb0ZTWHk4eEpFQ21QUDhXWmNZcEhqZ1VXeWJ0ZXdIVzQ3VjBlb2hOUUdY?=
 =?utf-8?B?cTBhZXhCOVBCa1dEQ1NxWEEydzJ0ZC9kbm0vaXpQOEltb3V4bUVUL2lBSjdH?=
 =?utf-8?B?OEZYQ0tuZG9GdGEzRkY3azRWakthZTJlOHQ3MUtndlhjTkh2K2ZFZkk3U1VG?=
 =?utf-8?B?RE5CSTFrL05NRFY4bm5ySlhKZDlHSVdBRS9MZ3UwNUJqSDlkTW1FYmxaQkg0?=
 =?utf-8?B?RmRmK0wxNG9zb21CS010VURZTDJ6TktOOU0yNEhFQjZmN3QzZjRtYnZKMjBt?=
 =?utf-8?B?cm5LVDVSaWlEMExtdDNhbEdmU0tOS2tJWWcxeHRKVXRLTVNtTWV6Y2lLWFdE?=
 =?utf-8?B?aitXcTlnK04yYnlnL1BzZ3NWcnRCSGVSTVR0Q1VWT0t0WmwxKzY4MUl3d1Fz?=
 =?utf-8?B?SWVNaTZKOWc5MkRUTngyTmx4am1WVmhmUGpVWjVyOHlKZDd4bHlMVGxrTVNk?=
 =?utf-8?B?VmpySzg3Z0dXOFV5akExMGlpWU01MitEdVZJNlVXM2IreGxWWE1WdjliVmRa?=
 =?utf-8?B?Ny9OZ1pnVnlCK3VFOHBEcTRvQklvSkhvN3ZkWlMyMlM2bzlpeEhtY0hURDlL?=
 =?utf-8?B?YlVwc1hzYTkvb3J3OFpFTTBwSHBtNGp6ZHc2NDBtc3dMZzRVOWNLVzRiQXpu?=
 =?utf-8?B?aWNpTEZxODd1RXIrc0g4YnBHcEhUTmpDZFlGaXNTd3FycDlPM1Q5a002UERZ?=
 =?utf-8?B?TjJzUytrQnhjODZyMFhUVnVvbjhGcHZ6SkxVTEJnRVNsMmhlR3Q5U0FFUmUy?=
 =?utf-8?B?Y0c1UlBTcGRhZUJyOEVjZkJzRVR2OUp0ZkxkeUxZQzhlS3FqWVgxQUl2blNO?=
 =?utf-8?B?eG9JS0ZGVmJiNkFkK2p1a2wxcVJqOEVCNnJIa2JoWEI3SGxlNkVYU21ldkFT?=
 =?utf-8?B?Q2txenlMZDBzMTBiU2JYWDF3aTc5Sm1JemtUeXNMVDNhbFg0aFlqY1JMVysx?=
 =?utf-8?B?U0x2Umd5WmovK1dnMHMxMU5peXltRXkraGlXbEl5RmxGVVYwWHZDRUozY3do?=
 =?utf-8?B?aHZHVVJpVkVraXVRU2hXZlR5WHRNbWZqZm52eGw2VDNINnFiaTFhOTgzaWti?=
 =?utf-8?B?eFFTY2QwRUFxdzU2emhVUlpKN2NPZVAvM3NDdldET1VGaUlYTE56Y3E4a0ZW?=
 =?utf-8?B?eFhYd0RCQ3J3aUFmMWlGRzY5VDJ3eU5QK2N2aGlhSFpUY2M0cU4vZVhUOUlG?=
 =?utf-8?B?YXFDVktHMTNaNFc3Ni9vUXoxMEYrYWRxQzk2K0JBUFFKaXRCVUhJcmR1SkhO?=
 =?utf-8?B?K2orZ1BDR09PTmV2L1JmYVh1UytBKzVRRWs0WEVrQWZLV2pQWldnZ2Fjb3Mr?=
 =?utf-8?B?aHUwcFVacEUzVlRScXQ0ODhiN1pLcnkxVnNQWGlCeDd6TSt5YndZS2NhaEhz?=
 =?utf-8?B?YWVCb3RmN0R0YndVTFJJck5CcUhVQ2NYQklXbmRaY3NwZ2VCd2N0RUg0dSts?=
 =?utf-8?B?Rk1pQ3R3R3pFZjExZWRCdkhwR1pkYkJBTGNabTR5azltYUNOV0ZrUzU3c1R5?=
 =?utf-8?B?ZHlhWWJlVk1JZGRBc2hmTTRHNEcyK1EvUWQ3Wlhmb2EvNzJKZndEWElZZVhy?=
 =?utf-8?B?QXBWOTdoZWczZmgwS1BTK1NHd3pkVDhDamxqZkxOR2ltWnQxNkk5ZUlFdmtO?=
 =?utf-8?B?RkZvWVhkdHNOYld6Mm5MU1Z3MHpzbWd0SHlZTEtBT09MZmFSdFhlYlNCWmhk?=
 =?utf-8?B?UGtlOFhIcFFhdXJ4VGErUElTQmgvN2JYSkJ2NzUrYnc5U2xlYjJMRUtyZ2h0?=
 =?utf-8?B?OXRLcjJPR3pJMU9VeGVOTitaMVZMRExpczY2OWlQSnpvZzQ3MzZRc3loRnhZ?=
 =?utf-8?B?aExEN1RvSkZQS2hnVEhDWmR3Zit3MW9EWFhpNUNXbFVzbDJBd3JnN2lZYW5N?=
 =?utf-8?B?d2I1V2VPdHVSUmVteFlndUZOVVJxeU9Va0lPNmhITFFxVThvVnF1czlxdk5o?=
 =?utf-8?B?OWkzRUtaOWsrZFFkT0V0MU9yYXRQcklGbk9udXgrYzFNdlBNaFpLZG81MCtl?=
 =?utf-8?B?cGZzVVhQT2RTWmlvNWJmRmU0N0lWR2huVDlKaEx6ZjBrUis3TC9ZZGFNSkFs?=
 =?utf-8?Q?yK1Idy7ovhuAZi0A84t71gFgy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8f7b86-3a77-42bc-da61-08db302af6c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 07:55:29.1387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0genY/SPcOlWzLugoZTepyzX+G9wZI0YHcn459+jTJKN+AmDLQ7YYTmS2wexomh5R5PvLH0eXMlYaYAINmSSkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7810

On 24.03.2023 13:17, Roger Pau Monne wrote:
> The handling of the MSI-X table accesses by Xen requires that any
> pages part of the MSI-X related tables are not mapped into the domain
> physmap.  As a result, any device registers in the same pages as the
> start or the end of the MSIX or PBA tables is not currently
> accessible, as the accesses are just dropped.
> 
> Note the spec forbids such placing of registers, as the MSIX and PBA
> tables must be 4K isolated from any other registers:
> 
> "If a Base Address register that maps address space for the MSI-X
> Table or MSI-X PBA also maps other usable address space that is not
> associated with MSI-X structures, locations (e.g., for CSRs) used in
> the other address space must not share any naturally aligned 4-KB
> address range with one where either MSI-X structure resides."
> 
> Yet the 'Intel Wi-Fi 6 AX201' device on one of my boxes has registers
> in the same page as the MSIX tables, and thus won't work on a PVH dom0
> without this fix.
> 
> In order to cope with the behavior passthrough any accesses that fall
> on the same page as the MSIX tables (but don't fall in between) to the
> underlying hardware.  Such forwarding also takes care of the PBA
> accesses, so it allows to remove the code doing this handling in
> msix_{read,write}.  Note that as a result accesses to the PBA array
> are no longer limited to 4 and 8 byte sizes, there's no access size
> restriction for PBA accesses documented in the specification.

I should have (re)checked the spec. There is a restriction, common to table
and PBA: "For all accesses to MSI-X Table and MSI-X PBA fields, software
must use aligned full DWORD or aligned full QWORD transactions; otherwise,
the result is undefined."

Jan


