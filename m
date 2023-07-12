Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED240750AEA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 16:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562569.879309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJanz-0007cG-B9; Wed, 12 Jul 2023 14:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562569.879309; Wed, 12 Jul 2023 14:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJanz-0007Zo-7Y; Wed, 12 Jul 2023 14:26:59 +0000
Received: by outflank-mailman (input) for mailman id 562569;
 Wed, 12 Jul 2023 14:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJanx-0007Zg-QL
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 14:26:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2774dc34-20c0-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 16:26:56 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PR3PR04MB7212.eurprd04.prod.outlook.com (2603:10a6:102:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 14:26:55 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 14:26:55 +0000
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
X-Inumbo-ID: 2774dc34-20c0-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAGWCsZALSHL0R9kmsY4T7duC/8KjX5PqfarCf4CZxe09EnqBtYt9wpCdpilpjkSyDwDFf01O63aQaf69MJ6oqUK29xJP04xLsHMc9hDxnjhV/G6x47YZL4ocjxih+R5J0w4FwgRJZnsVFg0C3WtdWROLkCylqnVo4YxWkAWgd1vOt1cod45Uzk+a7mhePMTlNQ2lCd8BuP+iDRIHwB3HF7TwS6lMwpA/GzG9qffuqXYFOrMjEtWKvDDHnbgdCljdDl8OFjaUBQeGH8i8qpjqIFl1tjxQKatCpPu0jojFMU5C1VF+oVjvbr/B3dkKyuLOYmtCdxxgh7VbIyTdUPiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBlY3/LJPEqXfh4o+2erDcxetpKZgO/+Av51FujHwls=;
 b=EJN6Pf3nM2Z7Jp58t653I1u31TDpa/EmRlf2y/ZmpU+3gqq0uPDtWpQ0nxAuV1xtIZ/UekeRPamd/u0dg2FRzbPDqfIfFpX6e4ocq23C7mGfEVy5KKiNYvTTy36VSn1frrnCbTv/hIiKpzTPFHNLUgXKJkoJtXEKtsMQR2zqUZ68WW9H1ixrD0IEUluPF/1neFUq3h4q++/+0nZ6lP0kltEE2RLmeVFLKlO8hPJMnKLrcaj/5jSFWE5K+axQaOg4u6IAQvlulMvu5WZa11PBlkhHdsgJY0K5iIHmsQlIVsM/30GciZ5IvZ7euREAj/gmpllWqvzTAKRDNgzODYMuDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBlY3/LJPEqXfh4o+2erDcxetpKZgO/+Av51FujHwls=;
 b=YaLqrTf7xqlesO6R7TxwFE1F+DqAJysSJi+PphU4wfLxGND1hDJ4uwqC33UYmaec6zSowVL71fhSi2QLbQZuNbBiGg1nNyLyZQ4ZYKuvHWI/mOZmt7vrdJkRYIqPMiQpqPwXe6dWRyMDu50VGytipx5+iwfTxMAAxBu4tJ2n+/G62gHlRapO0To2u+CTgjUdKR+XlJh5I8Lbu1wtprBeKca3/lke8ohI/fbH/TYXTLiDpY5GMTFS9Vo/BxyOlFvdc4QNKsLagT1vFB3/Lly/0bkHhqWoz+s35m2d63hmCPbU2c0iqWVYYLqdDykyDYK0ACgPmRG9gDdSQB4YCWoCAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe4c01c0-91cd-a303-71e9-96a81e46ddff@suse.com>
Date: Wed, 12 Jul 2023 16:26:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0.5/3] build: make cc-option properly deal with unrecognized
 sub-options
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
Content-Language: en-US
In-Reply-To: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PR3PR04MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c87006d-39f6-4c8e-1dc0-08db82e40af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yzFqRqXIyoUhrxoNa5mmpDj74gdxuyTPl4aetgX+h0LsjpFfmZHPeeWDrcz/30WMk3Cy41z79eIawscn55CEjp4TM+Z276Fv3L+b6Q/mQ++P5ZKl6tY88avFGxpCDBHXtk+cZtumXTIQZpIvr7OuFp8cne+0g45cDbRfTy/GeCK0Q+9yQLbMv5jA5XEXkxBcr8W+gwb6TOgUBFATVNI8tTdILvZ/OWw003m4IdaY0aGNKmmWdXBTKNXPrP3vP0B6ksyn7NaWO1jX7RfNjWQnqehXGNcBBNRrcT+RFoNjLUBXsFkMnG4WxsXoJPhaF4jOcxkA1SccTCuSC6qq5N5++DIudyQZKiZZP7TqE7IA5c6D6ZGrdKecntuMFI7krS4KKwvPjZkmEM5ArNm4bc2qr4VTVDH2Rhp9gIAq1FjFuGuGlCz9FBcPas9VbeA6lUnA/kF4wq4kW9kRXWgsEf7yKclZbltJRsg44sjI1rjRZBgB9VRe3CY3Rnt/Ywv1P3jGJNo9C9ctzYcdfhm0i+kITugJl5RtGNDSscQy5518HaEA8oAuL2v/nrRMkku0eyeuQqwDBwsys8fJYEYYU6h+uQmozPjndQm9IimiJIxOWO6MNrRfDyq4iatd/rQNOHTmO4l8FqNi+wiH+cv6MgtnuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(8936002)(8676002)(38100700002)(2616005)(41300700001)(2906002)(316002)(5660300002)(31686004)(6916009)(66476007)(4326008)(66946007)(66556008)(6486002)(6512007)(83380400001)(478600001)(36756003)(54906003)(86362001)(6506007)(31696002)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVI4SnZIUmNlTVh2TkIyOXZzTHFCQ0l2Q2tneXorRDhWczBlTVRtY05CdGVP?=
 =?utf-8?B?L08reEdLTzB3WjZaYU9vK0R2UVNYbVVzeHk4bStoL3JOYVFaZ0JoemxFYWVh?=
 =?utf-8?B?NjlWTzk4MEd4SWdzbDg1Q05VZ3ZqNjk3K1g5cWpKVzZHS3VuK1h5aDIzdGZa?=
 =?utf-8?B?d2JWY2dsYkRuQVJOaG54VE1JM3hCejA1SWxzODczY0tickV3RXV1bHl6U2Fa?=
 =?utf-8?B?R3hFTkxnUWhRQXJJeDJKcDBkRHd5bmFwNjJJL3FNM2djRy9tRkRnMCtHd3Jn?=
 =?utf-8?B?THhueGg5VGJaMWJjS3Y1dVFENnQ0eFpvbmRhVEVrSnIrTm0zajN5c0d0T3pN?=
 =?utf-8?B?c2RrOTJRNW53TmN2WHZ5MDdTN2cvTDljZkFGZ04zWUVXbmlYR2sxdEt4SU00?=
 =?utf-8?B?WWVVWUFWSEVFRnIzQ2NLdjA3NXB6bzRza1M4NVhkSW1FRzgwaktCdTNHRW81?=
 =?utf-8?B?cjlMa2hJSlhJakROOEhLTXpjVHBSR2RKTXI5a0pGdFpXL1liL3hxU2gyZFlQ?=
 =?utf-8?B?UjNDZVpZTElzaTlrMithdkpCWkJlUDdGek05dUxxRlZ6RDZxaXFSVGdxcDJa?=
 =?utf-8?B?WEYrTTBkNXJqODc0bHd1TGptS09sVnFnRGljaWRGKzdqa1REMnk4WnM1elo0?=
 =?utf-8?B?VHdWWUo1K08wazZwMkJqSXZ4MVJ3VXcxTmRmbWo0cmFmWWdac09kOVlkN1c3?=
 =?utf-8?B?S041VC9wYXdjeUR2cTAzOVk3QmhpbmlDcy9SVUEvd1ZFcTFkUHR2KzQrUHhV?=
 =?utf-8?B?eUZNNnF4a3JLOGt1cFY4K216WUd5WXRYeUUzVGMwK1ZPVExSNlVjNGRoLzF2?=
 =?utf-8?B?cnc4bS92QkFXMzJORndiNjNhMWozRU94bDhXSWZwV0pvbEYxNHpENDZoWnVN?=
 =?utf-8?B?TG92cGpJTTRXdHpGNGJGVnBDV3ZWbDR5SUtZYVhuamRjUE53RldleFdDVjZp?=
 =?utf-8?B?V2tISGR6REowamJaUW9EV1JQOG9hYzhlQzFIb3VJWEZMcjdkb0owUkE1V1kw?=
 =?utf-8?B?cGJZeitjWFhOQmt5NXVWRGRIeVduMVJ4NVNZRXVPR2k1alFhNDhYcDFBdXR6?=
 =?utf-8?B?Uk1QUXV2SFNBbVlrRkw3Q0dmV0poMm9mV2pzRW9DSmtqQ1hCZUxXOUVTYnhn?=
 =?utf-8?B?VmdMaWpkNGNPd2NOeTJNZDV2TERhdVlaK2xGR2VpVFZCWFE2MGtDclcvRmV1?=
 =?utf-8?B?WGRYVE01b05DY2xHVUlkUjU2RDN1M0s1YkJpTjNGK2hBellEOTVUc2ROekFS?=
 =?utf-8?B?UmRRSk1HaEt1b204b2kzdkVXWHUrYVVTSzNOVkcyblhGN0hYQUxPMzN1QWll?=
 =?utf-8?B?NlR5TG9GcVlnaUJPNGo4WEUzeVpxV1d0YWJVY1QvaitwRTNVb0JpOWNaeE5Y?=
 =?utf-8?B?ZnRmL2JIZllKcjNCb2xTaVpLekRkYUhHQ3psbzJaK2RSd3l4SkxLbFpDL0lt?=
 =?utf-8?B?MDh6U2Y1bVdMaTJnL0dCa09ldVRZT1BnOC92akp4enQ5a25Ma3dBZk00aXpT?=
 =?utf-8?B?OWt3bks1Ymhpcyt5RGtkUk84UTd1Y1Y3MXpaaVVBVDRrZlhyNE82Sng3WUU5?=
 =?utf-8?B?WXF0eml0RHlsbXg2eGpJcU1XWmd3cDliR3psNFpCakpVZWZpUjBWd0w0SjdM?=
 =?utf-8?B?Q3VUSWVTeTAvYnlVa1ZsRUtwL1VhZmdDM0dOWERnamI5MWlxSEtTcW1UNllw?=
 =?utf-8?B?YlgvdkIvbjMzRERmd0lEd0RUd1AyT0Uvckg0aVkwRnZQVWg0K0FWcGpYTi80?=
 =?utf-8?B?cmZUcFNyTW1nQjdOTGwwNTBOOHRBNVZjRElRRm5VcWdMVlhXSlNBbnlnTW9J?=
 =?utf-8?B?ZE9FMkhxZjVBbmFCZTRsUUQ2enJON3piaWE3T0RGanBDVUV3V3c3Q2JIMVM5?=
 =?utf-8?B?YmtZS1FGVjZhUzk4UFlMWTgyem5XbndBaUlSSlVxUld4cFh5S1hJNUVrbk9E?=
 =?utf-8?B?WU9WODlvTXR3SWIyNTlvUjF4U2tMVTUwbE16WVdkZGtCVWRhWG43dHZ0Z3Bk?=
 =?utf-8?B?N0dGUzJKdmk2dE5YQUtRVTF0WHMzaS9OcGJ1RUdyMGpaNXI4aXRaeWlmU2FK?=
 =?utf-8?B?bnZkdVJwM3hhNU9tbStvYUIvRFc5V1h5SjNDRElGYTQxZjNxRjdyVmJsellO?=
 =?utf-8?Q?OcJodGIfY+A7ztptdJJpS//EH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c87006d-39f6-4c8e-1dc0-08db82e40af5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 14:26:55.1979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ak6aHg0iLDbe6teZ+oWzDrpdESR5X+qjkGNeWTZ1C3fDpxn4lLQhLxam3waPhAKY3j2mL9bZ4AwBvO3lTnTVaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7212

In options like -march=, it may be only the sub-option which is
unrecognized by the compiler. In such an event the error message often
splits option and argument, typically saying something like "bad value
'<argument>' for '<option>'. Extend the grep invocation to check for
any of the three resulting variants.

To keep things halfway readable, re-wrap and re-indent the entire
construct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm sorry, re-sending with wider Cc list (as was intended originally).

--- a/Config.mk
+++ b/Config.mk
@@ -90,9 +90,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
 # of which would indicate an "unrecognized command-line option" warning/error.
 #
 # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
-cc-option = $(shell if test -z "`echo 'void*p=1;' | \
-              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
-              then echo "$(2)"; else echo "$(3)"; fi ;)
+cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
+                    opt="$${pat%%=*}" arg="$${pat\#*=}"; \
+                    if test -z "`echo 'void*p=1;' | \
+                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
+                                 grep -e "$$pat" -e "$$arg.*$$opt" -e "$$opt.*$$arg" -`"; \
+                    then echo "$(2)"; \
+                    else echo "$(3)"; \
+                    fi;)
 
 # cc-option-add: Add an option to compilation flags, but only if supported.
 # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)


