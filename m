Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0CC3E0F09
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 09:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164172.300418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXfv-0005De-Pw; Thu, 05 Aug 2021 07:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164172.300418; Thu, 05 Aug 2021 07:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXfv-0005BC-LP; Thu, 05 Aug 2021 07:20:19 +0000
Received: by outflank-mailman (input) for mailman id 164172;
 Thu, 05 Aug 2021 07:20:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBXfu-0005An-9b
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 07:20:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc6da6b5-0276-4f4f-a600-51da885ed940;
 Thu, 05 Aug 2021 07:20:17 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-nJD6oH4_MNyDtJzhXjU0Vw-1; Thu, 05 Aug 2021 09:20:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 07:20:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 07:20:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 07:20:11 +0000
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
X-Inumbo-ID: cc6da6b5-0276-4f4f-a600-51da885ed940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628148016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2EMomkWaxoZzXGsUzuFH1inaUAtedG0NP/A7yzsiF6c=;
	b=P5BN8BCpKO7Gg20NIinhCugmNvl+flJajbIHs8OH8wRiT7aJ+1ybeMjwiSq+Im5OAYpxJE
	ERfJ8wvdCMAzu4lVvsU1Dl3Q8sJb0NZM3rl7XUvIq0HTJw1oFWkLeJo7eKp6jUV/N0uQq/
	Fxwe3A2cn2yUjgsvxqZOqP6KolpMLFU=
X-MC-Unique: nJD6oH4_MNyDtJzhXjU0Vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/fYqp5AxZtTZc0fdbdOIeWDuVEqvD6q7rUqEtDsD+hOu7zQ1WGa2s9WmowcSpbQeKiBJsNl6MSPY8uGG0Tl0yYhaKTzbFB1utzvNydV4IXXyZcfZCwF2Hqhb8AugEocYeGXnpK4rupv6Ek/eIBrlQmoc0EWZj3GzOATsejPoqdsVMtYxvkVp8aouYo5kRGfrONavEYnNDgDYRZueQ4qlTAtmqWmOgq37Rsv367akUBqyQxxWg6vWhcJBkazYkZ9QAGb4df5VYli0AjArIqZbl8gSoNADb658dKSZ0BOPaAe5zeTqXnyrUWQPJwYtxnR5VvTeaJcT1JYWPnXEcZsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EMomkWaxoZzXGsUzuFH1inaUAtedG0NP/A7yzsiF6c=;
 b=eawMkEAQxheX3VbP1IqkpfLQIFKH9o2QuWkf+wROpC4qf/3EYaYn+xGFurOs9NrV+hHMWEfsA4W+LpJg+r57TXMViVz1TxtePnpn3h9Y+JpGC/Zgx38TFqGKcgPV0bSXUxwujYh06QfukNhvnVTJ37auPEJ6xL7ISRlBhQIZ1BpZs3CSFVpj5vN9gdZeippRY7NDyk9lMXI/Zp8rw7+UGDHXB0kPcwH9aiRfXUfQ3/PF1Yv62Tpvm7rpm1xsdyGuTAP4rCO5cjAsqg8+1Eskj3V8AJNXGPqBsg1mx69nPOuwowzzUI/UyUBk7JrvRMyDCzWg/N/seDyn9DswzdtjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 20/31] build: generate "include/xen/compile.h" with
 filechk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-21-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <442ad44d-66f9-0646-18a5-441b76f91744@suse.com>
