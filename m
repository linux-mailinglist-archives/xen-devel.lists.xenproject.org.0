Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D1F65DDBB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 21:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471468.731323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAUs-000149-Ig; Wed, 04 Jan 2023 20:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471468.731323; Wed, 04 Jan 2023 20:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAUs-00010i-EK; Wed, 04 Jan 2023 20:36:26 +0000
Received: by outflank-mailman (input) for mailman id 471468;
 Wed, 04 Jan 2023 20:36:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDAUr-00010c-86
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 20:36:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72fb8ae8-8c6f-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 21:36:23 +0100 (CET)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 15:36:20 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5449.namprd03.prod.outlook.com (2603:10b6:806:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 20:36:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 20:36:18 +0000
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
X-Inumbo-ID: 72fb8ae8-8c6f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672864583;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PX9Hao7kAOIUCw01ZnI+MlM66qhVjSXG+ZjoCHG19xs=;
  b=QUffAJYOu4311AtoLcUJou8SLWvjqdV7mpxjqraMtAenCIEJdLjszp7O
   GBT/mXZt2ojETK+jSgHR8ouiwIZuE4AVaXUWVf8AwlwCgUDKJmDr+lsne
   KrGQEh+40qmD0L3LD2RWJTefftErnyoNf/xBUA07mDXFPXkOA9DBDLR1z
   I=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 91204710
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jbDMRKqc6xEj+mJn4PnrduGrwXReBmKxZBIvgKrLsJaIsI4StFCzt
 garIBmEOvaON2f2KN53O9+1oRkO78PRmNFgQAFq+Co1QSgb9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHzyVNUfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABs/czGarNqP+5zlCdJciMgAN9XpNZxK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzhrKY23wTLroAVIF4bDBiSntuAsXP9HNx+L
 EFO6gt2t4FnoSRHSfG4BXVUukWsuRoRWMFREqs59RuKwarX5C6WA2EFSnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqbygORxoI+NnnrYQ6iDrAS99iFOi+ididMTj0w
 iuWpSkkwbsJhMgA1r6T4lzMxTmro/DhRQkz4ALVUmu77xhRa4usZoju4l/ehd5CMYKYQ1+pr
 HUC3c+E44gmFoqRnSaAROEMGrCB5PufNjDYx1l1EPEJ+DWk/Xq+dol4+jBgI1xoNM1CcjjsC
 HI/oitU7Z5XeX61N6l+ZtvrD9xwlfSwU9P4SvrTc9xCJIBrcxOK9z1vYkjW2H3xlE8rkuc0P
 pLznduQMEv2wJ9PlFKeL9rxG5dyrszi7Qs/nazG8ik=
IronPort-HdrOrdr: A9a23:PgFxNq4/3M/fqOk8xwPXwPXXdLJyesId70hD6mlbQxY9SL3+qy
 nIppgmPH7P5wr5PUtKpTnuAse9qB/nlKKdg7NhXotKLTOHhILAFugLh+bfKlbbak/DH4BmpM
 NdWpk7JNrsDUVryebWiTPIderIGeP3lZyVuQ==
X-IronPort-AV: E=Sophos;i="5.96,301,1665460800"; 
   d="scan'208";a="91204710"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kE81Gwf+/uQB7/gUc5Yft1aiBxdo265ZX1zDA+qI5G8OEsZP+s2O53ClDQxL4L4fFpWT/Fz7J1JV6uiH84nJ+oVFz+F4erVAoa6NJjz1uPmysDBG/TzpS3fvuh2WjpZUfwnf5/ydwKRWR8CsxXKHKq1lbCfjvKOn2GLGdaLbwNrN5MqFmVdRm4737rp4wowNWsPOV8ZJXS97ViXrR7gyzzsxzRwJC+k/dVBljuEFexffvVrAjYW1PwCFSp6+0WrMkQTGtbt5Teo/oXc2dCpPbApsOi1WcioECS0p3DqYSLLAxfNq+ykuc1DHxF4ePzwKf6lecR7uS48HZXQpgFJguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX9Hao7kAOIUCw01ZnI+MlM66qhVjSXG+ZjoCHG19xs=;
 b=LpjPTE6AmkbgnCqRf7jGx3zJYknMe8pwS3AbWlyN1ifWK8LbBmd2EMc6RYHYXO2fgY8Mn6CD1Bel+X5bKVFxussVb+YfcbJtaUcZORRQXGsm09aMRFG8viK5VBnuNs1GTUb5XERFGWeNmLW0r+mDfS+WOwDDQIIZnnmqpy1CnT1goP32XQmj5qp4uCJuWHO/C1PXOtv23uKmSzRCOClLoHXKxz+TEl/UAE/q2Iq14zt5YScUWuVH6TuYAjvg6RK+Qw/9f6yaMKLIVRozFEeROc0AVNOoih5oiyYBuw/wg6Vh8qFHVeApt/874Nvn8aBNcGbAM3SQNpYrZQZbM3omlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX9Hao7kAOIUCw01ZnI+MlM66qhVjSXG+ZjoCHG19xs=;
 b=TECNXG6HNbP/wgwpgtHgrGLVM+VNTHO0W9teIH4qY1OyKPisEMoRU4GV7LXhen4k2uJJ31ASTyKIgLwYOsHxRhvanK7omycL0g3v3wV3auacKWoADrFveJPcRfoaGAWEm99noagfL5mjKfYlY2SPn1k8R7AFw03OBvuMf0R3wNg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>
Subject: Re: [XEN PATCH v2 1/2] arch/riscv: initial RISC-V support to
 build/run minimal Xen
Thread-Topic: [XEN PATCH v2 1/2] arch/riscv: initial RISC-V support to
 build/run minimal Xen
Thread-Index: AQHZHE7fYMe4r24iGUSr/qW4K6+f3q6Ov8aA
Date: Wed, 4 Jan 2023 20:36:18 +0000
Message-ID: <fd67c2a1-8f57-2efc-e6d9-f82d529b8b8b@citrix.com>
References: <cover.1672401599.git.oleksii.kurochko@gmail.com>
 <4702cb223dbd7629fe3d3e494eb363f4b2534e96.1672401599.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <4702cb223dbd7629fe3d3e494eb363f4b2534e96.1672401599.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA0PR03MB5449:EE_
x-ms-office365-filtering-correlation-id: 610409af-518d-4e13-d89c-08daee935517
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Fg+he7S+pyE976bVWE8ZFC/jg0HmosF6Ifi/9DxqZ2EsSaasQ3K22te1M+oR/Wf95QHfPnTPm5PIUJFCytl5MieEM+eyJpTSbgAPMtUeU75lnF3UJYYTRM/EP8Z7u2p1WAK4Lv37AY9M8IZdeRR85oqggdIYzbCcC6Co+fHOaM5XWZrT/bAgFi1gAB+rWHxYuy+Yt94d/yFEkGYENWZu2Oszv1QTUeeXu85UQ3+1Qvt4RLgo+48HsWCivkcSeE+OGgHDFRD5NzioPfoyFOZtTxa+OVbe7E97Ad9gB04E///3cHcthNdET9607lvfhaPXyWFU0mX8wrAMCnHOVYzEr0yuDZePI5kT6Xi35XL+SVMsvZDDPzTFhtcJ+NwIsII1EjJfixnbBUcSjA4EYT9u8HEthx4+s96RXzpt6DbapdOdfGfr9JXA2bhGFZFmj1UijgXjGBTE3vibG4AP+tqS3byinqrTb6j42ngmK2FuV2ifNomliYYLQwUsGDcWFW/wc9NKNwsZlaLPgROejxZEwnbfmpmBnwojrgkbDLXWwZRf2DYDqWQp1wUZpxpItPt/pvItAH2L39uFh48CcJn4SfIfWm6ZMUZpDqfuU0F42FoWsjLXGNxGYs9NTLK5ruHDzSbfsRC2zKLs1NX5iX25ss4ZtXEqR+ZYP7vj61vLa061kJK1yGK6g7iWvGdjEPPkOrwzYsvznX4wrMlDB4A3wNY48FGS8e7qR/+EJP9qlr2qBqHC2WrR2YUzyCf62xSOZ4eS7I4HJ/RF0p8F+wnprw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199015)(38070700005)(122000001)(82960400001)(38100700002)(36756003)(31696002)(86362001)(2616005)(66556008)(64756008)(6506007)(66476007)(316002)(53546011)(478600001)(66446008)(76116006)(26005)(71200400001)(6512007)(186003)(110136005)(54906003)(31686004)(6486002)(91956017)(2906002)(66946007)(8676002)(41300700001)(8936002)(4326008)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTltbTkrbTdjejQ2SnRvc2hORDhPRXZGSlVBbHExbG1QdzNDQlNILy9FM29E?=
 =?utf-8?B?eUZ0SjhGUDhhaHFCcm1KMytLcUNvU3hEWkQwcVNHcEVrK0g2cUxORXkvL1p3?=
 =?utf-8?B?U00vZHJNdjEwMWVzbmt5WC85ekR5NmhpR3hHRmFyRVVMT2xBQ3NqSEJMdFR0?=
 =?utf-8?B?NVorUnBWS2N5dk9CSmJkOTRQZWtuRXlEckc1MEJJWitpZlRHWU9SRDlucjFW?=
 =?utf-8?B?K1QzY3cybFh5aTcwQmt6VHFxMFBWMGFCRU9CdGFWY2l6NmI5dkpiZVFqd1Fn?=
 =?utf-8?B?NFBkWms3NU1VZzQ2QStaNzAxcUcySU9DM2RKczAyQ2UrVitpelZ4MHZmMFRY?=
 =?utf-8?B?NlpOSWx5T0xEMFNmSWx2bDIvZmljOXdKeTJ1a2ZvLzg5eHZxc1RIZjV6VXdv?=
 =?utf-8?B?ZEh2TXRhZklqYkVFa254U0tzb0p6R2w1V3JhdHA4NS9XUlNMMlZ4OWNFT1lE?=
 =?utf-8?B?S3JsUnRyOW9WRjJHOHg2SEo0eHJUM1MwNFIrY21TRHVWMEhiTkJqcFlJUVMr?=
 =?utf-8?B?MEZFT2NlYWpKa3lNbjZtZzlKU0NyT3NMSHhJMkZPaVNNZ2k3clVVaWlXdnps?=
 =?utf-8?B?NGVRQTdVT3AvZTc5SGJiZXdRZmRXQ2tMTWs1NXEzOXpnaDRzbkQ0WEVURFBz?=
 =?utf-8?B?QU91ZnNSUHh0dzVmZmtFQ1lZejNMaHorMGM5L3p3cFoyVFU4OXRZNVlXNzJT?=
 =?utf-8?B?UzNHOXdnTm8yRysrVjRFdlI5citibWxzNUcwRG93MVgwL3JDVDkyQkxoeUF5?=
 =?utf-8?B?RlhrMTFjK0R3Rjlsa3VUMW8rMmtXdEo5VjNRYUdyczNCQ2JJUHpqc1g2TnVR?=
 =?utf-8?B?WmowR1FsNEYwVWhGbWFlSGVwUGNmTDhIcHRZZThPM2hLQzVGYndkUVhpU3BJ?=
 =?utf-8?B?dkJrcVpnamtnQVFvNWZHdWo4enRsQTllYnRlNTlBZy9kL044NndlY3NhV0hm?=
 =?utf-8?B?ZXZ1RGczd0dNc2lxcHpicGVaOXhHbmozOFVJR2FwSFQwSS9PR3VLTXp5VmQy?=
 =?utf-8?B?eWIxWU16eHNka01ndVZxck1QbXZOSjNiaDFGK3BNTUtPRTdmRWVjZHY4Nk1V?=
 =?utf-8?B?MlpncWE2OXdOSVlYMzlHUk1WZ0hROURtUmlvR0pTbEF1YVV1dW90RktVazRy?=
 =?utf-8?B?Z1Avd2RUT29LazVQOWNSeTV3c01HRTdPc0wzQTdZdk13R2w0ZHJONzg4eWlt?=
 =?utf-8?B?K3R1SDBaemNPU1pIN1lSaHJ5a2VwVXR3ZVJQWnBCcWdYcmF6bEZiOHBRdzdu?=
 =?utf-8?B?UXUrcnhDNXMyQ1FyY0wzZ2d4OUZLT1dVSEhLWXg1MzVkaTQyc1hrajEyVmlI?=
 =?utf-8?B?TVExLzJFSk1DaEg3b2NXMkxDSkhRKzBJS1N2ZDJMYkVKRnI1cHhubFF6NUJL?=
 =?utf-8?B?OHowbzJ2T1pBd2pKdWwrelJyQmdtY041WXIxTHVLZUhGQk9GL0FTdk1RNHBJ?=
 =?utf-8?B?T29VK3lENE90RzVySm5ST1Z1SWZ4eEc3dnp6L2oweG5WSWlKL1l5M3NmTEx4?=
 =?utf-8?B?Z3h1MXl6VzIyNDhoZXBXVEIvaW94UWE4aFlnY2JyOUtMWDUxc2R5aGpuUUg4?=
 =?utf-8?B?R29CQXJUUGE4cjhRSGVXUk8zVFVmWU5zZk1lVnh6M3F0Y0o5L0VqeVFma2Fq?=
 =?utf-8?B?ZGkvSHZMVFRyOGNEQ3EzeC9vdkVCMDVIbk9WYkpIbVFyQlo4TUxxalZwaDNF?=
 =?utf-8?B?YjNySFdlVm14Qm5CWVFhR0JvZ2JnUHdVdnIzbU9JWFRXSEg4OEFid0lXdW1k?=
 =?utf-8?B?RmE0QjlrdnpBMGFyczVLTGlqaFFBUDhpb3FqYlMxVWhWOStpWEJza25QODA5?=
 =?utf-8?B?bXYwN0JDUXJsVkRGY1JWZVg2cUo5Q01ZeS9lUE11S3RtSjZ3MnkwelpZdzFG?=
 =?utf-8?B?M1o4QXpxRU9ldzBTY3NtL3FnT3dkenY4WVkrSS9nRHZNeU5hZDRndHZFM09O?=
 =?utf-8?B?OHVZcEx2Ny9DeGNaOUc0MDc2WG1yN0QvdlRrZ0hSTTg1a0o3QXZ1UVpYNnJU?=
 =?utf-8?B?bm9KMGN1azdvYnhLMkZVMkx0VDRpTkt4cU13UzdrY0I4SzlwYTRqL3dhOStZ?=
 =?utf-8?B?RUVORXB2eGRvcFRGM2tYWVMvbGxSdlU2Tk1EWmdIVGdKck1kc2NmUnVySjQ0?=
 =?utf-8?B?eG9PM2ZFallwTXZzckFNakhlZVlpQ2JDZHFnWGFxakZoY2FLaWlkWXVKOE9T?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A63B007D543C9449974BDBC2C78F189@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UjJ6M3hFTVZBTndkQ0E4RVVUeEF2NGJ0dW5DYitaVDJESFNmZEtSR0xqNW9a?=
 =?utf-8?B?K3RoYlE1Rk43M1Nud21pa0lNckNoRG83NnpKcU5PbnRsa0wxQ3NkYzRxQXRw?=
 =?utf-8?B?UHYyL0RXdUtWbHdEVjFGMjdlMEd3MnhFK2pVOFVqU3FXaHR3RXI5dkRibVNX?=
 =?utf-8?B?Q1JWeEJHMWRZWkQ1dUlXWkZhL1BhTGpNakxjQnpkeFBwYzdUK09PeXRWd0Fp?=
 =?utf-8?B?V0pKSFVvQSszb0lmMmR1M0VkZlhHYkR1K2xvTTlWUFVtbDlwbW1pM1hoeERR?=
 =?utf-8?B?WnNwd05jb3gwZ0ZMNExKYlVqOE9UbXR0YU5nbkRuYmJmSWJPWEl3LzNyKzdu?=
 =?utf-8?B?SEloNUc5M0QyMXliK3VwOFFXNXdxeG5PWHNoNlNKQW1ZaHJxQTE1aHZScENa?=
 =?utf-8?B?aHpXRERGNDNhQmpOdXY4Y3Z2bGFubjZOa0k3UG1laDJER2o5UUIyRjU1LzVL?=
 =?utf-8?B?TlZwTGtMbU1jZG83dUlHcGNRdkZJdTFQc1VocHFHK3dsb3YzbHdwditQUUEx?=
 =?utf-8?B?MkIrSjlZVXlOZTBWTHNuaEFpc0p4aHpFNDM2SlhKYnlJM2ZRSXdTQXZ1d1hj?=
 =?utf-8?B?U2c4RFlaT0NaNnRvcStaUlI3VzhGV1Z3aFNKaDF4bjJOS2VidDdCL2NuL0dS?=
 =?utf-8?B?M09sVXBIZGhxb0tnbXVPcmQ0WnI1alU3Q2VuTE9QV2dHdFFjK1JmekRKSHRS?=
 =?utf-8?B?NFFTMnBWdkZaZTd0OER0a0pNeWNFSkZwZjJzbkNtdjBwMGx0RVd2UUVDczB4?=
 =?utf-8?B?ME9WU1ZTL2xsRXVsOG5ubzZ4QTNVUEc4TWQxZzRlVTBSUVNuaHdLYjdtVnBH?=
 =?utf-8?B?N3hVZW9IS0VpY2Z3YXlYU3Ava09kYkFLQmNDTFpDY0M3eGRrMHJwb05zaENa?=
 =?utf-8?B?eUhlWThpdkY0MitvTTNNdHRmVVVYYTVpR0dxOEJteG1kOStGako4R0MrSXNU?=
 =?utf-8?B?UnFOamg4RmU3a3MveWVCcUxuMkNVTE52dGJxaFdkRVdLbUlOWnBtN0Uza1Ez?=
 =?utf-8?B?VGpWbm1VZUVUU1lnUzJPT0hpbGcyTngwb0NDbkh5TGtuM2hNTkxqZ2YycXhN?=
 =?utf-8?B?ZGYwWUkvK2pCUjg4ano0WTV4WDFqNmIyNm1UeTZ6ZURTZGJFZWlKbEJNMWdR?=
 =?utf-8?B?SkE2ck9JVnFBemI1WlNHWXd5YU1pQ1dwV3VTRjM4RWJvVTYvOTJUY0xBUmlO?=
 =?utf-8?B?ditIRitFWHlCU0lSN2N0ajhVNkU1c1RpZXRYNVh4aXVTVUxheEZBbXNvVjdW?=
 =?utf-8?B?WWxtc0hNUDk4QmRrOUE1QVNkelp6S01MV2wxSS9OcmNLYjVnQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610409af-518d-4e13-d89c-08daee935517
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 20:36:18.1107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+0sQmjB106lp5RS6lXiQLA8d8iKldcQQUaduiYzrXBAdKZBbz33wY0KCin6yt6vx/AIHSWBUHiKH3wJxZLPYMhchSgwB9QhaodfiSEYx8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449

T24gMzAvMTIvMjAyMiAxOjAxIHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBUaGUgcGF0
Y2ggcHJvdmlkZXMgYSBtaW5pbWFsIGFtb3VudCBvZiBjaGFuZ2VzIHRvIHN0YXJ0DQo+IGJ1aWxk
IGFuZCBydW4gbWluaW1hbCBYZW4gYmluYXJ5IGF0IEdpdExhYiBDSSZDRCB0aGF0IHdpbGwNCj4g
YWxsb3cgY29udGludW91cyBjaGVja2luZyBvZiB0aGUgYnVpbGQgc3RhdHVzIG9mIFJJU0MtViBY
ZW4uDQo+DQo+IEV4Y2VwdCBpbnRyb2R1Y3Rpb24gb2YgbmV3IGZpbGVzIHRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyB3ZXJlIGRvbmU6DQo+ICogUmVkZWZpbml0aW9uIG9mIEFMSUdOIGRlZmluZSBmcm9t
ICcuYWxnaW4gMicgdG8gJy5hbGlnbiA0JyBhcw0KDQoiYWxpZ24iDQoNCj4gICBSSVNDLVYgaW1w
bGVtZW50YXRpb25zIChleGNlcHQgZm9yIHdpdGggQyBleHRlbnNpb24pIGVuZm9yY2UgMzItYml0
DQoNCldoaWxlIHRoZSBDIGV4dGVuc2lvbiBtaWdodCBtZWFuIHRoaW5ncyB0byBSSVNDLVYgZXhw
ZXJ0cywgaXQgaXMgYmV0dGVyDQp0byBzYXkgdGhlICJjb21wcmVzc2lvbiIgZXh0ZW5zaW9uIGhl
cmUgc28gaXQncyBjbGVhciB0byBub24tUklTQy1WDQpleHBlcnRzIHJlYWRpbmcgdGhlIGNvbW1p
dCBtZXNzYWdlIHRvby4NCg0KQnV0LCBkbyB3ZSBhY3R1YWxseSBjYXJlIGFib3V0IEM/DQoNCkVO
VFJZKCkgbmVlZHMgdG8gYmUgNCBieXRlIGFsaWduZWQgYmVjYXVzZSBvbmUgb2YgdGhlIGZldyB0
aGluZ3MgaXQgaXMNCmdvaW5nIHRvIGJlIHVzZWQgZm9yIGlzIHttLHN9dHZlYyB3aGljaCByZXF1
aXJlcyA0LWJ5dGUgYWxpZ25tZW50IGV2ZW4NCndpdGggYW4gSUFMSUdOIG9mIDIuDQoNCg0KSSdk
IGRyb3AgYWxsIHRhbGsgYWJvdXQgQyBhbmQganVzdCBzYXkgdGhhdCAyIHdhcyBhbiBpbmNvcnJl
Y3QgY2hvaWNlDQpwcmV2aW91c2x5Lg0KDQo+ICAgaW5zdHJ1Y3Rpb24gYWRkcmVzcyBhbGlnbm1l
bnQuICBXaXRoIEMgZXh0ZW5zaW9uLCAxNi1iaXQgYW5kIDMyLWJpdA0KPiAgIGFyZSBib3RoIGFs
bG93ZWQuDQo+ICogQUxMX09CSi15IGFuZCBBTExfTElCUy15IHdlcmUgdGVtcG9yYXJ5IG92ZXJ3
cml0dGVkIHRvIHByb2R1Y2UNCj4gICBhIG1pbmltYWwgaHlwZXJ2aXNvciBpbWFnZSBvdGhlcndp
c2UgaXQgd2lsbCBiZSByZXF1aXJlZCB0byBwdXNoDQo+ICAgaHVnZSBhbW91bnQgb2YgaGVhZGVy
cyBhbmQgc3R1YnMgZm9yIGNvbW1vbiwgZHJpdmVycywgbGlicyBldGMgd2hpY2gNCj4gICBhcmVu
J3QgbmVjZXNzYXJ5IGZvciBub3cuDQo+ICogU2VjdGlvbiBjaGFuZ2VkIGZyb20gLnRleHQgdG8g
LnRleHQuaGVhZGVyIGZvciBzdGFydCBmdW5jdGlvbg0KPiAgIHRvIG1ha2UgaXQgdGhlIGZpcnN0
IG9uZSBleGVjdXRlZC4NCj4gKiBSZXdvcmsgcmlzY3Y2NC9NYWtlZmlsZSBsb2dpYyB0byByZWJh
c2Ugb3ZlciBjaGFuZ2VzIHNpbmNlIHRoZSBmaXJzdA0KPiAgIFJJU0MtViBjb21taXQuDQo+DQo+
IFJJU0MtViBYZW4gY2FuIGJlIGJ1aWx0IGJ5IHRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25zOg0K
PiAgICQgQ09OVEFJTkVSPXJpc2N2NjQgLi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXpl
IFwNCj4gICAgICAgIG1ha2UgWEVOX1RBUkdFVF9BUkNIPXJpc2N2NjQgdGlueTY0X2RlZmNvbmZp
Zw0KDQpUaGlzIG5lZWRzIGEgYC1DIHhlbmAgaW4gdGhpcyBydW5lLg0KDQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9yaXNjdi9NYWtlZmlsZSBiL3hlbi9hcmNoL3Jpc2N2L01ha2VmaWxlDQo+IGlu
ZGV4IDk0MmU0ZmZiYzEuLjc0Mzg2YmViODUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3Jpc2N2
L01ha2VmaWxlDQo+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L01ha2VmaWxlDQo+IEBAIC0xLDIgKzEs
MTggQEANCj4gK29iai0kKENPTkZJR19SSVNDVl82NCkgKz0gcmlzY3Y2NC8NCj4gKw0KPiArJChU
QVJHRVQpOiAkKFRBUkdFVCktc3ltcw0KPiArCSQoT0JKQ09QWSkgLU8gYmluYXJ5IC1TICQ8ICRA
DQo+ICsNCj4gKyQoVEFSR0VUKS1zeW1zOiAkKG9ianRyZWUpL3ByZWxpbmsubyAkKG9iaikveGVu
Lmxkcw0KPiArCSQoTEQpICQoWEVOX0xERkxBR1MpIC1UICQob2JqKS94ZW4ubGRzIC1OICQ8ICQo
YnVpbGRfaWRfbGlua2VyKSAtbyAkQA0KPiArCSQoTk0pIC1wYSAtLWZvcm1hdD1zeXN2ICQoQEQp
LyQoQEYpIFwNCj4gKwkJfCAkKG9ianRyZWUpL3Rvb2xzL3N5bWJvbHMgLS1hbGwtc3ltYm9scyAt
LXhlbnN5bXMgLS1zeXN2IC0tc29ydCBcDQo+ICsJCT4kKEBEKS8kKEBGKS5tYXANCj4gKw0KPiAr
JChvYmopL3hlbi5sZHM6ICQoc3JjKS94ZW4ubGRzLlMgRk9SQ0UNCj4gKwkkKGNhbGwgaWZfY2hh
bmdlZF9kZXAsY3BwX2xkc19TKQ0KPiArDQo+ICtjbGVhbi1maWxlcyA6PSAkKG9ianRyZWUpLy54
ZW4tc3ltcy5bMC05XSoNCg0KV2UgZG9uJ3QgbmVlZCBjbGVhbi1maWxlcyBub3cgdGhhdCB0aGUg
bWFpbiBsaW5rIGhhcyBiZWVuIHNpbXBsaWZpZWQuDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NvbmZpZy5oIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y29uZmlnLmgNCj4gaW5kZXggZTJhZTIxZGU2MS4uZTEwZTEzYmE1MyAxMDA2NDQNCj4gLS0tIGEv
eGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29uZmlnLmgNCj4gKysrIGIveGVuL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY29uZmlnLmgNCj4gQEAgLTM2LDYgKzM5LDEwIEBADQo+ICAgIG5hbWU6
DQo+ICAjZW5kaWYNCj4gIA0KPiArI2RlZmluZSBYRU5fVklSVF9TVEFSVCAgX0FUKFVMLDB4MDAy
MDAwMDApDQoNClNwYWNlIGFmdGVyIHRoZSBjb21tYS4NCg0KT3RoZXJ3aXNlLCBMR1RNLg0KDQp+
QW5kcmV3DQo=

