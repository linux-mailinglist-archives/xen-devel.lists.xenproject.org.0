Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF44044315F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220347.381586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvUf-0006eC-8W; Tue, 02 Nov 2021 15:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220347.381586; Tue, 02 Nov 2021 15:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvUf-0006cQ-5G; Tue, 02 Nov 2021 15:14:33 +0000
Received: by outflank-mailman (input) for mailman id 220347;
 Tue, 02 Nov 2021 15:14:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhvUe-0006cK-7o
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:14:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93cebd58-3bef-11ec-8558-12813bfff9fa;
 Tue, 02 Nov 2021 15:14:31 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-Zzi8EBiHPtWx2FO_Iu5Kjg-1; Tue, 02 Nov 2021 16:14:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 15:14:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 15:14:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:20b:462::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 2 Nov 2021 15:14:21 +0000
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
X-Inumbo-ID: 93cebd58-3bef-11ec-8558-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635866070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVBw7AMQdgSQTvRHgIYBfd4vmJagVng9eSCcaCzr0cM=;
	b=Ix3M0TRORhkIThGhinkpgrUiAE3I6brZHOFdEIfv4AuOFVbXO+6+TC37A4pEzfQfPWlVWj
	hdXU9naohyaUsqZbqCeFaomYMDmnderou9eTXbNHSIa05SpLQjAciOUZlQyjw7qbyrb5PC
	MEZIZNMueYWBM3PGE4OPZkD/5Xd4N10=
X-MC-Unique: Zzi8EBiHPtWx2FO_Iu5Kjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrMBed56no4gBGaDFlwWfcR+OfLal5cszJV2HLqQBzZAHU+U5te/sSQu3BT7j1xbN++J+ISRZYpyjmLtUfs1jnx/jLAao4RsbMxcKf2k9igfN5UvII29YnF4gOqUgUpyoGuDZY55jA0zz+tLm/19WghGCS0xVDkhrY0pW1IUyCOVACSpQ42wDSRdLraILTPYSSUxo4zj+mzvlJnQKEQQo7QGOCzm8T0zI/o7971vhdSIs5a5AWiDGRKuf3WNgGjONYH0knAI6IMPwUtvjUD9+eZeBWjZUpGR8srOrkRPF5o9tAddX6sJGeAAh+UDAMHVu7Y3XjFUJ5oEHenICVZLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVBw7AMQdgSQTvRHgIYBfd4vmJagVng9eSCcaCzr0cM=;
 b=Mk0S2wYsbRKFF9V4CuN3YvXlOlqkCHrAKY6CmxpfTMQyHcIGf6FBHJ0jsNklJGjUOF/LK1gSmd9Dos7WpgMd0Y3baK4JSQC5kCFpqMHkAyTuOXnHPrRGmOMEvr3WvxjNaEbl/f/BOLi1xKKAMAaPHi6K4dCJW5IvYklqvCglXzJX95nYr/Awj0aeDCEjfQ2R7le4VYVHVo8wv6HPCDLJaqnhPHXFXKiRvvI5FZT4g7BLwkQlmCwBjbRBh4EivUihYccq3MHSqJzQRnXhJU36vdHSlsbdayw+yBvFwAkFmrwioz36USSrAbBYOZ0WreYMI8WLLna5w8iWvuX7Es51OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29c59040-a2bc-69d3-db02-1345b5aa2b8b@suse.com>
