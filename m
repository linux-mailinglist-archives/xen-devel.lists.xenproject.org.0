Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FAA6ED0B3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525457.816671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxX6-0006ey-DU; Mon, 24 Apr 2023 14:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525457.816671; Mon, 24 Apr 2023 14:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxX6-0006dF-AQ; Mon, 24 Apr 2023 14:51:12 +0000
Received: by outflank-mailman (input) for mailman id 525457;
 Mon, 24 Apr 2023 14:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqxX4-0006d9-IB
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:51:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ede294d-e2af-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 16:51:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8587.eurprd04.prod.outlook.com (2603:10a6:20b:43a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 14:50:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 14:50:59 +0000
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
X-Inumbo-ID: 6ede294d-e2af-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwskvd46SqlTRso5VWtWBCGnVBRuI7PGlJ0n5SgW+IW3scqgDPh3fZadNgA8fAM/Cp2UsRogOrT6yH327Dlldg15lVCrcR0yCSiIc4w814oYUHJ900qCvz0I+k710vUa8CbaH7kX7Ut/xLrk9sUSeci7z4Gv0KA9Mb1Jr9RCTHq1CQOE0e0VWqoqfJJNk/SCiXVkiZiSTLLvU1AsBr4tgw07Z4uwl13k2b3yWjeAwKATUJCV9rNgazncGF0PkvZKRr7lwzJhhbclOPXh6czg6mDI5ZDbONRTFpgw+c0GyMjwBabnzbQmxvFSjx3oZPOMdF07KFJB8t7+emqKlYFXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MzG3FcdovRv+RtWxcUhj/7yaDzpfcXx54EusU2lqs4=;
 b=IS0fqKmLcxRVKfQ+LXyEtbVwYtV/cRF0/dXXv3aoF2Et2099/9r+a30tWAO0Ok1TRwkm4riF7lJ4a7jMTR+4/YiUnaxXtRcx60nSVcGZ7OUSoyzGA8IODDl2S0Ft+elHeUCINV/46AidF9fdio4x+JfUnM5NWtTt0EA22LUZIVpeVMQ37L+W3XNiXlvrrmn4+ckvRDt1mpba68DrPov1FW9bqwfTONvpJk9BvW7xCDTHpBRjsr7Fqf7opkoGB7c2K56p6+ZiY/M84jW2E/u26R7zBbGHBhFL2j3TjLSVEZ3OLScKiNRUTjzrtS24iHqS+uKrsA51IfPqWurlZSOtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MzG3FcdovRv+RtWxcUhj/7yaDzpfcXx54EusU2lqs4=;
 b=Upp49Bg8OTjgyng6srace4EHVCllJGnFu0EBCyJ0zgcsNcu9HNk/52KVAxS6sVffTKFT+qd5jQMGz6KSfqKOHC54l5WMnxoajne+BGnTU4cjC8JARNqjlu5bq1p6SdCKKv0GBZWQXngxHUKCCkE7+HnsB5YdduBmBdx7vmkOQx7AbGXTk78lNp1futEl8QTyMPdvi9VXJn9RVFI7Is16gTujnV46IhzlyfGZS6EpoLveTQdMRDKdthwWg2+2x65sWdo8GdLFdjLHVKKBXL7X2dSWgifNApW1G2wf1r7IEGqmxyGQNZ1rcMZ4XYOzti324hBLeP7or2362erfQ0kLCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <626da7fb-9934-2a85-0022-90ae32f1a748@suse.com>
Date: Mon, 24 Apr 2023 16:50:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] xen: add support for crash dump analysis with xen.efi
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230424143057.27469-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230424143057.27469-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: f3330234-07d6-44a4-b62d-08db44d35131
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sKD3EXxth8hCmYq2G4NJX6Ja19PPsetd0FU0aq8tL5psrul9YSNblSwf4LAmDrs6jTvSdd/yiBrAtGkyxyP522U/ISdzWUuGt4dBUOuXDnp29B25dg/rWGM0nrYLA41Fyi8I9cYCjGUpbpbLY68G1JjDzT7vewlqKy1LTJlxIEEFyYhjEJz80G9kyYIKv9l33LGYRM4RQ20jQNwmc3IN35oZP6Z8ApV39rNvxYKsyD6k0w3j/rX8kLXjm0NRe7wkAnTRcEBR9m/8IHJsaJaDJ/tghaEyZC8bNJD40eSkOMJrwl2qRwhFz1v3FUf4RyAfgvXBBp72jjcVSkrQlVWOujqNXaAK3XqljAP95eP2st2Zr2iE9h5BICnT28RfLHIs6OdIUJLyAMqbBLABLVErxwuVE3ogZkrf104Mxk4+/5fF2nPFTpVQxedbREacQuxIFrO1SAl55Yf7ixS18LWsnQUyBwa8okhR+cgjb4DNBjB95v0a0gSGoKa9a441qnR/SrxR7U2ke+Zz6bDv1CRKWxAoi5X41Gm30POCTChlf4/V+jko1B3ps4njYxxBXvuiCHDWIoYFkS77i+KEYVYXTRDD1v69YiZN6k9CGjxiaYCOmw0/NeJafYGVSryR20PzpszQlnMiLfQzCg+CsrhsQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(6486002)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(66946007)(66556008)(66476007)(6862004)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(54906003)(6636002)(37006003)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWtHek9uQ3ZqSHR1bTNDTFVJaENOVVBuaExwNm9lSndSZTFwVEtqSTQzVzF1?=
 =?utf-8?B?cjZXVFBHT005RHZvZjJxaEJhOVg4Rzl6WGUvU2JsSVdrVFdsVHpRQUhlT1Mw?=
 =?utf-8?B?eDdlOGo4VzZMekttcjVkZlRsOUErcmdTR3A3MkQyc2h3eVVJTi93MkJ0cHdw?=
 =?utf-8?B?Nit2dW5HN25mSUx3eVhLZnl6QU5HL3RjQzlSR24zWU9HUGU2c3psbm5kR2lL?=
 =?utf-8?B?RHFiQnlRNVNseE9WV0xvQy9wZkkzbGs4SldyY3dIRXg4akRwanlOVGxKUXBU?=
 =?utf-8?B?MHVVY3JEQmFCTUpJa1NlUHh2Nm53cWxJcURKa0p6WFh6STFYc0dMRVBwUmw0?=
 =?utf-8?B?Rjl6c0llTVhaUVFlMFRVeC9xY3lYWE9xdFk5aDdVMVZRYzZoQVNOMnZzeTRP?=
 =?utf-8?B?ZFBtMmw0Sk1wUUkxMTdYUkx0cU9LV2F2NTRnZ09hRnZqZk5IR3dUMFBJUmNX?=
 =?utf-8?B?cEp6K1NXVXRGVm9ZTG0yU2xVK3J0NFU3Yi9GWEhnbHVxd1RuVUtsdzN2RExL?=
 =?utf-8?B?dm4vcXcxclFBQjMrVlpnZ2laQklqTk96TEg2MlRnbTZNRUl2QjZ3cjVPVEIz?=
 =?utf-8?B?ZHhmbHhsa08wRjNLblFwYlhQdlFsbjFMNHhSVTdZVlVmb0dWZ01EVmhINzN1?=
 =?utf-8?B?TG9lM2dJUTkrT3U0NEc1K0NJK2d5QzNoWWJQNldmTE13Z3F0RUdJeVpGRGV1?=
 =?utf-8?B?TDQxLzE1L2ZoVHZ0V0UyTTh2VmZRNXhkRkpIN0Qwd3Vzb2pjQTZuRSs2bTV5?=
 =?utf-8?B?QlNiN0tpNUt4WGcrYU9GVXVaNFR1SFhQc1dVY25UcnZ2M3R0M21LQzhWUitm?=
 =?utf-8?B?QnNqVnRCNHZ5bVdGVjREZUNNWjBBUjZQTUhxTW5HUnFvVWpnK2Z4bXQ4bVNs?=
 =?utf-8?B?djUrOWMwakdYV0dTTkxhQ0xGRlFhODNQdnpHbHhZMXJjM1RKRzFJRm9jeXc0?=
 =?utf-8?B?am42ekxpdjRvRlQ0Sk5yYXJkUnBudlM2eVY5Q2p1YVlzcUVNcU5oSXBiWDUv?=
 =?utf-8?B?VjZOdEdZdE1KL0diQVl5eWNNYnYvQ0dwOXlaKzlYR2dQWnd4OXR3ektWKy9B?=
 =?utf-8?B?MUdMT09BRUN4OUlnaEtVWnpLYnhkR0tLUUUvcXVmL3M5WHdodkFKYmZZT2FN?=
 =?utf-8?B?QkUvc0ZXVTI3ZzFtOHl1aVFiRG9iaFBwRXlibGVZY2JQUkpRNUdLZFFadkJo?=
 =?utf-8?B?UGExQ1RLcTI3RFNDVHJncDBnVnkwWmxKSFZldlJ4a09abXdQYmVKdXgydVFi?=
 =?utf-8?B?dTBOZUVhaVpDMDBJVHJrVlNXZW9MOUlNa2V4dmxDZ3NWT1BvTHRrekU0RmRk?=
 =?utf-8?B?RWFnM1lYcmJhTjIrdGp3ZlZybnN6aXFxZ0tEZjZPMWJMSTZXNzViRzB1NDJu?=
 =?utf-8?B?RlF2eVNoQUVUTjl4VFVjSG5lbVA3MHYrS2xua0RQVTFkRjMydlV4aWswVHFN?=
 =?utf-8?B?UGF2dnlGOUJyMUQrMThJeFcvZnE0Z1hZeTIra3FnS1FCbEpaZWx6VktVVEtJ?=
 =?utf-8?B?MGNJM283NjEvT25xQlZMa21WQmVkdWRla09nWHUxd0FBV0lBZFpISytGWnc0?=
 =?utf-8?B?akVZZDlkUG1YRUNhbnRmcTRUdTRsazlweGgwTFF2VmZwRENFMGluRDg2M0pj?=
 =?utf-8?B?S08yUk8rSGViWklvYnVFcVBhcTZuV0JZWGlRMzlsb1hwM1JWME15OVdTb2Nr?=
 =?utf-8?B?YzF6UVp2VFZPcGRrcVBOdzVxV3FyNklBcmREeDBQTWkzUHdVNmdJbXlqbnRa?=
 =?utf-8?B?b25sKzFNTlpiMWNNcWdnREx5Y2cwL3cwWWJPYjhZakcvNWxDS3RKdFFGeFV4?=
 =?utf-8?B?QWJXdHdsSnVmOHNVVTBnZ2kxNml2QlJwQzBZd0ZickN5RG9ZcXJrR256Njkr?=
 =?utf-8?B?MW5MeGtSZzlEc3FkQzFrWGhmdyszR2tUaWxpdXNOUEhhWEZZSmdiem56ZDJB?=
 =?utf-8?B?cmhXQ1p6WTRuRkFxMEppemRQNGl0RkY3TGhkWVdzK3JFRmNKcDJwUkt1YndW?=
 =?utf-8?B?TDVwYzkzUENwbC9XODdrTTlDNld4T3FGZzhlRFBTUFYzTmFROHc2TnB5TTRz?=
 =?utf-8?B?cDg5K2xlS2dZMTZqcXd2NWJTb3FzNXdSQ0YzaHU4ZXpGV1Y4Z1IzLytrZVJv?=
 =?utf-8?Q?IqPXMJPLJlycAmrS/O/F98l61?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3330234-07d6-44a4-b62d-08db44d35131
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:50:59.5299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0yE/zSJIUnu/GtzbuFJESedxqo+UfaxnIUrzPQnkU4EqJiBvxbFNBSENAvP1cj5Anai4RgHWdRgVC13mjenoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8587

On 24.04.2023 16:30, Juergen Gross wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -226,6 +226,9 @@ endif
>  	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
>  	$(NM) -pa --format=sysv $(@D)/$(@F) \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
> +ifeq ($(CONFIG_DEBUG_INFO),y)
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:,$(OBJCOPY) -O elf64-x86-64 $@ $@.elf)

This only addresses one of the two earlier raised aspects, as you didn't
use what I proposed:

	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:)$(OBJCOPY) -O elf64-x86-64 $@ $@.elf

Quite possibly because there was a blank missing in there, to separate
the colon from $(OBJCOPY). Preferably with the adjustment (which I'd
be fine doing while committing, as long as you're okay)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

To also mention what we have just discussed: Since we're talking about
duplicating over 30Mb of data (at least according to my build), an
option is going to be to then strip debug info off of xen.efi itself,
getting its size into reasonable range again.

Jan