Date: Thu, 5 Aug 2021 09:20:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210701141011.785641-21-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23700f83-78d7-46bc-884f-08d957e176a2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448C5EB99E2C42D2AA90738B3F29@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eq8qPkbEgDw9SadQVQ/mvBWK05rFsQP6D5ic8Ry692oiYRAmBmuyOEf9qrLxNvIqWX+mTue8qmapDuxMb/ntx1QEhrBy94OxfQNQt3/ZU/nv1fhnLPLq6qWQ47R+GUgjmyhGBEVu6Epf9l1HP7Dul5wjF1ELsFtYP4kgmGVQuyfUsj9GTB3a52FeKyM3DKLyB/zZ9UxOODZY3Yq74QmTUzt5fLF76uZD9BaqTmLeMaYOkEX02GU4USQEVhezBJMFp6+kbuTlG5cHTRjHpt+KelX6LEpxv/garoKR/mWGmVxWcOSf4cA/YrY99P4FUHQNAyFWu0oV7uJLfsA7kieHzreetgijRJml7RqjquPEbQ9SHcuvaEFA3a9iQWE5ATMtLVvc++wGTxtGMgk1oXOY4vFqjeJ9rvOj6GM3BnPC8lw8aIq6vXB/S0MOYrDP0vrDi1J7o+GSlOBmKZacAaxLvQF7mrurdJTAtv50+bHvTvUy3ZOR6PM6OBIrEAUwLZSjofqmGjdAZd5QR1m5SJXCXeFAHNLn8TmxRAtPYOG2Dle3pjLKG+Lt4qAKgLeZARfvA31MaaCXiEKD+lf5/utYW5CRIzQd+cVF2T32p72NGK6EwZosb3sVd4jEeZVZYOJPg9HgJHT++QNH2HFPtvI50nE2fv8Yz4OkkkfFUsoY0R+aaXusCiCrWGMD/TjUPsK254bdFBJ82dk/WxZKo+qWeiCvxW0A3TV9LKlm4FTc8sc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39850400004)(396003)(376002)(346002)(31696002)(53546011)(16576012)(6916009)(4326008)(26005)(66946007)(186003)(66476007)(5660300002)(2616005)(956004)(66556008)(38100700002)(54906003)(8936002)(31686004)(478600001)(36756003)(8676002)(316002)(83380400001)(2906002)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlprQUVpRTlIT21wVTZ6VkR0VC9hQ2IvY0N6MzNvZnZNekxOcHh4SGd4V2FP?=
 =?utf-8?B?V1ZiRi9PQ3ZONllycXc0dytkbkw4d1lVNTFhQVpIc0xpNWJlWHQ5Zk04TFBZ?=
 =?utf-8?B?cVdtRWJKRjFKZnRqdlRhS3A4bjhzVVBHUlJFa29RMXVnNlFDL0t6aExFbVEz?=
 =?utf-8?B?QVp3RStiUkpOQ3laaWhZNmF0b1VvcEgxczJhdU11Z1A5NDZoWjNPaGpGM09u?=
 =?utf-8?B?RGJjK01zNU5NY2VIdTRaY3I2UkRCYXhsMG5LWHZ4NjN6aS81cS8wU1B3bTFm?=
 =?utf-8?B?MjB5L0w3OXZwdDZwd1MxNTMwZ3JVNFJCNkhSd3JHcUxKZkhwVnhwUVY3WjFu?=
 =?utf-8?B?YkZFNDQ5dTlKNFBEb2NnNytkN3Fha0Yvdi9QQTJEeE41L3FDeXVFb05EUGhX?=
 =?utf-8?B?c3dJbjhqR0w1QmdNOWIvL3h5M2hURzVJaEVqVjdjSWpJSDJPQVVBelkxOGZF?=
 =?utf-8?B?MUovWWl3SVNhQmRvZEZhdHpRUkpWc05qcGFRek1TNTA2M2xzbFZPYXR3Tm1J?=
 =?utf-8?B?eGFxREFJR05QMW5YUGtvcjg4SXZaWjNJc29RM0thLzNrSXZleUswTFBHdlFk?=
 =?utf-8?B?cjczOXVjamREbnhNd1JndnVDM2kwc3JyZy9FS3hQaEFnd3RaWHFoT0txdEtq?=
 =?utf-8?B?ZktvMUZrQVFTTzhCL1BHTVFhYmpBZ0pmeVhwQU5vZGRxZ1ZHaW1uT2VDN3l3?=
 =?utf-8?B?TDk3N3JFcGdiQzZpNm90K213NzJEaVR5SXFUbVZ2a3RtdENLanFVUmJBWmxu?=
 =?utf-8?B?WmExU29jcXRyVWJsUHMzd1FtbEJHWHlOSDA1alAxbGRweVFFdzVndlhMKzhW?=
 =?utf-8?B?MWhIZHlLSnlwZGp6SFFmcDVMbE04bCthOFc4cnNGTUhlaGw2VTN1eDdTcDlh?=
 =?utf-8?B?ZnpwOWNndGZvclJ3RFd4Sm9Nb2laZmllblpMTDRydmx2aUxsRkdjOXQ1K1Vr?=
 =?utf-8?B?cDBSZk14a2ptSnBXaUd0UFYrbEY2eDdGbFpMR3NUUzN4cXUzcjBvY2tSV0RN?=
 =?utf-8?B?NnVJWWVTYjFGZVV4NkgyR1haMVh0TXNXa1p3YWxZTXVSeXRDSjZ6M2VGTVZt?=
 =?utf-8?B?R3VCNTRGMUxlc3IvTGNzbDJOUHlkaHFrWWVNSFdjVFNISUZMSEZTWXRzU0t2?=
 =?utf-8?B?UnZiaC8ya1c1RkFwN2FKWUc5OFF6WDdtWDBWUld6MkdVNXVGdEJ6clRFdVNx?=
 =?utf-8?B?UHl3NEFwQVNsckwyUnp5ZTVmNXIrdWh3VzVEZ2xmNUt0eHU3aEM5M0RycDQr?=
 =?utf-8?B?d1hoc1QyS1Mzd1M3ODVlY0JYUGVpRU9LUWhnbkNoWUVLSEg0WENLWGNUdEV6?=
 =?utf-8?B?ZTIxT0FzQWFmYmtVZWNJcXU2YjRDWG5NY3FRTkhpVGF3ZnJsdTVhT1NMUURn?=
 =?utf-8?B?RWU2ZmpkR3E4b3o2WTBFNDVobmFERjI3WlMyM3NFdk9pZURRdW80YXFPTXV6?=
 =?utf-8?B?UjA1L2NaUlpzMHdyOG5QNlFwTzQ5SFJVRGZwWTZ1cjg3MEZsUldOVHZESnlp?=
 =?utf-8?B?cnNld1RpQUtvUnQ1ZXF4c0lZU09qYVJmakVPWjZSY0pteGlEc1RFSkc3UWhC?=
 =?utf-8?B?NjhEbldlSjhUNVZUZUN5ejRGNmx3OWJaLzFHa1dEVmJVT0ptMWU3VWFMaDBR?=
 =?utf-8?B?aExNRFpSK3NTU0lpclI3VzEzb3NyYnR4TndjN3ZZLzZuVTlqWDBWeE5hdG9v?=
 =?utf-8?B?eG1pUkZBM1hiNWNud3hPcXdBWDhTT1pRQlNxT0l0LzdHSHdGbjBnZHZRU1Q2?=
 =?utf-8?Q?DwIGGY54ay1qnUmfI+US4QZPYSywOlbEMQNroQw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23700f83-78d7-46bc-884f-08d957e176a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 07:20:12.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krXi4px0FnV6M4Rqg/o9/mCitpqFf2x5S/l1kM8rPHU/se7xjE3ENMyQj3BNuJDVZa3kyxAVnUjTJ5WpdGDctA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 01.07.2021 16:10, Anthony PERARD wrote:
