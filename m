Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DFA614F9D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435168.688287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opuMj-0005uf-V8; Tue, 01 Nov 2022 16:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435168.688287; Tue, 01 Nov 2022 16:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opuMj-0005sM-Rv; Tue, 01 Nov 2022 16:43:53 +0000
Received: by outflank-mailman (input) for mailman id 435168;
 Tue, 01 Nov 2022 16:43:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kAaH=3B=citrix.com=prvs=29712412f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1opuMi-0005s0-0W
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:43:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5adee95c-5a04-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:43:48 +0100 (CET)
Received: from mail-dm6nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Nov 2022 12:43:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5546.namprd03.prod.outlook.com (2603:10b6:806:bb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 16:43:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 16:43:39 +0000
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
X-Inumbo-ID: 5adee95c-5a04-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667321028;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PBESsZyigvbb47SSPjBG7n61DaIXRMZrbk3poGWYFqQ=;
  b=ZzKoa5Wc6HdxcQTPWkgEKTuOlBgk3inpANIaUSI3p7zScj5zLR4Lc5ou
   IMwZK7VrqB5r82l9C1qN3uoMVdimP/qpEXm9v1HM7CDPVXA0Hnj7FC5U/
   cVppkZgaeNsqRxqwKDYevFjmrqSD2OtTo4w7ndpwTolTvdMIqMekNSwpD
   Y=;
X-IronPort-RemoteIP: 104.47.73.44
X-IronPort-MID: 83031418
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/NSutKx1LrBV55IUNJZ6t+f6xyrEfRIJ4+MujC+fZmUNrF6WrkVTy
 DQdWzqGOveOa2TzL94jaoS2p0oEsJ7TzYc3S1c++CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVnPakT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWB/z
 eM2ODUfUhGgjOiG5OuhactApv12eaEHPKtH0p1h5RfwKK56BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVkFAZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOgANlLSOTonhJsqGG+/lQSBAYGb32cqubnl06QSeACe
 kNBr0LCqoB3riRHVOLVXRKip2WflgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkTgxTVX5BcGai6ptTvHHf7x
 DXikcQlr7AajMpO26Dl+1nC226ovsKRElJz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6zt3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:Trw4xKgcCxbFGUI4gMkaoL14jHBQX3l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfZsRKEkjTRo+a07bVTHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0Wf9igF3ekJhlTVfsuaDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.95,231,1661832000"; 
   d="scan'208";a="83031418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuYhtD3+2gY9yeiFAkLhHzYZ7J+mRfGQC4f5tUfAfkqKlzlo+vIrKOpqHbVIK+YYDB1egA8RZkdcsSypBFPjIKTaDUyh/r1rkXswPMtTROvak6vsFn7OQgLAs3diXfZJQE/Dpy0ajwA239mG3LQoUoHm6FFt7lJMgjkyyZpfZPuVw3XyO/C0RAV8pyBV1hUGyOqtQ41Z0KycF1FlzlJRlty+q7k9aaFP7IBl/gvVJiF/2ur7Ij+f/QI9nldGVhGzAh7obUH7SqK0dzRQe4lQoD8KywVHw23seGWcUpzgrSXil48VlN+9f5eaHKtWkUNFxUgDiev1+2d/zgdUdwfFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBESsZyigvbb47SSPjBG7n61DaIXRMZrbk3poGWYFqQ=;
 b=XX59zcdG16Cug5Fl1nPwHGQ+OpARy7kWX/LLdOmaSvzu/p5XDRDJu5nn/Su2/aZ+ZcLexdtB8KfWEJ3Tk1dSOVTKSSO0p/foOZXaNYZZ4jDNJhiYTtGrsPp770LJV/1EwZO+djCIxd3uNGxuDEs748SRnjEiFB9JmnPeW7VGRpeGgT21fKmU7WOd11ohlNbIbD2IsIhLrfUmvmfFXtBR8cT0uGKLy+FmybUYfLbvV4cmru61NyTUjjnQihgNNOL02ST2fmtJx5l8lbUjti98ledKlYAd74mmMNv5B7n/L7IeG/XDHZ00xFNv8ym8hQWrAa/szCYHHcK2fUZKA4wbMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBESsZyigvbb47SSPjBG7n61DaIXRMZrbk3poGWYFqQ=;
 b=jlvYXHCocLa/MH3tpJokUOljRLMf3qhWpqAxO48ykdH4G8qawMlOZmiqXOCWZOctNlBjW8AYKZdeWdVj90ZsalOGIOALVl+hpxszNQWA93qmDtBR8bmRCg/0PG6kqPjnBYdQX/h8m3hNgomfohWa7viux654XJPr8YzmQJiL8mY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Julien
 Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 01/20] tools/xenstore: remove XEN_LIB_STORED and
 XENSTORED_ROOTDIR
