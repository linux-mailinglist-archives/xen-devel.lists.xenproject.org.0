Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837C4EABC4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 12:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295788.503481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9Y9-0003so-5c; Tue, 29 Mar 2022 10:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295788.503481; Tue, 29 Mar 2022 10:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9Y9-0003pM-2W; Tue, 29 Mar 2022 10:58:09 +0000
Received: by outflank-mailman (input) for mailman id 295788;
 Tue, 29 Mar 2022 10:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZ9Y7-0003pF-GR
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 10:58:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cc65a60-af4f-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 12:58:06 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-OfmfOSCgNwCWX3Q9VVYYpw-1; Tue, 29 Mar 2022 12:58:02 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5090.eurprd04.prod.outlook.com (2603:10a6:208:bf::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 10:58:00 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 10:58:00 +0000
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
X-Inumbo-ID: 1cc65a60-af4f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648551486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkLfro1CJu6ToFG8jn144yBomXoh2rvoLRQZDuHg4eI=;
	b=OzPKnwcvAQwDiRfMfA7cZ5cPdn8Mu90TvWDI8Z/KFVcYOXGsarTHUTgQKdEdxCPuGEpFAJ
	YU+Mdr+O4l6szF/ypbWW2EASp7V+SSaWMyoVtS6BQApSfWfGz1HQKRENVeIC83PmShuyvy
	M5bzcWsZwRrsXDA4flKXCVwPn3V5aCo=
X-MC-Unique: OfmfOSCgNwCWX3Q9VVYYpw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MreXbRjbkYMDaUoh9nOie1DJxPxAfXWxOCzHjHbYxZclULi/+q5cK8tBKkW7UAuinCNQFmYI21q5CjR5ksPcoWXSlukyeWTxzLeVxQXpzyu//RBB5fWvChkTARnxsrnmQqnRIdLFsyg/ZXUB+ZIsbKfzzW4RKMH4qKmmxBgB7nqfg7ZlCVEsxNPKdZU8WgyHvdzHOdoAwPrV9jTnnw8g6OpwlEM7XlLTp5686w+Io+m1yNlzNxV5hsPEbLsaiPeXQHs8M0/jmELpIh0DaXAoz1CuWd7/9v8xSASjChL3EPlbSR9Tw2PKFzsIVmAHnNo8JBPamOEVbbu6kA15kt+66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkLfro1CJu6ToFG8jn144yBomXoh2rvoLRQZDuHg4eI=;
 b=YrCSQ0nZg6rBOtc/rHZsM4sDF4XekBRfekVXm9AAwbgTlVcWKTzkL3ETf/Pbo7q9ptDZF2x6HDONGMkZo5u8LRMXMMl4uJsSLyAQk/OujjsepA4l8PFCll5bEeFCH9UKvt27voSHNQiPitWpnrf5cigSYnkjcWnUZW+o70jNNmtMJ3E+NqTtnBy9PLC3c4Ccm6LNKXu9ocPqYWrXnfIpNtJn9/Q5Q4nx6jPb/L6euAcCJ7C5noDTWvFfC7fS2qs1sjuWtFOiIyVLLlAg+naruSsXVjO7YOwSBTr1pBLY2+SM0PXCK85PfAH4WdZWCSJg9qUjWfsNdR9LOBQbQzJ0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b31a208-f00b-efe1-c4b9-dbb322b91447@suse.com>
Date: Tue, 29 Mar 2022 12:57:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] build: generic top-level rule to build individual files
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <49190e22-c802-3830-9d4c-8e6100132687@suse.com>
 <YkLfPZCFIIqKypmI@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkLfPZCFIIqKypmI@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 669b65e1-828f-403b-f96f-08da1172fd1e