Date: Tue, 2 Nov 2021 16:14:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH for-4.16] x86/shstk: Fix use of shadow stacks with XPTI
 active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211102143935.17473-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211102143935.17473-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0018.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f26de23-b21a-452c-1d1a-08d99e1372cf
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70392BF2021F427AAA350455B38B9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yLt0RLs/ROISvZ6gqI0G7aNKOVfI5f1zvVaqbbeevtWXh1BPLZ5JRRm3rMLno/uP5CgqNoPifYUThA91MXpL//7b4EL//Fej/exSpy0Lyn2LhMHzBxz8T9WqiHcDcCLhOo/c5DuSZ3BRK+8mPZJkz1sdi/L5ELkDnQduT/0B2CoKnMfdmYw9fNTUqe4biMjq/LXKk17Ol/DHbSAvk8hAdxYKZgjHZ2tyho+RXsqX7AI2JsDLkwaCNfbIGQ6kXQ/CerNqitpSPK7emDH9T7aD/VM9EtSpGpNIFOHY7vyFof/BBWRoGCoQh2wHAY8KY4njyaSx0maH4baGYJg6L1L+pJC4rVMMrTkLHeOOc95iCk2PIqPQoUK45nNeXA02ETbMNeRT7uBxpzXeUuotjqFue2BhwfENxxNq/xdjMpKTSpniMUh4yTItLh3EwQYpfR8Vcc7lKLBlFpDz5SdDhcpyg3b2Zb/O9y5LSzhyJsNvKRC6x2KPVmjZNfReU39E2YlgPZEB6WIc2pwWAmCzQ8DOrUaX4TcWZcZmLhdlKV91ND1PXKILCSFmMsUStxObhtsUxq3SaVnbWQXfWBfHjS/U/c+kVXZb4FiaxY9TQ0h97iIc4Azhxs847J2O7haHoDImsjvCLYkFJJhdE627oNwInpG5cgyDaglhH1KWtd2jb+ZA5EEgZEtRIt+36oRFG1EyCxj+S7Dfy1RkJkW7eQjGKF08r+1oQ80htS8uVgc3uWMmAwkkyxWvqxQMboL1WHVk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(6486002)(54906003)(86362001)(66556008)(66476007)(31686004)(2906002)(66946007)(31696002)(36756003)(6916009)(8936002)(26005)(316002)(8676002)(186003)(2616005)(83380400001)(956004)(16576012)(4326008)(53546011)(4744005)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVFvZDdOK2NtNWFXK0t1K1ZlcC8xdFNqUmpWZEV5S1N1R2EwOWN4dk5vV0FY?=
 =?utf-8?B?R0lib096dFpkbjFQZ0Vyc29Kc2ZJTDM3cnpEWFo3QW9seDNSYy9jOGRhUy9u?=
 =?utf-8?B?cjdaOVNSdUwyelpxVWhmWC9hNk1KdUNTRmp6QlM2dWRJd3d4UUVvVW44UjJy?=
 =?utf-8?B?VXFTVlNNM0JWS29zUnpTRzZuWFN2aVB2eEhud3lNekttZHJ3VHVUMmhqN0E1?=
 =?utf-8?B?QkFiYjFOOHZqazFQRWdtRll1a29ESHhNWU1mVDF2YmNqOEMyblZ0MmR3MlNj?=
 =?utf-8?B?LzlpOUxoRExHcUxKeFFNRm1PR0dBbk9Hb3JvY2RMNFZUWEliUXV4eHlKZ2tT?=
 =?utf-8?B?Nk44SFlhVTFMVXFTWlBPZCtTYXU4NTdaa0J5Y0ZJaGwrZ0RTaUZqMWg1SGRo?=
 =?utf-8?B?WXk5VTFsS1NxYk9DT1F4WllMQitldy8zdGhLcjZReVhXRTFLbS9CNmE3UFRl?=
 =?utf-8?B?OTFqMW94V0hmTEZMVDZuSVlvTXhSaEwwQ3pvcFBNbncwdFlxVGhiUXoxVGl4?=
 =?utf-8?B?T0FSSmlWTkFjaHNSakxBUzRqRVh5aDBPelA0QUkxVm9XeHh4MUhXcDNYbjFl?=
 =?utf-8?B?Y21DUHlOa3pidGhyZVk1RHpyMEZ3blNoUmRmQUdyL3Z5NFZZbjIzajB4S3k4?=
 =?utf-8?B?djJrbTV2RnRXOUZFUWtjUzZCWkw0OU9GMjZQaGhVY3ZpMkRJRU1VMlArSDlt?=
 =?utf-8?B?RFRpTlFNTDFjZ1JnSE9KWklrTDBkYlhyMFRLYkZuejFBTC9nYjlXYm12bnhw?=
 =?utf-8?B?SDB0YlVMck1vWmRtdWl3Q3A3UmkyTko5bUVKWWxON2Y0YmdOOEFiTlVLMnI5?=
 =?utf-8?B?N0pscTNjYjU5Q0tEVngrUU1mSXJqVHE4MGZlWkVaRDYzNTFhOXhyR3lKUDht?=
 =?utf-8?B?VzlmQkJ5aytZTlNoRldIM0prelJxWkZqYVhSQlpFUU9iTTlBaG9udUh6bXhR?=
 =?utf-8?B?aHJhV2Y4cWZXYld0dG5FM0FXa0daT0dTZ3pqR0VMV1lvNlpOVUxpRnFRbHRS?=
 =?utf-8?B?V2RiVTdpcHhYK3pDdVQ5TWZqQ3hkbTVrVG5ScTh0NStXNDJTelFhTUJQZ2NB?=
 =?utf-8?B?L01YV3Zwb3dJL05mUi9JS0NBanA5SnBYcVRTdmNMOUkydXE0OXg0TUVzdEJ4?=
 =?utf-8?B?aWJLdEFlZEJzK25jNm1JckNobFlhS241OS94b2c0bHJMV2lld2xqcXBPZlh4?=
 =?utf-8?B?aXdqRmMwRC95WU5oZ3B0dmExZXMzODBkQnZ4QUxCeEw2aW5KQVdPaTF6MjNi?=
 =?utf-8?B?bkVSN0ZjSGxwRGIvT0daTjZ2c2ovdDRtczM0MmsydXk4MC9wWmNGbW9taWRB?=
 =?utf-8?B?T0VGbkRiVzNzTDdUYW0wdHpZY29JMDVPNWt6SnFKRndFRmZOQXhsWU15SHVF?=
 =?utf-8?B?RERWbHNWdGxMZWtNZmYzRUQ4ZHZEa25GWG9VTEhza0F6UW5kUTI3TVBxbzA5?=
 =?utf-8?B?V0N0d0owT2lxWVhHNnlTcXl1ZTlpTUNJNURRcGpXUWpUcmhYREFobEkrTzVF?=
 =?utf-8?B?NWd1c1VPY3JER05wTlYxR1ZJSWp5b2pNbmUveHhUc1VjZVFFSHRhWTVUbGdJ?=
 =?utf-8?B?VUd3aXNRK2I0QmpSSXZwdk1UaUcrdUVIZVcwb2tCRnErOXRFL2RIY25vM2ky?=
 =?utf-8?B?bDN0aVJJdGxpOEZablpOT1gxT2tQVTFoOHBZWHRMVnQxZDUxK28vaVQ2ZWFC?=
 =?utf-8?B?MG9sampQUlZnTHg2eE1Db2hJdE9XN3IzOTRxL3QvU0RxUmhFclpTblB3cGNO?=
 =?utf-8?B?Zno2NXFidUpHcXpYZlB6L0ZkN0FWd2J2ZUlsTzJOWXM2WmF5eTBPY0FxdjUz?=
 =?utf-8?B?RTdDcnJIa0t1YUZCTDhJdFlDZFZad2VwZ1U1WmJlbmhiMGYxQWptUmQxVW5w?=
 =?utf-8?B?cFd0TVdtc1NWbUtQdFZGVXdPTmRrK2VNdFhJV2VBbXQ2dWROUElQRGlhcWsw?=
 =?utf-8?B?aVBXTzhjOGxCeHd5Uk1CN0ZLTHV6QVhhSFpmU1FZR0pMaFNFOEZuYVZ0cElE?=
 =?utf-8?B?eDVFWUZQQUxzcUZ6ZW5uTjM4cG5xb2Z1ZDAwdk5kRzIrem9lQVgrYlJ4VWo3?=
 =?utf-8?B?L3ZoUkhGU09TY05zbjBISTBMUEpINDdKYUZpNXJENklpY1AxTkI2K0tCZmg2?=
 =?utf-8?B?UDBpQXk1VER2RDdqWVZGUjdjQm5KV0szMytaTTI4RWhLb0ZHbXpWaHYyYkJj?=
 =?utf-8?Q?tNqXVZOy8fxWmnHLNvQNTGI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f26de23-b21a-452c-1d1a-08d99e1372cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:14:21.8748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ls+UvIS5wJfHNbsLoECOsih6lnMax8mQ4DhW2jnPCXGNpBGyR7evJLB/byzlNo614f4WxBaxSyNn1yybanXBuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 02.11.2021 15:39, Andrew Cooper wrote:
> The call to setup_cpu_root_pgt(0) in smp_prepare_cpus() is too early.  It
> clones the BSP's stack while the .data mapping is still in use, causing all
> mappings to be fully read read/write (and with no guard pages either).  This
> ultimately causes #DF when trying to enter the dom0 kernel for the first time.
> 
> Defer setting up BSPs XPTI pagetable until reinit_bsp_stack() after we've set
> up proper shadow stack permissions.
> 
> Fixes: 60016604739b ("x86/shstk: Rework the stack layout to support shadow stacks")
> Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