Thread-Topic: [PATCH 01/20] tools/xenstore: remove XEN_LIB_STORED and
 XENSTORED_ROOTDIR
Thread-Index: AQHY7ga/b4iszKEqLE269ZEbCknJE64qRiKA
Date: Tue, 1 Nov 2022 16:43:39 +0000
Message-ID: <766454c4-1065-a991-b64e-c9f950ad8cdb@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-2-jgross@suse.com>
In-Reply-To: <20221101152842.4257-2-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA0PR03MB5546:EE_
x-ms-office365-filtering-correlation-id: 32bd6656-e77e-432f-249f-08dabc283ad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 i+W7v918X7Dbk6ZB3gSRUORhG8sveYqqdZEGlSAgyKAbtTmlzE1jU7tOyaqHg6296FJSz5QXpFKq8SKgvy42Dl9UxOdolcgbO9yLgFqCL/70oOpTo0uJi1C/ihTizDkO8e9ng3Utx3+kYIIH9/KeUA0S3hzgTyQ2/sRRuEMvhSlQa9v8iOo1fy/1B+M0eNEHTAxA08XU9cS6rI/LViu4irlDBS2AnaqFNssRyc66ofZIL08lGRbFHJzM+BN0bcWwE73VnuEsXFweFgy+8fcfwEhsUc5uxYdD98JJwn556pMHmf6V8KlznA3hKDzAT5M6J9RCDDTML9/4SajfB7E230fJmC8qISkKng0vjOAcnoXeLqWc5wc1ebD3/gxjB0XdJu6jHLvpIO51o/zLRhaPnL7ikAbdEBMbGRuZ42o27nkeK6lXR6YWNrNsQl7fi+DT452WIAq/gA6XqYM8FMfnwk59QXm8PzIUoSyWYe/8K484006YHpG1j98mmLl48dYLDEp8KLfpcnVzEaV1/+x1vivmFw1GlzZiFQfAya2V/Ae/FZ7fGQPuvXhHvTCSPyW1Nc8ci4CCfF7iT7pOfuelafLAjMaZXVV6oyPXYU2nntJiq8ZoKAKaQVi9u6HeRIkgW4etPhCx29QvT4ZEGjlRMILJB+YXcmPvf+9CGuEUgBR8pYC0AOWKNF77kx7EtQmQgEmvvjO4CnsBLeGPSKzaTvV9Rj7uNXav+sD5WWeU8xZ8RthTW3bO0IJBLOAiU7EnXrwHTEgiCFNgoouj39E8PGUTp7ltgWBDrIVc3FjzgKk2RRyFXkavwNspwXeqlbsGGlHHJZS+w0IFT2btoog1cw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199015)(31686004)(478600001)(71200400001)(6486002)(83380400001)(2906002)(53546011)(4326008)(316002)(8676002)(86362001)(31696002)(38100700002)(122000001)(186003)(6506007)(82960400001)(2616005)(8936002)(5660300002)(26005)(110136005)(41300700001)(54906003)(6512007)(66446008)(64756008)(36756003)(4744005)(38070700005)(91956017)(66556008)(66476007)(76116006)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cm8rTTJENGNRelpaZUdrUklDdVptS1lPNElkMUd3MjFQQmxBUG1nOUJYeFJ3?=
 =?utf-8?B?b2NMQnRTRmkxUmRNMU03dTFDUThlenBRdWFzUEtwUnJGYkVvTXNyWXEyQWFX?=
 =?utf-8?B?eENlcnpIb3NWdm9mZDcvSzJUbjRCZG85cXlnaGYwakR0bWg0LzZqSWhaNWxp?=
 =?utf-8?B?am5qL3Zhbk5wZDR1dXZsdk56NTFlNnlOdjVkR0hmSFJFWkhMZzRWaTJrSXVW?=
 =?utf-8?B?c0g4ZjVDNzNBK2ZvK0VNRk1jSHpvazRnOGhmMUFOQlhVQzl2WmFqTzZ6ejgx?=
 =?utf-8?B?d28wbHNjK3ZSTTZLUCtZOERMWGdzbnM4TEJMcUwxN0JESnpqTVBIbzdnT1Rz?=
 =?utf-8?B?ckdxYmRGTGFCMko1Zi9NcHJuMUhXK1lXZndSOTV5ZzdWN0Z0QnZWVXJDc2N1?=
 =?utf-8?B?R2VwTGtYbDVhY2x1OTU4MDg1OGlFb29PNFVBOVNUUTBxMDhOWGhsTkRKU2gv?=
 =?utf-8?B?WDZpbDM1blpPMytoQ245WmYyMitHU3g5bDNLSDczVm9UWGtTK0dRRlFTcTFY?=
 =?utf-8?B?akM4S29ySVFZbVN5Z1RiempoMk02UEYxb3dWSlJUVGE1a3YzL0RBQXo1czI5?=
 =?utf-8?B?TDg0aHFrUDlEUXFyc0IzUnJhSHlSYTNjU3EvUlU1YmFIZmF1LytubE1KVVE5?=
 =?utf-8?B?VXRHOWpjYnVWZENuVGhFV2kraDdjcHl6cEpJTkFSSWFad0E1QklROXdOYkhE?=
 =?utf-8?B?VGkvOEhGV1hTZ2dpYmoxVHJEMUxOWDBCd1ZUcE1pU0NrWTUzVXZHYStRTHNZ?=
 =?utf-8?B?SW1RWnZ0VUFHL2RIY0tQUzljOGtCUGlHTEZ5NndtakN0LyszVVkrWVZjR1F5?=
 =?utf-8?B?Wm52aXlwUWwrSUZnWVVKdk9pOEpSYlFDeHE3bk15Nm1RdDBVUStkcmZpK2pi?=
 =?utf-8?B?SVdSYnZkWW1TeWpZTVV4TTlqd0wwZEliS2lHZFNCT2tycDR3ZlRFbWRYNU5a?=
 =?utf-8?B?cjNIWDRZUi9VVmFiYzlTcEZzbkowc3QzZzhqVzB6ZkNCL3ExeU9OUmdmR1Zw?=
 =?utf-8?B?Rlg0VUNQamdwN0p5Z2VtTE5Zc3QxcTl6WmUrRkNRY1M3ZjdKbmEyUk5nN2RD?=
 =?utf-8?B?bXBWSS9kOHl6SDFmUm9zbno3ZVlTcHZPb0srQ3ppUnU0WCsvTzFvZ1Z5TkFC?=
 =?utf-8?B?b0RKUzcyd0tUaHppMUZQVzVGU0c0QW15MENaay83UHdqelZsbDdzanJVZDJs?=
 =?utf-8?B?MTdEWE1VQ0VuMjZrY0dleTRNTmRSRnAxSE1DTVJWcmxyRExRUENuemx2WGZB?=
 =?utf-8?B?NzkvTVpZSjFuVzgxT0RnV1p2UE0vdHhUUVQ1SWlMb0JtRVNiWVZ2VTZqMnVi?=
 =?utf-8?B?LzRGMzVYbVRoWTlQWFU4NDBobXN6Z0lGNnlXTytuNkdsMUpUSDk2SlJ5bkpp?=
 =?utf-8?B?OEphQWc0MUxiZE9lODdPUzkySjlSQnRBUGlmN3NNa2lRYTN3WElKVVFtc0Fu?=
 =?utf-8?B?QVVJTXFSNzdheEt4NyszUzBrenBYQnRsbUpyWVdOQnFuV2VvOGo3aysrVEJk?=
 =?utf-8?B?Yy9sZ2ExeHJjc0xSOVRWTE9nNDNZRWo1c1ovdzFYc2dlaHhmTUpYVWpYQXFj?=
 =?utf-8?B?SkptazhtYzhGcG1BQzI1ZlFWQWI2dmFhWDVEZjZ1Ull1WVBQTDNDVFZFYXBz?=
 =?utf-8?B?d0FnRmdWMWYydkt1OGZCcnlUQVFQWHlvNkxYeEl2cFhVem0yWGNzZ25jaENC?=
 =?utf-8?B?MGxBTDNHbDlER0luN1dwMEhERmdLYkJTUGtGdjJ0ajl2Smd3NFZxSjNVdVlK?=
 =?utf-8?B?YURJR0JYdERjSkNyVnoxeUI0VzlmUkNUQzZ0TFlnTzVmdlRPSUlQRmMzaEMz?=
 =?utf-8?B?ckNpUDhGTGpsck1LVEJ4WGFscHdnUC9kNG10YTFoamJ0enZDQzZPY1Vud3Q0?=
 =?utf-8?B?SXZhWkpiNE15aDhaRlhPSkprV3BYcWhmV0UxSFZWem1VL09tbm1pa0NNdEJa?=
 =?utf-8?B?QUpudkEvQm92YjkvdnNyMEZVai85QkxqTnJzd3pUaWlxK2hTQ2gyeW93WDYz?=
 =?utf-8?B?cEhKTkRndm5SWlVvMkxSZ21ta044bEtMb2NLeWE5YlF0R2RROG5MeHpiL3JS?=
 =?utf-8?B?anN1WXkyOTJmTDA3SkRWcTRTS1JyWFY5dk9KTnRMaUdqZlFrWElsemFvK0pZ?=
 =?utf-8?Q?+9JZ2O9Zd85zj9VUgjK7FvQ/1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFD8CCE18E6AF24C96EE887EB9BB4597@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bd6656-e77e-432f-249f-08dabc283ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 16:43:39.7285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSXeYQtxD7oy9EgEbSdH/fRkbuBd46gETCZcFDuw09OC5b2t1aMW5xRr0U/RQVqNzAlr/by362y172lYLb/Jd+az24QSswVpcAp646Adz7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5546

