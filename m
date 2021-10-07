Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06D4255DE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 16:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203753.358898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYUne-0005uW-Ow; Thu, 07 Oct 2021 14:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203753.358898; Thu, 07 Oct 2021 14:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYUne-0005sZ-LU; Thu, 07 Oct 2021 14:55:10 +0000
Received: by outflank-mailman (input) for mailman id 203753;
 Thu, 07 Oct 2021 14:55:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYUnc-0005sT-S7
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 14:55:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc3e49d3-689b-444d-a328-efe0e9238bbf;
 Thu, 07 Oct 2021 14:55:07 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-COH2gcDFPWW9x_uq-I4kwA-1; Thu, 07 Oct 2021 16:55:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 14:55:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 14:55:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0110.eurprd06.prod.outlook.com (2603:10a6:20b:465::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 14:55:02 +0000
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
X-Inumbo-ID: bc3e49d3-689b-444d-a328-efe0e9238bbf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633618506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qABAAvH1Bi4IVa+09q/nwNE1yzSoaRudcTcKA+srxQ=;
	b=Ov1EEIUa/K2EP9xgA0SQd1b+Slt21FbaQ+rJEyU8hAZbD8KzrnffhvKETMtuKpdeadeaZv
	oIcem5iVtVLybmUQAtCXKPL8zEICMzKy4z4KTBkvElpYmVlUVgV156t3Oa+4Hovwd/vIdY
	s7vsl3u1lE9yZdlSP1ZqLDgh880egrQ=
X-MC-Unique: COH2gcDFPWW9x_uq-I4kwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j61IafpnuOU1Zw1i3w5e9Mp+OkU26AeNfQy2e6MQCilqhPscW+ZmTaBvO3NjZiju1EFAeZDcb0XbUIe5uE7R6RdNeSnaQdynf9mmXoQ9k13S5RqqHR0cVKotNzORqQHPyjECUGeO8TelXkZwX/4sD9ZM+6l1VycCyxKmZQ4I4YjLeMe8YORgNrssU8ME56bq3+QhBbrFK0MRJD5iZEKBGzOug/NJk/+nclnczzRPEwztL2XH7fdOiNFbKEGe9MrnDZIOi4IGTar3z9Z8wzLmnbeW7Hi0PUkSECRAerTUZvOkdRed3mFJ9S8G9Bpx/e6fwzrKQcs4h2lMjxpLdUvmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qABAAvH1Bi4IVa+09q/nwNE1yzSoaRudcTcKA+srxQ=;
 b=bx00YxHIJ0aGs30h40/KHsJPDQP1EqhXZWVgevQvS/oD03JtsWqFlLReeXwBtx1LxEuEZhEARI+oGAvDms7wjC+N4th1E32S/yN+FV/s2MNQFo6d100y98l2rsv9+AAWc3qNVascrsWnieWG0aSctVM8wJYG9ZMz3THlvwtpJh2/A7AsCpdt5Bc4/6lZ3zVT8QEv6q30RwpXZ4gBW3dxE1eqlj5AnaklFXeFhKQgvYrWU9gwrZk0hEkdYASpGVgi07ANZiVajKxHwa/4K1eZvrvXAnZsBVw2bB7M4VtAYkDkhmz5PlNhtZXh+YXLgAxJN53ssG1KVToOI3dc0JWWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 16/51] build: generate "include/xen/compile.h" with
 if_changed
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-17-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e895337f-e640-f7ea-2737-036797fc939a@suse.com>
Date: Thu, 7 Oct 2021 16:55:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-17-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0110.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3f94c67-2d44-47ff-cacf-08d989a271ca
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957A2E01A2E436E9AE5BAABB3B19@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aS6QCcZQTyh+4Ggpi6ouDFl0/WJFQD6IH5vAerOSlwc/ZEtGrUvQph4u75mM04U8bPU7ZScpSHaAl+KICHQR/F0I0jqVbqspUvXiB8PaDq1fTueDRwMd+KoTu3RAPKgdtUuyYxexn/iwU1VQscTMjiT8pLnwvhYFlyJvKB+A9oAHxpxGmig5r0Kxm/XMW98s6TL4F70iQpYh2460RhOT2SwT1TkmC3zIQ/jIfS+HnW3keOR6eKioDqNRGciyjpc2/34tElG8580C4gnwS3vMUm5KIvKxm1xn9mnUVNLLhgmDh1azl2wGJ0107U7Z1YMaDFJjCpmTtsqjfq4D9zgO/5YDDQ6bGh+uBLZ4H6h6h0UKNIRs5DdRHDw/slGxkWvxReLF8z38N0xR7TEGD3Q0EGJdcxNmlS2GrBF2MzqyURhghc9cU/kCDdw6q/DsLrF6QiyUs1UfYScD/DrOeaTh57WoWu4rrIrnRr1KmIhLOifwFG2296MzZ22ThP38vkuH/Q5faUa7dRIubOPxpJzu4MpiiE8OesW5B9lveFMccumAsX9M+pvf1dMyU2R1qOZ1CoQeZ4tItXqZeYzTIq4LOVvKsubVQFE7DAz2KGvvtqDq+90HO2ZTVVypFP4I0s+tOVJmyGCn2S8dDUQ3FWNNgO0lLGX9h0bgp4xGlGz8uBaEiVwKOL251BBjGRItbvimUXr7sdp+lAm7XD7IRXURZbVbxNwun6PYoRm5VSJDHOYjGyZ7JTvXT6I11IYb8RFJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(8936002)(16576012)(66946007)(316002)(66476007)(5660300002)(6486002)(2906002)(26005)(31686004)(6916009)(31696002)(38100700002)(83380400001)(54906003)(8676002)(36756003)(2616005)(86362001)(4326008)(956004)(508600001)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2l1ZTRaYUMvVTZ6bW1rWDlqU01mVWlrQnRXbE85a0Z0U1pDa0IwZ3B0Z3Ew?=
 =?utf-8?B?alpPZlpEYS9zT0QwYmFPTHYxUnRpc3FLdGhFQkw2SjJLOGNsamJlT0FaR1Ji?=
 =?utf-8?B?UDlEQkVsM044ekRJUUJMVHVoWW1EY2ZFT3N2UEZYc3pQTUNUWnp3UlJnZ2Js?=
 =?utf-8?B?cnhkU3pJRzFqc3MwOGN1RUNmTXppNlhONzFSVnFPa0xqa29OOGJ0RVhuemlD?=
 =?utf-8?B?WCsybUh1NlpFSW1RTTZmMXBkaWROelJPMWdxWTZrdTJPTHBzbUw4N1pYOEo3?=
 =?utf-8?B?N1pGSk1SSU41Y0JKRjZYK2ltVCtGbU8wUGYzMWh2a1BJTlZET2JhckdWVVZi?=
 =?utf-8?B?MXZuVHNaQ2JDTWthTnRMc2pvZnNzTTkxekR0QjBWTXNqNkt0bGpMN0NCT0pK?=
 =?utf-8?B?eXFLTlMrdjdERE9Xa2RvcWc5U1lQaFRwUWF2aVNUUlowMTM3anNGMmJqL3cv?=
 =?utf-8?B?QjJ2bDRkSDRuRWF0SzB3NUdUMTdBRnVlcElRSTJyaDE1eXFWTWFoTjFRb1pP?=
 =?utf-8?B?QnZUMXFzOXBkdzF1ZW52QXJNeE8waWRtYXpSQ1ZXY1pmZFI3VUZsVGxNdlhi?=
 =?utf-8?B?dGxxRHFhSXpXeUkwWmtaVVUzTjBNbnRiNE1UN2Vtclk3THJUVU1NeE5zek1J?=
 =?utf-8?B?RVQwUUtxNzc1UTl5bkxhUGxKaTRRTWpYOFhOdnFFcFJOMEJOcVNqaCtvMUxD?=
 =?utf-8?B?LzZ4M1lIS2kzZ0JYOGVmYk0rUm9LcjljMTFFS0oxZWE2Qy91WkN2cFBZMmZT?=
 =?utf-8?B?QzZaQ2JpUlRlOVVnUU9sZmtOWGl4M0M3RlFyLzlpRjNNMnBLWFk3QUN1T29V?=
 =?utf-8?B?NVlmVjczY3ZxTmc3eVpaV1AyNTV1U3ZpWS85RVJjSmQ1akJWczc3RzZHaGl3?=
 =?utf-8?B?S2w0SWlaTnBROUtQTXVkMmZrLzU2K0h4S0pPRG9YaTM4ZTFHSFN2UWVwMDhW?=
 =?utf-8?B?blRZcDgveTVadkU3RUQyNE00bHJQUVhPVHZ3TFp5MXVrSHBSSDJtbm9wdG51?=
 =?utf-8?B?aVgxYVdIeTZMN3p2UW9LTkk2TjJpNld4QUZEZ1IwMWsyV0hFbk5ZVnRnY2pD?=
 =?utf-8?B?KzNSM0RJREZsaDdWTnNFb3ZyUVpoNHlwd1QyamdhMklWTHdoeWlXcjhZVU56?=
 =?utf-8?B?dUVlZVlob0ZWT01BYU1SeGRSOXp2SFNoQmJTVnJqS1BGQVFCaE9tL2Z6emJr?=
 =?utf-8?B?eExvQ1ZITU8xTEJ2M25JL0doQTZSdVA0QVRGWHk4U2JRZFNpR1Z3TXRZbmN2?=
 =?utf-8?B?OEtuLzZIWnJmMUNVVnkvNEsyeWMvaXV0T2F6OVJXSXVhaDBzR1BVOVhTRVd5?=
 =?utf-8?B?dDhjcjZsbDByQ1ZTUUx4bGxHRmd1V1M5REpVUzQyYUIwWU80bkFZeklUZDIx?=
 =?utf-8?B?eitYMTJJK250Ui9wT1hkcnJhNitXNFM3S3FLeEZCSG5hUkVMK2hVU2VFcDRi?=
 =?utf-8?B?YncwbitoZ05qZk9KblMwcGlZYjhwQVVzOGxvRGFDRGxjcDUvQVBWczI2NGVL?=
 =?utf-8?B?cGZZb084bmFnRmJCS2MrOG80cllNQngxOTZKLzRuWmpyL081YnBPMHdsNlhC?=
 =?utf-8?B?ZzlNSk5CU2VteDNZVGtDSldDMHhCQUFiWnRxRnhycFk3VGtlcnlRR3ZIQmJn?=
 =?utf-8?B?UlNzS3NpekxhMDRxVmRhUzhDeHZId0dZR01xRFhESzZ3Q2VZL0dveEYvTDNy?=
 =?utf-8?B?NnFOS3IvblhRUkthNjFLbDhWVjVuL0NxYktaa1UremhnWmdjWDRjajk3OWV1?=
 =?utf-8?Q?ebIcseTcvoa57VvN38JejwMWL1FffdhSkoXGYyE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f94c67-2d44-47ff-cacf-08d989a271ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 14:55:03.7787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiIm1KZpFwXvwaiwVlQBRYSdH3nhdX45Tw0jwbL+bRtK699QHprPSjX7wkDGLbDnG/EvOX0ur5LST6gj8RZChg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 24.08.2021 12:50, Anthony PERARD wrote:
> --- a/.gitignore
> +++ b/.gitignore
> @@ -332,7 +332,6 @@ xen/include/compat/*
>  xen/include/config/
>  xen/include/generated/
>  xen/include/public/public
> -xen/include/xen/*.new

While this indeed looks to only have been here for compile.h, I'm
not convinced it is a good idea to delete the entry here. Does it
cause any harm if left in place?

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -351,7 +351,7 @@ _debug:
>  	$(OBJDUMP) -D -S $(TARGET)-syms > $(TARGET).s
>  
>  .PHONY: _clean
> -_clean: delete-unfresh-files
> +_clean:
>  	$(MAKE) -C tools clean
>  	$(MAKE) $(clean) include
>  	$(MAKE) $(clean) common
> @@ -368,7 +368,7 @@ _clean: delete-unfresh-files
>  		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
>  	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
>  	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
> -	rm -f .banner
> +	rm -f .banner include/xen/compile.h

Isn't this redundant with ...

> @@ -425,10 +419,16 @@ include/xen/compile.h: include/xen/compile.h.in .banner
>  	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
>  	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
>  	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
> -	    < include/xen/compile.h.in > $@.new
> +	    < $< > $(dot-target).tmp; \
> +	sed -rf tools/process-banner.sed < .banner >> $(dot-target).tmp; \
> +	mv -f $(dot-target).tmp $@; \
> +    fi
> +endef
> +
> +include/xen/compile.h: include/xen/compile.h.in .banner FORCE
>  	@cat .banner
> -	@sed -rf tools/process-banner.sed < .banner >> $@.new
> -	@mv -f $@.new $@
> +	$(call if_changed,compile.h)
> +targets += include/xen/compile.h

... this? I would have hoped that $(targets) is included in the
generic cleaning logic ...

Jan


