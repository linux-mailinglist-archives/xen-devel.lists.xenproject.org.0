Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE11539201
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 15:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339636.564513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2GQ-0004yx-6r; Tue, 31 May 2022 13:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339636.564513; Tue, 31 May 2022 13:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2GQ-0004x2-3j; Tue, 31 May 2022 13:50:26 +0000
Received: by outflank-mailman (input) for mailman id 339636;
 Tue, 31 May 2022 13:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw2GO-0004ww-3v
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 13:50:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dfddd6c-e0e8-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 15:50:23 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-wxh45arZPUyKyAlUFHlg1g-1; Tue, 31 May 2022 15:50:20 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB3215.eurprd04.prod.outlook.com (2603:10a6:802:7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 13:50:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 13:50:18 +0000
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
X-Inumbo-ID: 9dfddd6c-e0e8-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654005022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhBfe7fJ/6IkP0ufiPQN+ugxwDMuXeorZ0TLifc3u5k=;
	b=Qrl67Fqqr8MWwgx1kRcMBHrKvUb4ew22U/s9JRwyxoNPBaAKhS1sJ1yfZ5UDixoRQGfC2R
	uQgdlko9ZYvP2mTBa1FH6Z/6k3XnCXIvUKyBRUtVbVkmkSqMyLkUX82ded4r4ugRCMNYU4
	0Wnf/DH0wkezMSKVSjaSgP6EA1tU1qs=
X-MC-Unique: wxh45arZPUyKyAlUFHlg1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwSqmmgRueSIJJLlLrldooPHYmpjCP1Zs1itOmBNnVZpRZIQOMKxDszLk99XI8WlLyb58t9jnOrUEH8hTultinc4UWNPqZT+2m7tRFknRez70gLL30DPzXK/qFrvK+iNEqwpz0PBEHgfA6A6gG5afekDlcnRPjMXFWIUK52mjVdvKEfQ3pYdunkaJ4oQM/Hb0tIR/U0WrymAcEHbqjIYGkRrv7wF8eYmjNgHPXDsYE6ES8tRtoVJ4rk3yrqZVZerM1qk4J8G3DFD4sFlv1gIValoykxad7buLqxI2t3r6Cy1M3g8jnTEMhbLb4mqD+CZMrUMOYMZMDMhMm2yY/RMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhBfe7fJ/6IkP0ufiPQN+ugxwDMuXeorZ0TLifc3u5k=;
 b=m7Jek54VdzUso/gEX6nUhFJdJHFAQctHx2h4iB8oAinsGVdZCS1i6jMaVAs2uA+Iy24TpD8TO9R5sKYgH4Eg0wRGOSl5PKLXErqrT/UImL0wXTylkFE01n25gE4sK0n471Zt7R1W23HyDW+ktOhwIY/UDMmGgDoJ+I749BvIPPiktkhoA6Asx7xEEw3S436NelaihyacyAAD95lkMxUCExmneCRBZycvBgf9yoQm1NMg31MVfPchMzPWB7TzjQB3MEsCSje89bFqf352o3HPZ0+Ck1o2Mo+qeNuR0fSPGBa7teltQlC0WSw9hdjyScATNi00O9JTv7UGJxLq0Eu+Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6e11bdb-976f-fdf4-6e07-a130980af90f@suse.com>
Date: Tue, 31 May 2022 15:50:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen: Add MISRA support to cppcheck make rule
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <5467d017fa1c6721436e21f8cc10c5d74adeb5bf.1654002661.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5467d017fa1c6721436e21f8cc10c5d74adeb5bf.1654002661.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0386.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b7e43d1-c030-44fc-3e60-08da430c7f52
X-MS-TrafficTypeDiagnostic: VI1PR04MB3215:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32152EF9FB3B7E4C0207AEC9B3DC9@VI1PR04MB3215.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ATkGImlGACN8OW97LNeuf3TDsP7Y8CfA7517v1W7l5RcmmE0xEu9WUIBO+kBYSuOlBcD+hduZA/DZAomEDkwqD2FvJJFdaUb6hyu8vH/V83t8LcdXfpMW9DftcqLpYtn1OaP9/bgF3xn3vlRkWv87dHUB7tr1Ay35PzMEe8Ki1GwG3IdPE9K0T6iajC8t1NBZOBr+UW9n0CEokAj60fjX1YjODYwIMac5+6PrOlh2BxdrfdfMng4Cx2kMw9XPw+RRuOdbSXzjXel6pmC88Gs4tAx0sJ8AVUarDPwbhiqvFCiB+IFlwaynRY7O3MHb3h5Fmx1Yep6GAR7Q7PR1OPvyuxorqffLn5GpBPTmk+8zbYfcMdZzBdzIlg1SdCL3E235TzQ9f6XaTyqIP0il6Me0M/zd+6hB27xBbHEPZXbgJBh8omgcqyendKs3EyMbKl0Jmgq5P1eGVgTMrW/+94cRtkTysKOymf9bgoAL5/LaaE3/IPD3lZXNPW5lsVMNjt8FmxX6/vlfk1Zc+CXxWqlfjeEeIJhXbzMLWoOAMAQHb5GIWPGwf0CuqT5x9cTJ4SK2FhkxouxpeN82SZDkQkx2O4x5jONwhFcn3GOFOhY0M2fMnpncCR+0qYVXjGvbmbitqMW7ELN8PHOayS0V64oOdxrV5AFUofqhDwbu8RmqME+ImN1n4IEwO9IWa4pwpEZUtD8/7oi8jnbTctNbK+fpmOnchg7LvdEGBGvftF0SIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(2906002)(6512007)(26005)(83380400001)(186003)(2616005)(38100700002)(8676002)(4326008)(5660300002)(8936002)(508600001)(86362001)(66946007)(6916009)(54906003)(66556008)(66476007)(6486002)(31686004)(31696002)(36756003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0ZWOUs1VDduT1NDVU5TSW9RK2lVUUxaWHZFbEZMMjJaSFVXK1dxdk00WTI2?=
 =?utf-8?B?ekFoU24rU2hTcHVzVXVOZXhaSkdBRFlxTUh1b2ZUSVpvcWZEVlNkd0VsMjhu?=
 =?utf-8?B?ajltWTZHUlRJeGFxUlkyem5kRGcrZ2szcnBSY3VSdkU3QWptTGdtRmZPTHdn?=
 =?utf-8?B?eWlkbkZQYUYrVzFuUC9jblNGRCs4dE9JQzB0WVVEampVUmFFZGlFVU4xdVd1?=
 =?utf-8?B?dGtWRWZOcEFjTkpZUnp5UWlYOGxCU2VQb3VmYXJPVWxzdk5HVE5Ic1EzWmR5?=
 =?utf-8?B?czJCd1RtTDBTVVAwN0hZRC84eEpVMUdNeDhPZDdNL3FCaUdrK0lVTXAvMlZI?=
 =?utf-8?B?aTNkd0tEWWJhNHdBRDQ2b3hOUk1reXZ4dHJlSmVNaVNuQkh2ais0bitGdGh5?=
 =?utf-8?B?UjJUd0FVOGRUb3pKS2tXcGpKdUpzMkI3aUJILy90ZGE2a1BDSE02QUY5M3oz?=
 =?utf-8?B?L3Y4NTQwWDNBeVpUU2dhU2U5dGduOE54eTRPNjgxTXdjbGw0dUtNU0VFY1k1?=
 =?utf-8?B?R1gwNDFjUWtQOUl2QTBtRlVicWNmaGFtQlBKSy93d1RoeDNQR01RV1BIR3ZF?=
 =?utf-8?B?emxUTngxYzlZWTlFV1pqNVBRYTl6OEs4NzIxcFEyVm1BeHJGazFIaDZTMXhr?=
 =?utf-8?B?VGJYb0RqUzRtbjA3UzN5WHIrM1ZkeUd5aTNUMEpDTDlIRGVETzJZMzZ1N2JK?=
 =?utf-8?B?OURJeStSL0FvSlBJZGJVdVFFdEtobXdOamxaaUt3Q1pUb1dlTXZzaWtPMjJz?=
 =?utf-8?B?RkF5dXhZVjl4NUVXSWp6U1BLOVhRYUwzOTBuKzBCNWZqMHM1cWJmQmRTYXo3?=
 =?utf-8?B?aUw5RjVoYlgzdUJJRHMxM2I4ZC82cjk1aGtCTU10bXJSQWt3cWJsTVd6ZmNJ?=
 =?utf-8?B?WWFZbDJFOVUyS2pHSjhYUHRwWS8zQU5uWHZaWHl0RG53MUZ2Mkp4MnJPUFlo?=
 =?utf-8?B?Z3FCWjZZSkNyWmhwdzFrL1Y1QW42Nzg3MFJOV2xOSzQ4YXU3QWZrbXlwL2hO?=
 =?utf-8?B?Q2wzbWllakFteS9SeHlpTExHQVFrbmpkeUgreUpOZEY4YkxiV2syc2l1bEJl?=
 =?utf-8?B?VGtjN2pSd3RPcjVjaGZrTlhET1cvazJpQ2Fva0tPcVpJaDRGc0Y2TmFDZG5T?=
 =?utf-8?B?bDBLUzl6MGpSRWhieWtTcFpvb0tmeXMrTzFmZ3Vmenl5UXNrd01mNS91UUVJ?=
 =?utf-8?B?S25RNTZGc3RwTDV0YlMvSHVZSzh4UWlGeEJGNmZuQmhOQ2RuK2gySjJubzVB?=
 =?utf-8?B?OStNZFB3Y0syT3lWc0UvS1QxWm15M3BwSklLZTEzOWg4Y0tjeitlYytKWWhN?=
 =?utf-8?B?REtiUEJQU28vMDBBUDV0V2hPaXg2TDRKMzNLSzkrTTB2d3YzM3BoUVdyanQ5?=
 =?utf-8?B?RHZNSEFmamtzQmljMkpFbm96UlUrMWszL3VDK0s4S09vblVtOVFMTVhhWWtx?=
 =?utf-8?B?cVlqTm9nN2RMWmhwK3laUzVKcjE3eFVKL3M3UEJNR0I4K25HR05GL25QdU5Y?=
 =?utf-8?B?eDJZTHBKanlrVUw4MzNXUE9lZ3BKQWJ5TmJlaTZubkpNRWpvbDc4OHNuc0NZ?=
 =?utf-8?B?VVpaZ240NkRyS1hPOHpicjdlSS83MzUyOVd2Zjk2dEJDbjFpS3hoWnFRaXV1?=
 =?utf-8?B?Nmt3WHk1MHYzeWRzSXJjckN3b2xFWnZnZFRJZFNPQlRNN3N2WFluV3BWdUQw?=
 =?utf-8?B?d2hQaTNNSlZyMGdNYWpXUGE4TCtDVmZobk1ub1piR2pQV1dHRFJqQWRVSHdy?=
 =?utf-8?B?OG03ZjM0bW9sMm4vZmtyUmNVVnhpRnc5VVA2d2ZLUjBNN0cvQ0ptTzdQSXUw?=
 =?utf-8?B?cEI2M0ZpcnZBNDRMS0Jhb2hpQ09USVVjZGNseVNaVTUrQjkrWDdEblFpdUhY?=
 =?utf-8?B?SUtVUzRMUGxyWi9uUmp4bkQrUkdiWUpjaG5mVFJFMGZqVDd5UHp4RU1sbk01?=
 =?utf-8?B?M3dESHU0dlVFZ0JFcVNGaUE1S2R6Mnd1eVcyT3BSNUlpbDBvNlgydVJiZFhn?=
 =?utf-8?B?K0xLNEdWVXdOaGxkSGhveE4xNGVPdEtBeFF3SnYwR3k3NGJJSVVuMmlVd1l4?=
 =?utf-8?B?VVIyVHBqdzFXbEZUK1lxcFdjWGhiRDRGYWlnQm1GcnhSUzNMSzYzWjdNcTlR?=
 =?utf-8?B?ZW1MSWlYbzErdlZDY0poNW5PaWp6SWhjMFBpRllNS3Azb0tWbDk1MFcwTnpn?=
 =?utf-8?B?VmFzaUV1QW5pRHFwLzQycWxYSGhQUGRkVmZwTmxrWVBVdkZyK3JpeDVWbGdS?=
 =?utf-8?B?RG5xc2YxQm84akxXSmZ0OWVETWNPVVlJRzBiS2xnZ2FJTFJ1VWhWQncwTmNp?=
 =?utf-8?B?dGhlRmQ2dm02U1dRYWRPckQ3bmpHVncxakNDN0NkV09vK3RjeUtQdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7e43d1-c030-44fc-3e60-08da430c7f52
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 13:50:18.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWZxWI5bdY9Ikb4BGtr2D4L0+jCVL5aZHl68bzPsIncHKm6VrelfrHm0b2C/Eo/bDqLYH45bz16HsWkHb1nvhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3215

On 31.05.2022 15:30, Bertrand Marquis wrote:
> --- a/.gitignore
> +++ b/.gitignore
> @@ -297,6 +297,8 @@ xen/.banner
>  xen/.config
>  xen/.config.old
>  xen/.xen.elf32
> +xen/cppcheck-misra.txt
> +xen/cppcheck-misra.json
>  xen/xen-cppcheck.xml
>  xen/System.map
>  xen/arch/x86/boot/mkelf32

Please can you obey to sorting here, inserting next to
xen/cppcheck-htmlreport? Seeing that xen/xen-cppcheck.xml was added
here by you at the same time as xen/cppcheck-htmlreport, may I further
ask that you move that line to where it belongs as well?

Additionally I wonder if you couldn't use just one line, specifying
xen/cppcheck-misra.* ; this could then also hold for the _clean rule
addition further down in the patch.

> @@ -703,6 +716,21 @@ cppcheck-version:
>  		exit 1; \
>  	fi
>  
> +# List of Misra rules to respect is written inside a doc.
> +# In order to have some helpful text in the cppcheck output, generate a text
> +# file containing the rules identifier, classification and text from the Xen
> +# documentation file. Also generate a json file with the right arguments for
> +# cppcheck in json format including the list of rules to ignore

Nit: Missing full stop at the end.

> +# Replace current by goal in the dependency to generate an analysis for all
> +# rules we would like to respect.
> +cppcheck-misra.json cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst
> +	$(Q)$(srctree)/tools/convert_misra_doc.py -i $< -o cppcheck-misra.txt \
> +		-j cppcheck-misra.json
> +
> +# Prevent parallel make issues as script is generating both files
> +cppcheck-misra.json: cppcheck-misra.txt

With this dependency the earlier rule should not list multiple targets
(and it generally should not, for not being a pattern rule). If I'm not
mistaken the way you have it the Python script would be invoked twice,
and all you prevent is that it is invoked twice in parallel. And then
please use $@ inside the rule. Additionally, with the script being an
in-tree one, the rule should also have a dependency on that script
(such that the targets would be rebuilt if the script alone changes).

Jan