X-MS-TrafficTypeDiagnostic: AM0PR04MB5090:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5090B4F296B0A0BFB561C032B31E9@AM0PR04MB5090.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LJLyTlCnM30Jpd3ntAFeVzDpqg6Hn067ISU0pwvMOErWB80mIsMmyzCPrxR2Nd7roZy/ikx5VsmExuLLihVSA+a0Ljesf96YnaKHa3vleCmvzhmKhLwfutcZrUkjyWDiGtvzfxuI1UDH3Bq6Qx7QekddybHmrtyLF2WqMRtB/NH1bIuIXA1GgoI+tK8kV9vDASPYv8kVvjJkzXNYody17elhnz6R1L9I2kFl3PApL533oB6wkeLXRWd3yM/zvUtgxJo9oeCH+xs4DZvTPzO9xjtbDksTD9g3+1oc5Ktshq8PpOc4HGQ8Bs9sOQnzyWLNea1dc/V3PdDIFUcPc3kgSeX1oOqcIMxdxOlt0md2tCYqtTDfxH+a3kNI9fxJUxyW0uprlVcZVQ+BkrehSC51W7Exy5q6Oc56pk6E1LmaZfvDO6Xcus8tvnap32M4+F5V2h4YPUrG92owcGrJ4SJmQYNnEyAvQw+Ks7qwnT/rwGOKJ6+Hl4AIalDvOIz6dag6LN2tCFPUD7vHvESY512WRJPmWy+YxTvXFDh7WmUO7riQFnjOFVMIbFrwJgMv8vny+N7qBZPYNFgHott64ZIGWaOgNvdAYQzmOl7hlxKSI79AyvXzfVmzBhJIBcet3IfF5RjVPqWtWXldcCAdZLm8kuSd1+EDH1lRjvLYcxvDCcZHamM//uyH1IBeJ11nUjA+1yZzdD92/2QKpdFkeVrfUTqZtHpspIe91Hk91qaqI67oL6M0pHHMyPvR2dymn9WA0qyXvKPHmdxCXF2cJhlHzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(26005)(186003)(38100700002)(36756003)(83380400001)(53546011)(6506007)(8936002)(508600001)(86362001)(31686004)(6916009)(5660300002)(6486002)(2616005)(66946007)(66476007)(66556008)(54906003)(6512007)(8676002)(4326008)(316002)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlA0SklrUUJWcmNxUTVCVEd2YVdJcUxwSWhtdzZEdXo4NjRGOUQxcFFlWVMw?=
 =?utf-8?B?LzAzWXFFV2VmcUVhOXQ3VVN5aWZZMWV1c2piSlhoZFEwOWdWN2pqMW1kU24v?=
 =?utf-8?B?c3VKNW5nS2dOWWRrNlpnRnB5V2RXVVRDdE8wWXlWalovK0NjbXZ5OWNkNlBh?=
 =?utf-8?B?eXVDNDBqdGViZDMyRk5Ha3RxRW5OL3NTL1lSeTdRN1h3b3N4RHFGQVFTUmZ3?=
 =?utf-8?B?VFFVMkg2aU5JUFhRSmZVRDhPQUhiazVCQlREWXY0cDRnTFo0dm5rOGNqRUp6?=
 =?utf-8?B?ZFh4c01SZmQvTTBKVkNvdVRiRnZxZTdvK0VUY1dUOGNJZ0hibnZoMk83TVln?=
 =?utf-8?B?aWdyckNhQmFOZ2QyMThIcHZSWHQrdWF6M0ZiWmdSeWwvZnU1ZGxJQ2ljNlU0?=
 =?utf-8?B?ckFseVlxRGkxMHhYTVFxSExpeVJYTnFabjM1amdCVHVubko0Qng4Q2h3TEdQ?=
 =?utf-8?B?Um5hdmhMU1ZCS2ljekU4cWJNSVFlVkJCSkRIMTk2ZmVSNklGaDcxY3l2c1By?=
 =?utf-8?B?Q0V2UWtvSjI5VklpS2RVdTZQNW1ZTzlHTFhibk1QcEVEYzFuN3dXcXM3eDZQ?=
 =?utf-8?B?L2ZSODB6SVBERnM2UnY1SDFaRmVyeEJ1M254RVlOUUZXMVpmVm5UNVpvTnlW?=
 =?utf-8?B?TG9ON2FFbm56WHhpSWswTUNabFNRVlh1TkhMaEhsbENnWmlwZE9lREI0WDkz?=
 =?utf-8?B?LzlXSVlHdCs1eTRIVGpKUWljcFgvam5oNVFJdHlJOXpnbTMxcWNUbFh0OXVa?=
 =?utf-8?B?Z0ZpUHdjWldVTG9HUGRqVG94ZUVqbWxiM3NVb0Y4NlFJWUw0cFVQV0szeGM2?=
 =?utf-8?B?SzllTmxxWG9PeUo2NERrTTJ0QWFqMWl0VGZMRTlGcHd6Z3VySHNiYW05dHJL?=
 =?utf-8?B?Q2FvU3lzMkZaQm00NHpjZ2dPMU9LT3dqZFNBaWtCTGRnQnVZSFRUTG9mTnRz?=
 =?utf-8?B?c05SUWVDYmY4elNGQnVLaVhDUSsyOUh1VHhldC9iRSs1MkczSlVFNDhsZDhL?=
 =?utf-8?B?c1o1aVJWRW42c2RtUVJHSHl1ZFYveEZDNjgxQ2pLVzBnSG1FaS90WmZUYjc0?=
 =?utf-8?B?TThsMnkxWXpHbENwc1lMdUpDcEt0VmhDRkJLeGYzZXNhcTRYdzJqVzNEeGFz?=
 =?utf-8?B?WmpJazJyUENWOXh4dDg5YUVVcW5xMkRleHNhUGFWbVVZNFV3eG95NzBiUm9R?=
 =?utf-8?B?ZzhDMXhGMWRkQTc1VGlpTkxtaTF6NGc0ZE1sM1hMTmZJWnlwaDRST2JBYkx0?=
 =?utf-8?B?eVRnNjV5TTdpbWx4eVUzY3ZpUG9ZWGdGVThkM0NYU3FXRlJoZ3pRMmdaTi9H?=
 =?utf-8?B?VVk2Y29IUE1wdDRWV2pPV2NuVVVMbklwb0x0VlF3MlNuNytMb0ZIM21nQk9F?=
 =?utf-8?B?M3JkYWFZRTBGalpablV2ZUROWGdTa1hTMTllWENBVUVJdlcwOUQvbU1wb2NN?=
 =?utf-8?B?VWJFMXRzNGEvT3AxeWhaL2U1WE9WUHg5SUppSmVKakhISjNUTHh6eWhLN2d6?=
 =?utf-8?B?Ulh5UUVXUHArcGNnTFNKdVhPbzA3MlRQWHkrQmhMREt2aUd0Qm5CY1NSVDd3?=
 =?utf-8?B?YURsZFR3YnIvd1VEN3lOSzdkclRWYStlV1J6N3crQ1dtVnBoYU9qRVk2alow?=
 =?utf-8?B?RUgvenh2OUhJM2FZR3QvVXVYWXlpUnJrNlVqc1M1a1lqNjZCSlVOQVdzN0xh?=
 =?utf-8?B?cEpxS1NPakF3enFKUVc4b1VYUnRLd3QwNTlEY244emttS3VZZUtnYU1CN1Ey?=
 =?utf-8?B?Rk9SWVE4N2ZiVU0wWEkrSGhkRmFUTXBReEdMbjUvZjdGeXFqWTQ5cjQ1UndC?=
 =?utf-8?B?bjY1alQvS000Nit5Y1RPZ2ZCK0QyN2MxdmVPc2ZvWWhpcEJmemQvbWtaTk9X?=
 =?utf-8?B?bWw2RjNwNmhJaWQ4Q09HSElkUFJLd1VLR2tvVHhnU01NNm8vWWVmNVhidHhT?=
 =?utf-8?B?Q1lGek1GeVRtRVZxdXI4SkVETE9GMVJqUHQ5VzBOMm9RQWM4alYwbGdoQ1Qv?=
 =?utf-8?B?eDREVTl1UVdlQWw5ejB5QXpsaTRMcm14Q1N4K1BiekM4eUoyVmRPaFR1VTVm?=
 =?utf-8?B?dVhxd1dFekpVTU5KSmZQdXY2SE9ITXJZYWp5Q0syTGtyMi9lbmpKQkxSRXpu?=
 =?utf-8?B?STYvWXF4Z253dmZFc0JVcktpNytHa0l4WmxhRTNGN0J1NTQwbm1Fa29VUTVz?=
 =?utf-8?B?ZU9jSHlpZUw3enhIN3RYRm9hWUJ4dUMwQnIrRmcrNWxyVkJMNEdxQVVJTVRt?=
 =?utf-8?B?V3dUU1kxSFkyQUFjQ2Z2NGZUU016am40Qmd3bDg2RHE0OVAzRmNOd0w1aldY?=
 =?utf-8?B?NHFuUWVPRGNvSHdpK0FXRmlSK2txbXlyWjRBaG1tMisyVkhCYzNYZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669b65e1-828f-403b-f96f-08da1172fd1e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 10:58:00.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /V4G8aMi69xiEWATPOLb0Soh2D/7px8jP+6y/Hl2FnX5QTFZsNNkzHW8dJrrVAU3TTKZutxC06+Lq7yPtsqB1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5090