T24gMDEvMTEvMjAyMiAxNToyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gWEVOX0xJQl9TVE9S
RUQgaXMgc2VydmluZyBubyByZWFsIHB1cnBvc2UsIGFzIGl0IGlzIGEgbW91bnQgcG9pbnQgZm9y
DQo+IGEgdG1wZnMsIHNvIGl0IGNhbiBiZSByZXBsYWNlZCBlYXNpbHkgYnkgWEVOX1JVTl9TVE9S
RUQuDQo+DQo+IFhFTlNUT1JFRF9ST09URElSIGlzIGJhc2ljYWxseSB1bnVzZWQgYWxyZWFkeSwg
dGhlcmUgaXMganVzdCBhIHNpbmdsZQ0KPiByZWZlcmVuY2UgaW4geHNfZGFlbW9uX3Jvb3RkaXIo
KSB3aXRoIGEgZmFsbGJhY2sgdG8gWEVOX0xJQl9TVE9SRUQsDQo+IGFuZCBhIC5nZGJpbml0IGZp
bGUgc2V0dGluZyBpdC4NCj4NCj4gUmVtb3ZlIHRoZSAuZ2RiaW5pdCBmaWxlLCBhcyBpdCBpcyBu
b3Qga25vd24gaGF2aW5nIGJlZW4gdXNlZCBzaW5jZQ0KPiBhZ2VzLCBhbmQgbWFrZSB4c19kYWVt
b25fcm9vdGRpcigpIGFuIGFsaWFzIG9mIHhzX2RhZW1vbl9ydW5kaXIoKS4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQpEbyBJIGdldCBhIFJl
cXVlc3RlZC9SZXBvcnRlZC1ieT8NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQoNCkNDIEhlbnJ5LsKgIFRoaXMgcmVtb3ZlcyBhbiB1bm5lZWRl
ZCBtb3VudCBmcm9tIGRvbTAgKGFuZCBhc3NvY2lhdGVkIGluaXQNCmluZnJhc3RydWN0dXJlKSwg
YW5kIGFzIHN1Y2ggd2lsbCBiZSBhIGJsYW5rZXQgaW1wcm92ZW1lbnQgKGlmIG1hcmdpbmFsKQ0K
Zm9yIDQuMTcuwqAgSSdkIGxpa2UgdG8gdG8gYmUgZW50ZXJlZCBmb3IgY29uc2lkZXJhdGlvbiBh
dCB0aGlzIHBvaW50Lg0KDQp+QW5kcmV3DQo=

