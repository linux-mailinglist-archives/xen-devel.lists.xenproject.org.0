Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB0592AEC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 10:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387139.623258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVGQ-0003Yc-7Y; Mon, 15 Aug 2022 08:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387139.623258; Mon, 15 Aug 2022 08:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVGQ-0003Wo-4X; Mon, 15 Aug 2022 08:15:58 +0000
Received: by outflank-mailman (input) for mailman id 387139;
 Mon, 15 Aug 2022 08:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z+x6=YT=citrix.com=prvs=219f4dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oNVGO-0003Wg-L0
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 08:15:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a78a756-1c72-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 10:15:54 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Aug 2022 04:15:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6477.namprd03.prod.outlook.com (2603:10b6:510:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 08:15:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 08:15:12 +0000
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
X-Inumbo-ID: 7a78a756-1c72-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660551354;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=E5wVteDfW/dWh22+9mUFG7jkgM81Fx1dz52uxY86x7U=;
  b=W+PhAK3vmIQ7tQAx7+RCXyGAlrHOmKrr7vqg4E/gHduWhZ/iQtQ8tQsq
   PhOI5x7AE4mGSDfAUWyEpNll0vhW0BigW6bOdktpOEJqQobENMMTTIorC
   ROaCJryNAVWjqdX/VfUdLe6XcIovmLd/pqHQZ6X7/g80BFLTDKmH4FfaI
   g=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 77842657
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6raEvaL1qgxM3jdNFE+RBpQlxSXFcZb7ZxGr2PjKsXjdYENS0jJTz
 DMeC2+PM/eCYDbyeI91aInn9h9U65HUy4VgGQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La9Es21BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE7qpzFkYPHIsjp8F4UEBk1
 eERNwARR0XW7w626OrTpuhEoO0GdZCuF6RG/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H12D+mLW0wRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPAmWbfrC/z7gPJtS3RYaM4LbmmzdUp33mq31MrExc7D0Tu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslgEYc8pdFas98g7l4orZ5RyIQFcNSDFpYcYj8sQxQFQC3
 ViMms7vBCB+9ricT3uS+628vT60ITISL2IJeWkDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqY2O76T+FnGh3enocHPRwtsvwHPBDv7vkV+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRPHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:QE5vZ6pc6I6s7eLf2ePXg30aV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.93,237,1654574400"; 
   d="scan'208";a="77842657"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8p209n2WpSW80eygiAtK53GYG4KNYJTftq8ftq/MKX/lyHQlnHHqxYa5B7JN7vQlUWWC9WUS1axXHr1Yxwwefi85bUVJ2kSJCmVW7tp1sZfwCGD46V/b50bbgWt3ouoZDt0Mvv/aRkuhErYMmUMkJJZ6I5nPeY+O/WZb4vNb+JvhZIJjCQGGp2T1VKhsPlFsTk8R7M2fPA6ETB9M31jLunhQUElzQHEkUbRrfSUSiknpHAe7kPmzBr1o7l30MyE7mO60bXMFziA7F5+Fu+1Ekf2HYNSypf4J/Mya5kdEx2Cp9QlNaAutV2LEltjHSFPEO1ikNWIuniM0nlHjXtggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5wVteDfW/dWh22+9mUFG7jkgM81Fx1dz52uxY86x7U=;
 b=claWVyNcHN/GUtzJwp1+AMLfro9HX9eNUFquxz/5jMSm1mpwwvwWTwJ+Qlp6m6B91ZXN7dGCSytpqBxOX9hZalgbOgIMROGbvi+GOakNrpxCXycn4CMd9rj8+HZtLxfkSHUvErLg89Z+NouXv8LF9ieZ77dTGkrJjYEply6xRdWJkm12vhdhsmgZsMWBqJrIkScu6GrNSURJWkTPd0E0Vy8BGCM0ig40BOdOvUYGAys/FVoLgFIpfyf9TOz36M4AcNi+gulc0xeCfZrI5NNXTUPwJfyZhpByoYOaA3Y0K+qy77ZULTEOkB6bEN37WSkIqufTxV/q8e0Z1ij/6143Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5wVteDfW/dWh22+9mUFG7jkgM81Fx1dz52uxY86x7U=;
 b=MTdvP8VA5S/eJgQpdDQ2fRsMAPH6l4HPq/rgqrPFOINZg1zk/xOKIk4Gu7Mj321EFqeYk/z+S1x8QTMhzpG9iuW9KG3HWN/IEDZI7c/YRv6PP/UDLv+k0DHT8sYy54HtHzfduUeY0duITz8sfGOIc03Hqeffvxxdn6dWeXsrapI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Topic: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Index: AQHYagMx4yaKKSDaVEqrb6mC4jE4eK2wJomAgAADuAA=
Date: Mon, 15 Aug 2022 08:15:12 +0000
Message-ID: <1dbab710-6d3c-a6cb-faa7-31558c04aab2@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <53cc6a9f-5a4e-0716-fe08-ad86fc155cbf@suse.com>
In-Reply-To: <53cc6a9f-5a4e-0716-fe08-ad86fc155cbf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9f46f73-20c3-4020-f798-08da7e964700
x-ms-traffictypediagnostic: PH0PR03MB6477:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 F0u+CnLxqPOclbymZHcr5cFePh/TyAh2IPjVpRBWnm+T1JSf/2nV65X/X7DwsPZslnRID1+WswnHGRiwys7WXk+gsjSo03VzRAxp8Gce/GIzgPYeTYJW8PkG9SE0nRuxQugCYcAlr1oHYx9m4So7YJoOPMccizoGXhrOj0mZ6uFiUlsRqxw2tP+aeQxDHzXsLDvvKelDQthRi2/1iCHMMJWL27mzZiJvZUTAWlBK2YRLTGf2jV354dNbPAbPNzejw5bI6+nAf1ro344OzGa7nq23oAyjQ7Bodf8YOa4Ts0gsWsgcoLFx89U4zAmXgPCsTky6LV1ueRMWPXhoOBFDa2ke+lry18a4ZPqmfp8pLxr+W1svC17p4ZE7oOCFpm1oTRjONqeODtxClBm/+UZcAg7RrT4T+d5LjxcSz/3q7JXKZ0KYHPYLOsFxMHU7P45lbooovNAjkrj0Ju26TInGyHCXt8U7YF7EYM2gXnW0zJakxUWOinoaPBKM/M91zrhRdwFz5vJzB0mEUXYeHr/+xCYwVME4aSUUO5MWscC0Aby/QedEGg8+PaBamCnrcZjB+aQ6YGTPFzWaN+QjZeDKBNCKwNZDcyehW8UOB9jojmVX0kxZ2LEz0GaLsFdUPkRgtoiw8BmDniG5UkPnqrJOm16YVzETG5e22KMZxLYPfKDvY9cQ61O0p0j04kNqezSw1700cxv4opd2WTMJS/FLxgwdzytp65k/S6e1Gxd+Cli6zoar3+toiHt8JDMmVvevLuujtRd3ik/johO78qKlNcD9jSNdpLX9Bnb6xaOKbeXZoQAGPa9qGDgglVZ79JEA1VcT/sUpAC/CxK4fg4uLwp2Z9MF+pZ010ujuHla4AiGXsy2uWOYVFA9F+pjy7twk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(478600001)(31696002)(5660300002)(91956017)(66446008)(31686004)(186003)(2616005)(54906003)(110136005)(8936002)(86362001)(6636002)(6486002)(36756003)(122000001)(41300700001)(316002)(38070700005)(71200400001)(82960400001)(64756008)(6512007)(76116006)(38100700002)(4326008)(66946007)(6506007)(2906002)(66476007)(53546011)(4744005)(66556008)(26005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlMrVGNuSmFXWXYxSXNjdVpZYTNUSFhxZ2wxVk5ndldNZDZaU1VlVzVlV0l3?=
 =?utf-8?B?V09mZzlSR0dpYWJPRm1yZFdib1lCNTM0cThtNVBiajE3ZUhwMFdkbUhOQU5Q?=
 =?utf-8?B?Wnh6aktzemMyeHpBcDRxMjBnSW9QRERvQVdLNFJpTmxISDFVL0RybWtVSXl0?=
 =?utf-8?B?bzNsNmRwZlJxamxLS0RNNDFERDhTaVZsMVpYMWErdEJiL0JJTmoyckR4QUU3?=
 =?utf-8?B?TDVZOEpWVmpVV2N6c0VUMWFnQ09aYi94NnQ3dVl6aFkwdC82NWpyY2RqZjBx?=
 =?utf-8?B?K05PTHRpWXpCeTFtNk1yL3VWb05udkNUeStNbU5OUnQwR3JuL1NGcVUrNDRp?=
 =?utf-8?B?MWROVm9VeUppbFZuMmcydGJuK2lQd1IvTmJaTmFlUmwzeFZ0WUpGYko2NUhG?=
 =?utf-8?B?R1EzenBwWXNudkhGZVFOb09qRWpQVzBKMHgxQlZvS2pDVzVwQm5jSDlnK0hY?=
 =?utf-8?B?Wk9NSDZzUmpNN0M4MkhNZm12dk9VeDJhTzhKUS9vbkRFZjdzSUFUTW4vMUpU?=
 =?utf-8?B?b3AyV296WnNCZzdlOGQ0eEttRTJRT2FHTkhWak9mRGhPVEY3OWkvazMwaEtM?=
 =?utf-8?B?WlBQeFpKWUVqanBpTmJpVzBQRE9jM0tseS9Ua01RY3ZxUkJzYmdub2tWb2pH?=
 =?utf-8?B?WFZzN2EyNmtJTEFNTk4wYzFNemlvVVBSdVVjRDlSczNvVm1tbCsvL2pMOExK?=
 =?utf-8?B?YVhDcGFTTStMa08vMGtPakRPNkgzNE0yVUdmK0ppZDdwZjg3ZmtrKy8yUmFt?=
 =?utf-8?B?aHYybVg0TFRHeFF4NDlnWW16UkFYbVlSZW1FQ3RlenpaMTFvUlJIdXg4cUxK?=
 =?utf-8?B?NUJ5ckNvMDBkUmtCc05venJxakJlNHZld0V2eG9Vc210YVNPVE9vbEt2OUJx?=
 =?utf-8?B?anp5OWlSVExsKzh5dmdVZ2Mza3hXT1UzZnFzL2ZUNlhrUkI5dS9KVTI0QW1i?=
 =?utf-8?B?a3B0NjVCQmFad1RUOG00SURjSUppUXdHSUptL1QvN2JnUktleUwyOVNUazJG?=
 =?utf-8?B?WjAway9ieWo3aDdpWGl1amR4R2NTeU83MjhpVTlBZ0ltRVRKc0FhUXFsLzd5?=
 =?utf-8?B?dmNVanVuQ2Z5Y2JPL1pDVGZmTlBWcTBnL09GSVIwaWtlZkdRalhsMDU5UWNa?=
 =?utf-8?B?NG4yNUpDWGwzMlBxeExhT0IweEJHZ2ZzUzVGZjZSUFhabkRZdGM5S3BnN0sw?=
 =?utf-8?B?ZDN2WHcrbEpjZE9Nd09tU052a3lYNXRjdlF1M04wSlpPZmVSSldnZkQ0dCtv?=
 =?utf-8?B?V1FWWFdneDcyUi8xMGVjemd2RnhFU3BCd3pXa294b1hzWHU1RnN0a1hPQ25Y?=
 =?utf-8?B?cWprMmJRU29qbzVtaU54Ukgva3V5SjJwMW1zclZsWC9SbTJtRzJncVM4ZVRt?=
 =?utf-8?B?OFBWbjF6Tm5ncU1KZE92SGxJcDNPYmxLbUlLSnJrSTRtOC9kNU9GVUROS1Rk?=
 =?utf-8?B?d0lyMm1vZGZEdzdsd0RXQURYWDE5blNxZHVtQ0VVZUlmbEVOSHVTd3dNN1BK?=
 =?utf-8?B?dkdMcjZLeFBSRnVIRnE5eUkyOU5uOW9UcTdCRDVNT3ZqM2xQT0tNQzVvQ3d0?=
 =?utf-8?B?ckpMWlQ4V0o4dkJEOWNuV01hVFdibi9HdTl4Rjk3RUdOMGhGU2x1SzZOYlo2?=
 =?utf-8?B?TkROUDFYTmRYQlVJQ3gvVmJVTVljVnpoNnhJbXB0OHFCbGFNTUxoUHFqcVFy?=
 =?utf-8?B?Vmhrbnk3WlJ4L1ljaFIyVGNpbW9ON0IvblFDNGxRNjM2OTRFamY0ZmY0UFBy?=
 =?utf-8?B?UmovbENueEo3Rm5ob0k4UU9rc2ZFL0JjL3dSelFtdnRGYjhLSWJaNURROWdC?=
 =?utf-8?B?bCs3SUlzT2RLekFTVWZlZmNJUE1hTDVEUnUrTzdSRkFiTDh2NUdqTHR1dHVN?=
 =?utf-8?B?S2phejJGU0NWNkpDZ1FoRGxZYlRJeVE0ZllwMmt5TXlVNUN5TE81V2xVS3ZT?=
 =?utf-8?B?TjF1RmdNSW1td09PNzNiUCtxL2VwNjFtV3MxTnVTWmhTNS9VSU5TaW9XeUYw?=
 =?utf-8?B?ZmxuWXUvYkRmNkNSOU4wK05nS09IVkFLby9yRVNZQ1NTei8xcmxtVnlVMmNW?=
 =?utf-8?B?ZnJFa1pqckhqY0FhSHRFczJOUGZtS2JnekNqQjBKbHRabW5sWHhvRlBqV0lW?=
 =?utf-8?Q?A3J4KF6AdrkPG6mjtTTy4H8fa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E3BF4BCC16CB94B8088DC82BC34E362@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?aHMydUdCQVlGM1lwUzRGS01WTFd3eWlkY1NmRUkybTF6b0lvdmVGeXRLd1lF?=
 =?utf-8?B?c0xVMi9hLzFpazNLdWt0dUU4TjBFVDdFUzdHak93Q2lyRGFGZ0drNkxFQTF5?=
 =?utf-8?B?ZUJaUFNYUGx2YXJFNGdkbDB6SjlrOHVWOHZNalBseUNUMzVSdi8xK0s4aDQ4?=
 =?utf-8?B?dTg1ZUwzOW1xeFpGWnV1cFlMalE3K3B3c1BOMkszeUJKM25IL1J5MFFHRnMr?=
 =?utf-8?B?NW1mQkpRc29XbllEd0ljWmloWk83YXNtakVVUCswNjFEblhjWWdRaW5VMGQz?=
 =?utf-8?B?ZTdPNVNpTWt3cW1vdG5US25ESTdrMzdBZGlTaE5zbVYxd0pwbTg5TE43RmJw?=
 =?utf-8?B?MkNkM09KMDhYNjRsUXpxZlJPdWpjKzBGa0QxTUNMQjVLaWVWbW8vRGl0cEFJ?=
 =?utf-8?B?YUtJQjV5UUZRQXFPa1F2SFpiRU9EbVpiVzcxTmZpSmdSbTcxYjRWTjlWTEVM?=
 =?utf-8?B?Qk1GeldhYnVqM3dDNm9qN1VJZERQRnpSRTExSldERGg4S0t5ZHI5NGJ6YUxq?=
 =?utf-8?B?cG9vMEVBUWlFUGYyazEzcWc4dXkrQU9icjJpbTVLWVFiaysvSDcrVUF6eGEr?=
 =?utf-8?B?eG9VV2U3U2h5UnRKZno2Mk5UUHpzWFFkM0J2T0poRGMrNHU1Nm1HcVpsMjZj?=
 =?utf-8?B?R2pSbXpoR1pXRTNOM1IyWGcycU8xUW8rT1FrSVorTythTVg5amhxMEZjUmJu?=
 =?utf-8?B?c3pzTCtBVXYrUmFZWDBxSkhiZkZtaFBKMENSK0ZuNk9seUpzVTc0bW43UzNo?=
 =?utf-8?B?cWkvRE9wYlgxRmVCdGJBbVo0SCtEZ3FlVllzbVlWTFFPR0pnNnFveTVod3BM?=
 =?utf-8?B?U2wxbHJYR3pkZ0JZS3Rod0xQVE1KUGN6QjB5LzFDbmVrVVRuNGZ1STRJMmtW?=
 =?utf-8?B?bitFbVBaUjhpdFpSVm1BL1RnTDFKSU5acmNMUUIzYzhMRnZoYzExWjhKMUNu?=
 =?utf-8?B?dXBoUG1IbmR6WkZnUDJydEpHN1ZxcGVFOUVKMUUycmZISVFNQXluQzdCZDZS?=
 =?utf-8?B?OWI4RTBCTE5WSzBjb3o0bEJaZlFUajc1UkJMbzNqTitxY091V1lrcDFjNDNE?=
 =?utf-8?B?YjdjOUpaVWpzMCtiSTNzeU12YWp4NVFJMU1Kdm52UFVRQzBQUjIzTHVEYW1o?=
 =?utf-8?B?OXh5NzZPZEVOR1BlWElSZSs0WVZFbWFlS0dBRFFaYnJVS29HeFhUazZMWGdV?=
 =?utf-8?B?czRFNnFBUkZBUFNBR3QzVGlXY3MxUUJ0cktMM3RGUUVSNmI0QjA4RFRjNExF?=
 =?utf-8?Q?YCyfiQuFk1o7Jf+?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f46f73-20c3-4020-f798-08da7e964700
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 08:15:12.7317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeNtvBtLz9hLUCOrvUhagBITlAIt3SdIxr7B6niwdnvGbEsPMtCF78/bXMkssip4kbaBf7TLA0JNav/mysEVewZVlzfm4qJYwpXBIjUM/lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6477

T24gMTUvMDgvMjAyMiAwOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjA1LjIwMjIg
MTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4+IFJvZ2VyIFBhdSBNb25uZSAoMyk6DQo+
PiAgIGFtZC9tc3I6IGltcGxlbWVudCBWSVJUX1NQRUNfQ1RSTCBmb3IgSFZNIGd1ZXN0cyBvbiB0
b3Agb2YgU1BFQ19DVFJMDQo+PiAgIGFtZC9tc3I6IGFsbG93IHBhc3N0aHJvdWdoIG9mIFZJUlRf
U1BFQ19DVFJMIGZvciBIVk0gZ3Vlc3RzDQo+PiAgIGFtZC9tc3I6IGltcGxlbWVudCBWSVJUX1NQ
RUNfQ1RSTCBmb3IgSFZNIGd1ZXN0cyB1c2luZyBsZWdhY3kgU1NCRA0KPiBJIGNhbWUgdG8gcmVh
bGl6ZSB0aGF0IEkgaGFkIGFubm91bmNlZCB0aGF0IEkgd291bGQgY29tbWl0IHRoaXMgYWJvdXQg
YQ0KPiBtb250aCBhZ28uIEkndmUgZG9uZSBzbyBub3csIGJ1dCB0aGVyZSB3YXMgcXVpdGUgYSBi
aXQgb2YgcmUtYmFzaW5nDQo+IG5lY2Vzc2FyeSwgdG8gYSBmYWlyIGRlZ3JlZSBiZWNhdXNlIG9m
IHRoaXMgZGVsYXkgdGhhdCBJIGRpZCBpbnRyb2R1Y2UNCj4gYnkgb3ZlcnNpZ2h0LiBJIGhvcGUg
SSBkaWRuJ3Qgc2NyZXcgdXAgYW55d2hlcmUuDQoNClJldmVydCB0aGVtLCBvciBJIHdpbGwuDQoN
ClRoZXJlIGhhcyBub3QgYmVlbiBhZGVxdWF0ZSByZXZpZXcgb3IgdGVzdGluZy4NCg0KUGF0Y2gg
MiBpbiBwYXJ0aWN1bGFyIGlzIGZpcm1seSBuYWNrZWQsIGJlY2F1c2UgdGhlIG9ubHkgdGhpbmcg
SSBoYXZlDQpldmVyIHN1Z2dlc3RlZCBpbiB0aGF0IGFyZWEgaXMgZGVsZXRpbmcgdGhlIHBhdGNo
Lg0KDQp+QW5kcmV3DQo=