On 29.03.2022 12:28, Anthony PERARD wrote:
> On Mon, Mar 28, 2022 at 09:41:26AM +0200, Jan Beulich wrote:
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -75,6 +75,13 @@ ifeq (x86_64,$(XEN_TARGET_ARCH))
>>  	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub-if-enabled
>>  endif
>>  
>> +define do-subtree
>> +$(1)/%: FORCE
>> +	$$(MAKE) -C $(1) $$*
>> +endef
>> +
>> +$(foreach m,$(wildcard */Makefile),$(eval $(call do-subtree,$(patsubst %/Makefile,%,$(m)))))
> 
> Any reason to not use $(SUBSYSTEMS) instead of $(wildcard ) ? Or maybe
> you would rather been able to run `make xen/foo/bar.o` even after
> running `./configure --disable-xen`.

This particular case I don't care about as much, but I think it is
helpful if any subtree which has a Makefile can be recursed into
this way. That way if someone hooks other trees (xtf, mini-os) into
the tree, they're as accessible. As would be subtrees which aren't
subsystems by which still have a Makefile (such may or may not
appear).

>> @@ -334,3 +341,6 @@ uninstall: uninstall-tools-public-header
>>  .PHONY: xenversion
>>  xenversion:
>>  	@$(MAKE) --no-print-directory -C xen xenversion
>> +
>> +PHONY += FORCE
> 
> That's a Kbuild construct which will not work here. You need to write
> ".PHONY: FORCE" instead.
> 
> In Kbuild, there's a ".PHONY: $(PHONY)", and various macros needs to
> know what's .PHONY.

Oh, right - thanks for pointing out. I should have really noticed by
looking at context in the file ...

> With at least the .PHONY business taking care of: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

Jan


