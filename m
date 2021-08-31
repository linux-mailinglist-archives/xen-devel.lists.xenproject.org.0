Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB903FC7C7
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175686.319955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3Ou-0004PS-FV; Tue, 31 Aug 2021 13:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175686.319955; Tue, 31 Aug 2021 13:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3Ou-0004Ms-BT; Tue, 31 Aug 2021 13:02:04 +0000
Received: by outflank-mailman (input) for mailman id 175686;
 Tue, 31 Aug 2021 13:02:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL3Os-0004Mi-C2
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:02:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 980eec64-c7b3-401f-8b51-465d8b0250c8;
 Tue, 31 Aug 2021 13:02:01 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-XYTYqxVaPASoOshk258ZLw-1;
 Tue, 31 Aug 2021 15:01:59 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7732.eurprd04.prod.outlook.com (2603:10a6:20b:237::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 13:01:57 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:01:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0187.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 13:01:57 +0000
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
X-Inumbo-ID: 980eec64-c7b3-401f-8b51-465d8b0250c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630414920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wplOdHMMxpXKDLAmVddJ3OanERZTDkm1khE6jb+nzh4=;
	b=fqBJCeqdYnNJg9BuCxjJlABIX2enNynXftcbmKNCN5ozS+pDxXoClhtI/mXCcKYHA3gEwb
	1D/LF6bIoxFdypd1yfPdlYbDP5zocSoqadtJN+McozGp6gDo9ZwRIwxzLdOX5uFDd/WYEf
	Vhsbde634Hig8XCqgt7xRuYGcWDdI28=
X-MC-Unique: XYTYqxVaPASoOshk258ZLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac5wB/nac5h6NgkIVNFGRlXyyw9XpLoDdGdEejuPVYCm1DQA5XJqJ7vwxEVwgzenzfhxlMQYar3h0TZgyvLGO0wfhQXfiu/KfrV0DI/r/M0LYdoXOy9aEYpV5NsZAUXMd7Ctj2Zs1VrSSAgBuByTvZ/BUUmDIadOD4qMn5HVLQJqKfLWxF8ECOZjGPiq4dT8nk2B0UbnT1TcqeGwV5FJBTgdJzrWe/OXq3eV5k4HAmAUCVaDdPYnmdrfSN6HhRlauy7vn1xIZ/SOxe81+jMgslrz8cH/KXYaPC0E5jB2HfqYPl8CZielUoaysAoY2rhf/JEYsXCKJGPNmWYJAyVMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wplOdHMMxpXKDLAmVddJ3OanERZTDkm1khE6jb+nzh4=;
 b=Yz/8OPN3suz7iSgLCSOO4KPd1EUU9nC0YEDzgOt9XySl/A7GNjAWyKDOuu5CJHjqK+W8iTbJ5mJqtu8YggBHCvC3MbeLJHgebS+LltQJ9yBnu2Xuc3jCCIFlvA79y9OSgm42SiNuJjtmwcXSiB5sChfThWcKVSs73YDAt6jGB2yA92BmtYixwBV3Onr1vzanzWwsTTqm0TnRn7H4Ht1p5ie+9np35w0LkIXr0NmC+gNrbuomtGHYHT7TtkLU+wzRUaBp78Gmva/DlXWlUAsluXUgF+w10vraAffj+O8pnwavt20TJAXN46RnNAwVs8TrNi/7ytgf1jmPLg3ezrMibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH] Config.mk: update OVMF to edk2-stable202108
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210831123637.22647-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b19def29-7287-0aa8-6bf6-1ca022de1355@suse.com>
Date: Tue, 31 Aug 2021 15:01:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210831123637.22647-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0187.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::31) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a04b7ae-eb21-4cb7-ee33-08d96c7f83ad
X-MS-TrafficTypeDiagnostic: AM8PR04MB7732:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7732B81A76274383E627B92DB3CC9@AM8PR04MB7732.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2JXracwCuNX6m4XRfsomnXhEsNyTTStW7PSwgrzjEr3zCWMr2epcPfId6tlf9Fm8PwmMoyx8BLcMrlWbu1Mr10I5TgySJm5+oUBcyCf5jKhTvHqlGIwMPZLyqq3vplJsIIaz33zQQrsAGgQXdWBldV78+hpKQlcRfYZbV7DhE/Yo6+MOy2DQhIg2tGVUBZroKvpousvS5wHCgd37VSw/1jHPQDmVHF7SU2x57rMJpV4DuR68LWAojfTe+R8Orkcg6/a9F2K8oOBsM7RLUBZ/KiMnU5lbyrFr+hS+FRk4o+SEiDy5h6ZlQO0XpuZt9pyZW8YcIlrQgffTAd8dJoD5XJz/XiM/Dzhd2o6JDY9cc1TEN2kfw0Ynb5TPqHl96CfjILDHsch8LfEhUz7CmzmRoo5tTShHlTbDTPAM3ib4Iiu/QSo9uw7W5xfW/WM/d9FyvXs/RfcBrC6VZuYg83alGESyQJoj0g7o9QpdYfAMPRGfcDOMagOmsvC8znSDLjMlt98SnstRCZNGip8qOwzZvT7QB/yphnPnQlp0g4Go4jxF12K+bzLhixCiVdGel+08cc4AWBF/V+kEs4srMgv8JnIrFPfCVIoZHfjLil7fTSIPbmQscM292GAKO8bqQsOkquNDecyBb3qSaehv2S42T/qnAps8+wcdZ9k8XikN/GWMtGFVY6igzNI1j5ED239DPkgcrKKwAr+DJOcF5fqB7AQQyIBi9fggFlAIDNOyfPo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(16576012)(53546011)(4326008)(31696002)(36756003)(54906003)(66476007)(956004)(5660300002)(2616005)(66946007)(38100700002)(4744005)(66556008)(8936002)(8676002)(316002)(83380400001)(508600001)(6666004)(31686004)(6486002)(15650500001)(26005)(186003)(6916009)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0hTc21PRWtqWGtMc1gxY3M3TDBvend2QXFzQkNLQkxscmpNdFVtMGtwMmcv?=
 =?utf-8?B?d2xvL2lia1kyMGdUQ2Y5VFBERXgwdDdvN3draDl6UTZrVEtrdGZkRCtjamdU?=
 =?utf-8?B?VXJqaUNBTHIrZDFNUUozUnZnaU9SalNNYU9JQWVFdUdYdGltaVhyKzNxUzFz?=
 =?utf-8?B?R2xmUm5LNm45VHM3ZENUVFd1ZlBOOHdRUW1DanMzYnRicUo2N0REUU9qaGNX?=
 =?utf-8?B?NVB3Sml2NUNoSEw1Skg4VzRZOUhHLzN5Q28xdkpTVlh1WGlNSStVVTZrcFI1?=
 =?utf-8?B?ZXlkNUJPV3VwWno1VzY0VEcvOHZvNURHQWNwdStEc3JYK0pqMi9QQWtXWFdO?=
 =?utf-8?B?TVo1OFNqVCszK2lpZDRtQ29BMGE1ZmlycGorTkxOV2taM2tFTjFjODRuSUt0?=
 =?utf-8?B?dGpDM0tEZUpxVEw5MlFMTmxEblMyN3VxQktFc0VqLzJVeWYyWkFuUGlVYkVo?=
 =?utf-8?B?Y1NobmdYRWFzWXRjbk9CQlI5KzdQL2VXRkJLK0dtNWNHcUYvV1RPc0tEZjlK?=
 =?utf-8?B?ZVVPMkN5cW04dnEzTzdXU1JzZFFaVGMwK1VTcURoU1ROUlZFQUhTeTNOTzAx?=
 =?utf-8?B?SFNrTWVweUpNMFdzQVl5TG9TMjlDRlkzYUoxbXErY2dxQXJXM3NKZloyTjJ5?=
 =?utf-8?B?RHJ6WGxJTnNnZHVyZnZyaVVZVC95SDZWcUZYa0NlVkVuMDBVNVpHVXF1MmVm?=
 =?utf-8?B?elZlRjYwSno0ZmloeTQvQk1NYUlHajhYTTJYZWFUS21yeExhRkNnY2J5d3Z6?=
 =?utf-8?B?RCszN3R4Y0djSUZsSzkwYWNNV0oxUTVnczc5LzhLZ0EzY1VHUzVlSmIyVjJl?=
 =?utf-8?B?dXlybDM5Ty9LbWU2MXYzZkVWcU83WnJvd2FWMlpyZ21maGc5M0l1RkFsUzds?=
 =?utf-8?B?Q2pLTnV2UE5QM3FLRFd4a21yTTljRENpWEw2NTRRK05GZmJKV0Y2MEpZK1B5?=
 =?utf-8?B?c3ZuT2MwNkJOV3EyenpKRjZMWnVGNklSU2w5UE9HTjNPWHkwMC9RUmExck9K?=
 =?utf-8?B?YmVIRzRxT01adjhwRFVPTmJXaHl1K25wN1h1Y2NTOTc5ZG85UlhIQWo1Q0FH?=
 =?utf-8?B?ZHFhYUdZS1JTRjN4Z0JwclVaY0JjV2t5V2R2RExhRTJGNVViSVBWeHNINTZP?=
 =?utf-8?B?RWNsOTlyazVzY0xTUjVTRTVDajg0Z3B3Zk55S21OQWF3ckh0ek04TE5TNXd0?=
 =?utf-8?B?Ymk5Z3RRdmZENjNQZWp3RFkwZHRXUXNZeGVVdW9sMEh2Tm5nWFllSkwxRVhK?=
 =?utf-8?B?NHhnMUNFK3o3VEkxbkhlUWxOWWlLK2hmVXlaZkxaRjNBVGErbzJEZ0lodGRH?=
 =?utf-8?B?SDVRdFQ3RFBuTDd6bzVXZVE2MXlScGZkNXd5S1paNXk2Q0dsM1RWbFVqcFRQ?=
 =?utf-8?B?aGRRMVpFSE5ZRHVuM2lTV1doY1d0ZkpyTU1ITU5KRWdEL2F0Q0hlc0RiTVM0?=
 =?utf-8?B?RkxOc0oyQWdMM3hIdnZEK2ZJblErVS9YWlBmbVpQTUN6cElaYklwYnhWZUor?=
 =?utf-8?B?RjlZUldSK2pEMG03ZWlRWW41RFJycTk0YjVyZmlMYWQrOFAvR1F6eDJVQ0pC?=
 =?utf-8?B?TEE2MUxOWW5zZWVFWlBKVHRtR2N4c3dMT0ljelRVN0xMTkFpM21KWCtnMlkz?=
 =?utf-8?B?NExuM21rQk1mbG82YzdBaTcvT3FTSWZsYURKQ20wNXR4VnlqZUp2Tm9TREVl?=
 =?utf-8?B?RkdnNVNLOExTSDRHdk5oMy9iTUtqUkVOWXJwd1c2czZuTjJvRDhqbEdneEJJ?=
 =?utf-8?Q?EwmW09iCXOxL9TQ/623JRgB2yHlE4FHN8h0RBqD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a04b7ae-eb21-4cb7-ee33-08d96c7f83ad
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:01:57.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9djRscNz3ZBDdUTURX22p0NwtGBYDPrqt7R7Mrsb5vCu+muhruLJbpysIqAu77tKfKAIDmuVav6AQ6KJFLkVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7732

On 31.08.2021 14:36, Anthony PERARD wrote:
> Update to the latest stable tag.

Largely out of curiosity - if that's truly a tag, ...

> --- a/Config.mk
> +++ b/Config.mk
> @@ -244,7 +244,7 @@ QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
>  SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
>  MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
>  endif
> -OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
> +OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5

... why not refer to it here and instead spell out a hash?

Jan