> This will always try regenerate the content of compile.h, but if it
> didn't change the file isn't updated.
> 
> Also, as it's currently the case, the file isn't regenerated during
> `sudo make install` if it exist and does belong to a different user.
> 
> Thus, we can remove the target "delete-unfresh-files".
> Target $(TARGET) still need a phony dependency, so add FORCE.
> 
> This patch imports the macro 'filechk' from Linux v5.12.

Would you mind clarifying why $(if_changed ...) cannot be used here
(unlike for .banner in the earlier patch)?

> @@ -413,22 +405,29 @@ endef
>  	$(call if_changed,banner)
>  targets += .banner
>  
> -# compile.h contains dynamic build info. Rebuilt on every 'make' invocation.
> -include/xen/compile.h: include/xen/compile.h.in .banner
> -	@sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
> -	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
> -	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
> -	    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
> -	    -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
> -	    -e 's!@@compiler@@!$(shell $(CC) $(CFLAGS) --version 2>&1 | head -1)!g' \
> -	    -e 's/@@version@@/$(XEN_VERSION)/g' \
> -	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
> -	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
> -	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
> -	    < include/xen/compile.h.in > $@.new
> +# Don't refresh this files during e.g., 'sudo make install'
> +define filechk_compile.h
> +    if [ ! -r $@ -o -O $@ ]; then \
> +    sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
> +        -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
> +        -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
> +        -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
> +        -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
> +        -e 's!@@compiler@@!$(shell $(CC) $(CFLAGS) --version 2>&1 | head -1)!g' \
> +        -e 's/@@version@@/$(XEN_VERSION)/g' \
> +        -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
> +        -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
> +        -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
> +	< $<; \
> +    sed -rf tools/process-banner.sed < .banner; \
> +    else \
> +	cat $@; \
> +    fi

Just like "cat" I think the "sed" invocations should be indented deeper
than if/else/fi.

Jan


