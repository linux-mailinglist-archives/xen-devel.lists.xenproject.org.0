Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6652A2523
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 08:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17395.42197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZUCF-0000zt-G0; Mon, 02 Nov 2020 07:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17395.42197; Mon, 02 Nov 2020 07:24:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZUCF-0000zR-Bo; Mon, 02 Nov 2020 07:24:07 +0000
Received: by outflank-mailman (input) for mailman id 17395;
 Mon, 02 Nov 2020 07:24:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1ztG=EI=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kZUCD-0000zL-8Z
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 07:24:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72abb0b7-3622-4b38-b649-8f10208f4b52;
 Mon, 02 Nov 2020 07:24:01 +0000 (UTC)
Received: from AM6PR10CA0101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::42)
 by AM0PR08MB5010.eurprd08.prod.outlook.com (2603:10a6:208:15c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 07:23:58 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::32) by AM6PR10CA0101.outlook.office365.com
 (2603:10a6:209:8c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 07:23:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 07:23:57 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Mon, 02 Nov 2020 07:23:57 +0000
Received: from e84b342dbfc6.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ADD86BBA-9E3C-4E8F-8AF0-90183795CFF0.1; 
 Mon, 02 Nov 2020 07:23:52 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e84b342dbfc6.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Nov 2020 07:23:52 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB5491.eurprd08.prod.outlook.com (2603:10a6:208:189::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 07:23:48 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 07:23:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1ztG=EI=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
	id 1kZUCD-0000zL-8Z
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 07:24:05 +0000
X-Inumbo-ID: 72abb0b7-3622-4b38-b649-8f10208f4b52
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.47])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 72abb0b7-3622-4b38-b649-8f10208f4b52;
	Mon, 02 Nov 2020 07:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S2p8fLfA1cy8W9OIPNhLu4MpDe+iPaqmv4j2xsDyMI=;
 b=FjYQh2L1TMTfO+EW732YbbVHBeSJbJtVYvAu7Kqz0yeeiQKeAJwCMjAxfG+LAq1M1NJ5ph1jlLGldaqmFpWHN8zYBJoGYHZd0Rc6ySonz0N/pZw+QWz496lIVYhCv3uVutPj2JyzdIyPu7yjxam6Ho2wboHhbDQuXnXmk0hnCVk=
Received: from AM6PR10CA0101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::42)
 by AM0PR08MB5010.eurprd08.prod.outlook.com (2603:10a6:208:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 07:23:58 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::32) by AM6PR10CA0101.outlook.office365.com
 (2603:10a6:209:8c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 07:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 07:23:57 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Mon, 02 Nov 2020 07:23:57 +0000
X-CR-MTA-TID: 64aa7808
Received: from e84b342dbfc6.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ADD86BBA-9E3C-4E8F-8AF0-90183795CFF0.1;
	Mon, 02 Nov 2020 07:23:52 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e84b342dbfc6.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Nov 2020 07:23:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnzC5kP+Dc043b4hYo5X1kh2DfzSVFyo0UApvX3I7irsszf036vncFibu89XRivgNPB7va+IkcVOgfmGsXLZhs+qIwcwJ8ZI5EGyuFFhVAxMbSp4r6ZRt/PIOuMooCeGb2v1S3ohSuo/pY5KW4Ebif1kDc+1+UJ9aWLxa6ssQlT7PrgcJNj+9CjZEHXwX27l4thgK0kCy53dNVkmUNkjWtX+is42Y4OLa8hc+Vv96skRuCvrYUzMcPwGPKTi5XUIe9TKQgfyudFX2j0IDmc0uffJDUNmyS+N2O8fO3VTJapqLJELELgo7pA+Jsiyi3sEB19Z33VhXOuVaQy5aDN8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S2p8fLfA1cy8W9OIPNhLu4MpDe+iPaqmv4j2xsDyMI=;
 b=dY1Gx6fL3d3mVOY/LDMgl3MJcdl+VSFQMzuY63auYFXQkE82fb9bNjxu8MydYtfy/u+UUZfd4hxG++imJKyNCKZRFSXbm901HrV/9e2e7L9rqkHAStP7P3/72R6MrJYlrKXBsco9ttFgVNCk+UBT/e5W4+4b0ceB1BMlcoxloGEz89rgBkRmcLuGg08/l7v+aSCExc+cYWxs0zjCj9B3f2LjUClNkswuxBn+w0CtPN3Yqjc6MWgzd+sUfCWmqqbLDkqE3WZlnjer1+a8cUU+fDxNLqEnuHJ8+G4fjA9dYZxLVpsQDwF7tZgoz8Qu/KZXuquWrvUt0RPvV606WcS1BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S2p8fLfA1cy8W9OIPNhLu4MpDe+iPaqmv4j2xsDyMI=;
 b=FjYQh2L1TMTfO+EW732YbbVHBeSJbJtVYvAu7Kqz0yeeiQKeAJwCMjAxfG+LAq1M1NJ5ph1jlLGldaqmFpWHN8zYBJoGYHZd0Rc6ySonz0N/pZw+QWz496lIVYhCv3uVutPj2JyzdIyPu7yjxam6Ho2wboHhbDQuXnXmk0hnCVk=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB5491.eurprd08.prod.outlook.com (2603:10a6:208:189::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 07:23:48 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 07:23:48 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Masami Hiramatsu
	<masami.hiramatsu@linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <Julien.Grall@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Tim Deegan <tim@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Anthony
 PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
Thread-Topic: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
Thread-Index:
 AQHWoxKpQGDpryS/tEKvZ0gj7CwnMKmuR8kAgAC6SwCAABIuAIAAFmWAgADwXgCAAjNoAIACOnTQ
Date: Mon, 2 Nov 2020 07:23:48 +0000
Message-ID:
 <AM0PR08MB3747802302FE70971AE91F6F9E100@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
 <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
 <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
 <CAA93ih3Z-zxQ33gvr2C43i0J5XP3OBgUhTyMcwhe9zVj-uOONA@mail.gmail.com>
 <CAPD2p-=2UimQy6VHKw1FgyVi2R94Ux_HFdPYk7=FR3KWSEqiHw@mail.gmail.com>
In-Reply-To:
 <CAPD2p-=2UimQy6VHKw1FgyVi2R94Ux_HFdPYk7=FR3KWSEqiHw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2EB0BAA943FAB44D8909F91824950BB4.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b8c38b05-c8e1-4b9a-0a22-08d87f004355
x-ms-traffictypediagnostic: AM0PR08MB5491:|AM0PR08MB5010:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5010A81C3FDABE72AE340A569E100@AM0PR08MB5010.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h2cCwhfaEk5x+NMUgt+jrmRHOZn++lf3yXINSYlEJJ0WDZzfvua+oVSfuTvEkvbMJoZxydCR5PBTnbrhWAgdWcdSP3Y0kbyzlG/pHFtnXKkwSQ1yewtRFlFSGspaktAnVX3cG++Z04EGyIVXFoHg/j7Zoe08ao9VixWJhaSAem6XycY1dF/D2ic+LieWF34GGzA/D2BxCDIvbpGkCmmfrhezi4lijK7oBnDXumLdyc7JhtxJvuR3m6uuphRZOQdToC/+joBseVPBYgIdF4kya87DKNekmlOeO2aSzcgQSqmze9Vb3+at8RO9bVE2fPMAcalx91lue5Cgxt5oaG69TSDNmoQCR0b6HPQN0xNUPTvC4X/YJdE4kCLwNPTdagJBhUDnQJnia29MFiTEc/8YvA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(478600001)(7696005)(186003)(54906003)(110136005)(8676002)(5660300002)(52536014)(53546011)(6506007)(966005)(2906002)(316002)(86362001)(33656002)(66574015)(8936002)(9686003)(55016002)(4326008)(66446008)(26005)(76116006)(7416002)(64756008)(66556008)(66476007)(66946007)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 D5HDmN8LaLD6CLaQOiCn/A1MmkkubyI0A/0OUHDD5o9El7CuqlVEU2/utE/K3A0Eg0+olJBlTx8RZc7LWBZTGMsQOeepl0Ee5Ts2uNyf+FsAVKilMR2NDkS9n7mnwsqb5s0+p8H/N0ZJMcqLQBv0sJeZTmfMRJ3+WszCTUKWbfjA0upOYXOvy5lKCBUqEKtsJrQ1ozAPZvI17eqWhf1kN4v6+lli+bZzjWYtI9x72sf3RH0mpRiDpExWeZY4uMoIj99JSPXYFBACBpOxxWJaA5cN+JQInFNH5k64bAwLDqaIqmbDhiieUvWYVMzocdEggfYLR+ZvakCpj9ntp79yTXjFQB16SUAuiUxaCgcJ1TaNOQVEi0r1MKNX+4B/tZoQ9okIYA/XSpveOe6DXietNSvlcIL1TQYicy8VJaugSfs/Q0/530NnabqBXZViCHC2Yqx+yamdHS/NS6thNGOjGlC2RLU8ncR11nOPBKU3u4Z0CSepFOxnrF1vVzZNIaVcBjUktLnypVpMs+8mw2x13yYA8opbPeEGYUJ0ZoVzijLDbeTVDup8J1q4rjhPbjBeFXC4/v5/fnQD3rB6qE3Zd0n712IhYBQgyM7u5veU1CcsOYMFREC6RlbqTvoGikzJ+QC/8h+X6f85+GdNpS7tNw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5491
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6295b572-ed8d-4122-ed70-08d87f003de7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IItXo5UAHdOoXFpaiDEAQ/LcCsKrHQYWSEVlr3zoelKmLxw6SBgWJuRf/1r5m8wo9csLcuPXr170sXiGET6fCaxj7yXnw79AX1f0Us9vspAppiTTu3fvkgPe2PCHaTYzcL/XH09cJJSGQm2WJtg+nPWe/wuwkTEFu7h5rO8FEZoGx884aoVuH9RJW17U9H3I5fcohsCPoZAFdYn9l5TxIMZ7qXDG/9mFppcPaE6FHPSfAE2gR2fmcUGiK7MTx/3ntVfhGFNipxZvFgypy+25S/6Zq/sCcjcEB3ZN9wsZXPzA9Hkmiuomhcwg390AWxediSff3gFfju3QcdDvjqUybWgyQEzxFbmaTLD2xsfGROg8TuQu4edfiURW4Z1f+4Y3DPtU7Yn+ZFESVN0ygkx6sjYYOyWUhB61rFACKpEObGaB8s1sjSMECM/11Ilk7nB+LLulOC+6qmG7M77KT5ogX5RroVvEstZ1c7xqUy9fuew=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(478600001)(86362001)(966005)(82310400003)(47076004)(83380400001)(7696005)(70586007)(356005)(26005)(53546011)(81166007)(6506007)(82740400003)(52536014)(5660300002)(36906005)(316002)(54906003)(110136005)(4326008)(55016002)(9686003)(8936002)(8676002)(336012)(66574015)(2906002)(33656002)(186003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 07:23:57.7870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c38b05-c8e1-4b9a-0a22-08d87f004355
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5010

SGkgT2xla3NhbmRyLA0KDQpUaGFua3MgZm9yIHRoZSBzaGFyaW5nIG9mIHZpcnRpby1kaXNrIGJh
Y2tlbmQuIEkgaGF2ZSB0ZXN0ZWQgaXQgb24gYXJtIEZWUF9iYXNlIHBsYXRmb3JtLg0KV2UgdXNl
ZCBkb21haW4tMCB0byBydW4gdmlydGlvIGRpc2sgYmFja2VuZC4gVGhlIGJhY2tlbmQgZGlzayBp
cyBhIGxvb3AgZGV2aWNlLg0KICAgICJ2aXJ0aW9fZGlza3MiOiBbDQogICAgICAgIHsNCiAgICAg
ICAgICAgICJiYWNrZW5kX2RvbW5hbWUiOiAiRG9tYWluLTAiLA0KICAgICAgICAgICAgImRldmlk
IjogMCwNCiAgICAgICAgICAgICJkaXNrcyI6IFsNCiAgICAgICAgICAgICAgICB7DQogICAgICAg
ICAgICAgICAgICAgICJmaWxlbmFtZSI6ICIvZGV2L2xvb3AwIg0KICAgICAgICAgICAgICAgIH0N
CiAgICAgICAgICAgIF0NCiAgICAgICAgfQ0KICAgIF0sDQoNCkl0IHdvcmtzIGZpbmUgYW5kIEkn
dmUgcGFzdGVkIHNvbWUgbG9nczoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KRG9tYWluLTAgbG9nczoNCm1haW46IHJlYWQgYmFja2VuZCBkb21pZCAwDQoo
WEVOKSBnbnR0YWJfbWFya19kaXJ0eSBub3QgaW1wbGVtZW50ZWQgeWV0DQooWEVOKSBkb21haW5f
ZGlyZWN0X3BsMDExX2luaXQgZm9yIGRvbWFpbiMyDQptYWluOiByZWFkIGZyb250ZW5kIGRvbWlk
IDINCiAgSW5mbzogY29ubmVjdGVkIHRvIGRvbTINCg0KZGVtdV9zZXFfbmV4dDogPlhFTlNUT1JF
X0FUVEFDSEVEDQpkZW11X3NlcV9uZXh0OiBkb21pZCA9IDINCmRlbXVfc2VxX25leHQ6IGZpbGVu
YW1lWzBdID0gL2Rldi9sb29wMA0KZGVtdV9zZXFfbmV4dDogcmVhZG9ubHlbMF0gPSAwDQpkZW11
X3NlcV9uZXh0OiBiYXNlWzBdICAgICA9IDB4MjAwMDAwMA0KZGVtdV9zZXFfbmV4dDogaXJxWzBd
ICAgICAgPSAzMw0KZGVtdV9zZXFfbmV4dDogPlhFTkNUUkxfT1BFTg0KZGVtdV9zZXFfbmV4dDog
PlhFTkVWVENITl9PUEVODQpkZW11X3NlcV9uZXh0OiA+WEVORk9SRUlHTk1FTU9SWV9PUEVODQpk
ZW11X3NlcV9uZXh0OiA+WEVOREVWSUNFTU9ERUxfT1BFTg0KZGVtdV9pbml0aWFsaXplOiAyIHZD
UFUocykNCmRlbXVfc2VxX25leHQ6ID5TRVJWRVJfUkVHSVNURVJFRA0KZGVtdV9zZXFfbmV4dDog
aW9zZXJ2aWQgPSAwDQpkZW11X3NlcV9uZXh0OiA+UkVTT1VSQ0VfTUFQUEVEDQpkZW11X3NlcV9u
ZXh0OiBzaGFyZWRfaW9wYWdlID0gMHhmZmZmYWU2ZGUwMDANCmRlbXVfc2VxX25leHQ6IGJ1ZmZl
cmVkX2lvcGFnZSA9IDB4ZmZmZmFlNmRkMDAwDQpkZW11X3NlcV9uZXh0OiA+U0VSVkVSX0VOQUJM
RUQNCmRlbXVfc2VxX25leHQ6ID5QT1JUX0FSUkFZX0FMTE9DQVRFRA0KZGVtdV9zZXFfbmV4dDog
PkVWVENITl9QT1JUU19CT1VORA0KZGVtdV9zZXFfbmV4dDogVkNQVTA6IDMgLT4gNw0KZGVtdV9z
ZXFfbmV4dDogVkNQVTE6IDUgLT4gOA0KZGVtdV9zZXFfbmV4dDogPkVWVENITl9CVUZfUE9SVF9C
T1VORA0KZGVtdV9zZXFfbmV4dDogMCAtPiA5DQpkZW11X3JlZ2lzdGVyX21lbW9yeV9zcGFjZTog
MjAwMDAwMCAtIDIwMDAxZmYNCiAgSW5mbzogKHZpcnRpby9tbWlvLmMpIHZpcnRpb19tbWlvX2lu
aXQ6MjkwOiBtYWlsdG86dmlydGlvLW1taW8uZGV2aWNlcz0weDIwMEAweDIwMDAwMDA6MzMNCmRl
bXVfc2VxX25leHQ6ID5ERVZJQ0VfSU5JVElBTElaRUQNCmRlbXVfc2VxX25leHQ6ID5JTklUSUFM
SVpFRA0KSU8gcmVxdWVzdCBub3QgcmVhZHkNCklPIHJlcXVlc3Qgbm90IHJlYWR5DQoNCi0tLS0t
LS0tLS0tLS0tLS0NCkRvbS1VIGxvZ3M6DQpbICAgIDAuNDkxMDM3XSB4ZW46eGVuX2V2dGNobjog
RXZlbnQtY2hhbm5lbCBkZXZpY2UgaW5zdGFsbGVkDQpbICAgIDAuNDkzNjAwXSBJbml0aWFsaXNp
bmcgWGVuIHB2Y2FsbHMgZnJvbnRlbmQgZHJpdmVyDQpbICAgIDAuNTE2ODA3XSBTZXJpYWw6IDgy
NTAvMTY1NTAgZHJpdmVyLCA0IHBvcnRzLCBJUlEgc2hhcmluZyBkaXNhYmxlZA0KWyAgICAwLjUy
NTU2NV0gY2FjaGVpbmZvOiBVbmFibGUgdG8gZGV0ZWN0IGNhY2hlIGhpZXJhcmNoeSBmb3IgQ1BV
IDANClsgICAgMC41NjIyNzVdIGJyZDogbW9kdWxlIGxvYWRlZA0KWyAgICAwLjU5NTMwMF0gbG9v
cDogbW9kdWxlIGxvYWRlZA0KWyAgICAwLjY4MzgwMF0gdmlydGlvX2JsayB2aXJ0aW8wOiBbdmRh
XSAxMzEwNzIgNTEyLWJ5dGUgbG9naWNhbCBibG9ja3MgKDY3LjEgTUIvNjQuMCBNaUIpDQpbICAg
IDAuNjg0MDAwXSB2ZGE6IGRldGVjdGVkIGNhcGFjaXR5IGNoYW5nZSBmcm9tIDAgdG8gNjcxMDg4
NjQNCg0KDQovICMgZGQgaWY9L2Rldi92ZGEgb2Y9L2Rldi9udWxsIGJzPTFNIGNvdW50PTY0DQo2
NCswIHJlY29yZHMgaW4NCjY0KzAgcmVjb3JkcyBvdXQNCjY3MTA4ODY0IGJ5dGVzICg2NC4wTUIp
IGNvcGllZCwgMy4xOTYyNDIgc2Vjb25kcywgMjAuME1CL3MNCi8gIyBkZCBpZj0vZGV2L3plcm8g
b2Y9L2Rldi92ZGEgYnM9MU0gY291bnQ9NjQNCjY0KzAgcmVjb3JkcyBpbg0KNjQrMCByZWNvcmRz
IG91dA0KNjcxMDg4NjQgYnl0ZXMgKDY0LjBNQikgY29waWVkLCAzLjcwNDU5NCBzZWNvbmRzLCAx
Ny4zTUIvcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNClRoZSByZWFkL3dyaXRlIHNlZW1zIE9L
IGluIGRvbS1VLiBUaGUgRlZQIHBsYXRmb3JtIGlzIGEgZW11bGF0b3IsIHNvIHRoZSBwZXJmb3Jt
YW5jZSBpcyBubyByZWZlcmVuY2UuDQpXZSB3aWxsIHRlc3QgaXQgb24gcmVhbCBoYXJkd2FyZSBs
aWtlIE4xU0RQLg0KDQpUaGFua3MsDQpXZWkgQ2hlbg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQpGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qu
b3JnPiBPbiBCZWhhbGYgT2YgT2xla3NhbmRyIFR5c2hjaGVua28NClNlbnQ6IDIwMjDlubQxMeac
iDHml6UgNToxMQ0KVG86IE1hc2FtaSBIaXJhbWF0c3UgPG1hc2FtaS5oaXJhbWF0c3VAbGluYXJv
Lm9yZz47IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCkNjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWwgPHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJf
dHlzaGNoZW5rb0BlcGFtLmNvbT47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IEp1bGllbiBHcmFsbCA8SnVsaWVuLkdyYWxsQGFybS5jb20+OyBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8aXdq
QHhlbnByb2plY3Qub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFRpbSBEZWVn
YW4gPHRpbUB4ZW4ub3JnPjsgRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+
OyBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBKdW4gTmFr
YWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KU3ViamVjdDogUmU6IFtQ
QVRDSCBWMiAwMC8yM10gSU9SRVEgZmVhdHVyZSAoKyB2aXJ0aW8tbW1pbykgb24gQXJtDQoNCg0K
DQpPbiBGcmksIE9jdCAzMCwgMjAyMCBhdCAxOjM0IFBNIE1hc2FtaSBIaXJhbWF0c3UgPG1haWx0
bzptYXNhbWkuaGlyYW1hdHN1QGxpbmFyby5vcmc+IHdyb3RlOg0KSGkgT2xla3NhbmRyLA0KwqAN
CkhpIE1hc2FtaSwgYWxsDQoNCltzb3JyeSBmb3IgdGhlIHBvc3NpYmxlIGZvcm1hdCBpc3N1ZV0N
CsKgDQo+PiA+DQo+PiA+wqAgwqAgwqAgwqBDb3VsZCB5b3UgdGVsbCBtZSBob3cgY2FuIEkgdGVz
dCBpdD8NCj4+ID4NCj4+ID4NCj4+ID4gSSBhc3N1bWUgaXQgaXMgZHVlIHRvIHRoZSBsYWNrIG9m
IHRoZSB2aXJ0aW8tZGlzayBiYWNrZW5kICh3aGljaCBJIGhhdmVuJ3Qgc2hhcmVkIHlldCBhcyBJ
IGZvY3VzZWQgb24gdGhlIElPUkVRL0RNIHN1cHBvcnQgb24gQXJtIGluIHRoZQ0KPj4gPiBmaXJz
dCBwbGFjZSkuDQo+PiA+IENvdWxkIHlvdSB3YWl0IGEgbGl0dGxlIGJpdCwgSSBhbSBnb2luZyB0
byBzaGFyZSBpdCBzb29uLg0KPj4NCj4+IERvIHlvdSBoYXZlIGEgcXVpY2stYW5kLWRpcnR5IGhh
Y2sgeW91IGNhbiBzaGFyZSBpbiB0aGUgbWVhbnRpbWU/IEV2ZW4NCj4+IGp1c3Qgb24gZ2l0aHVi
IGFzIGEgc3BlY2lhbCBicmFuY2g/IEl0IHdvdWxkIGJlIHZlcnkgdXNlZnVsIHRvIGJlIGFibGUN
Cj4+IHRvIGhhdmUgYSB0ZXN0LWRyaXZlciBmb3IgdGhlIG5ldyBmZWF0dXJlLg0KPg0KPiBXZWxs
LCBJIHdpbGwgcHJvdmlkZSBhIGJyYW5jaCBvbiBnaXRodWIgd2l0aCBvdXIgUG9DIHZpcnRpby1k
aXNrIGJhY2tlbmQgYnkgdGhlIGVuZCBvZiB0aGlzIHdlZWsuIEl0IHdpbGwgYmUgcG9zc2libGUg
dG8gdGVzdCB0aGlzIHNlcmllcyB3aXRoIGl0Lg0KDQpHcmVhdCEgT0sgSSdsbCBiZSB3YWl0aW5n
IGZvciB0aGUgUG9DIGJhY2tlbmQuDQoNClRoYW5rIHlvdSENCg0KWW91IGNhbiBmaW5kIHRoZSB2
aXJ0aW8tZGlzayBiYWNrZW5kIFBvQyAoc2hhcmVkIGFzIGlzKSBhdCBbMV0uwqANCkJyaWVmIGRl
c2NyaXB0aW9uLi4uDQoNClRoZSB2aXJ0aW8tZGlzayBiYWNrZW5kIFBvQyBpcyBhIGNvbXBsZXRl
bHkgc3RhbmRhbG9uZSBlbnRpdHkgKElPUkVRIHNlcnZlcikgd2hpY2ggZW11bGF0ZXMgYSB2aXJ0
aW8tbW1pbyBkaXNrIGRldmljZS4NCkl0IGlzIGJhc2VkIG9uIGNvZGUgZnJvbSBERU1VIFsyXSAo
Zm9yIElPUkVRIHNlcnZlciBwdXJwb3NlcykgYW5kIHNvbWUgY29kZSBmcm9tIGt2bXRvb2wgWzNd
IHRvIGltcGxlbWVudCB2aXJ0aW8gcHJvdG9jb2wsDQpkaXNrIG9wZXJhdGlvbnMgb3ZlciB1bmRl
cmx5aW5nIEgvVyBhbmQgWGVuYnVzIGNvZGUgdG8gYmUgYWJsZSB0byByZWFkIGNvbmZpZ3VyYXRp
b24gZnJvbSB0aGUgWGVuc3RvcmUNCihpdCBpcyBjb25maWd1cmVkIHZpYSBkb21haW4gY29uZmln
IGZpbGUpLiBMYXN0IHBhdGNoIGluIHRoaXMgc2VyaWVzIChtYXJrZWQgYXMgUkZDKSBhY3R1YWxs
eSBhZGRzIHJlcXVpcmVkIGJpdHMgdG8gdGhlIGxpYnhsIGNvZGUuwqAgwqANCg0KU29tZSBub3Rl
cy4uLg0KDQpCYWNrZW5kIGNvdWxkIGJlIHVzZWQgd2l0aCBjdXJyZW50IFYyIElPUkVRIHNlcmll
cyBbNF0gd2l0aG91dCBhbnkgbW9kaWZpY2F0aW9ucywgYWxsIHdoYXQgeW91IG5lZWQgaXMgdG8g
ZW5hYmxlDQpDT05GSUdfSU9SRVFfU0VSVkVSIG9uIEFybSBbNV0sIHNpbmNlIGl0IGlzIGRpc2Fi
bGVkIGJ5IGRlZmF1bHQgd2l0aGluIHRoaXMgc2VyaWVzLg0KDQpQbGVhc2Ugbm90ZSB0aGF0IGlu
IG91ciBzeXN0ZW0gd2UgcnVuIGJhY2tlbmQgaW4gRG9tRCAoZHJpdmVyIGRvbWFpbikuIEkgaGF2
ZW4ndCB0ZXN0ZWQgaXQgaW4gRG9tMCwNCnNpbmNlIGluIG91ciBzeXN0ZW0gdGhlIERvbTAgaXMg
dGhpbiAod2l0aG91dCBhbnkgSC9XKSBhbmQgb25seSB1c2VkIHRvIGxhdW5jaCBWTXMsIHNvIHRo
ZXJlIGlzIG5vIHVuZGVybHlpbmcgYmxvY2sgSC9XLiANCkJ1dCwgSSBob3BlLCBpdCBpcyBwb3Nz
aWJsZSB0byBydW4gaXQgaW4gRG9tMCBhcyB3ZWxsIChhdCBsZWFzdCB0aGVyZSBpcyBub3RoaW5n
IHNwZWNpZmljIHRvIGEgcGFydGljdWxhciBkb21haW4gaW4gdGhlIGJhY2tlbmQgaXRzZWxmLCBu
b3RoaW5nIGhhcmRjb2RlZCkuDQpJZiB5b3UgYXJlIGdvaW5nIHRvIHJ1biBhIGJhY2tlbmQgaW4g
b3RoZXIgdGhhbiBEb20wIGRvbWFpbiB5b3UgbmVlZCB0byB3cml0ZSB5b3VyIG93biBwb2xpY3kg
KEZMQVNLKSBmb3IgdGhlIGJhY2tlbmQgKHJ1bm5pbmcgaW4gdGhhdMKgZG9tYWluKQ0KdG8gYmUg
YWJsZSB0byBpc3N1ZSBETSByZWxhdGVkIHJlcXVlc3RzLCBldGMuIE9ubHkgZm9yIHRlc3QgcHVy
cG9zZXMgeW91IGNvdWxkIHVzZSB0aGlzIHBhdGNoIFs2XSB0aGF0IHR3ZWVrcyBYZW4gZHVtbXkg
cG9saWN5IChub3QgZm9yIHVwc3RyZWFtKS4NCsKgwqANCkFzIEkgbWVudGlvbmVkIGVsc2V3aGVy
ZSB5b3UgZG9uJ3QgbmVlZCB0byBtb2RpZnkgR3Vlc3QgTGludXggKERvbVUpLCBqdXN0IGVuYWJs
ZSBWaXJ0SU8gcmVsYXRlZCBjb25maWdzLg0KSWYgSSByZW1lbWJlciBjb3JyZWN0bHksIHRoZSBm
b2xsb3dpbmcgd291bGQgYmUgZW5vdWdoOg0KQ09ORklHX0JMS19NUV9WSVJUSU89eQ0KQ09ORklH
X1ZJUlRJT19CTEs9eQ0KQ09ORklHX1ZJUlRJTz15DQpDT05GSUdfVklSVElPX0JBTExPT049eQ0K
Q09ORklHX1ZJUlRJT19NTUlPPXkNCklmIEkgcmVtZW1iZXIgY29ycmVjdGx5LCBpZiB5b3VyIEhv
c3QgTGludXggKERvbTAgb3IgRG9tRCkgdmVyc2lvbiA+PSA0LjE3IHlvdSBkb24ndCBuZWVkIHRv
IG1vZGlmeSBpdCBhcyB3ZWxsLg0KT3RoZXJ3aXNlLCB5b3UgbmVlZCB0byBjaGVycnktcGljayAi
eGVuL3ByaXZjbWQ6IGFkZCBJT0NUTF9QUklWQ01EX01NQVBfUkVTT1VSQ0UiIGZyb20gdGhlIHVw
c3RyZWFtIHRvIGJlIGFibGUNCnRvIHVzZSB0aGUgYWNxdWlyZSBpbnRlcmZhY2UgZm9yIHRoZSBy
ZXNvdXJjZSBtYXBwaW5nLg0KDQoNCldlIHVzdWFsbHkgYnVpbGQgYSBiYWNrZW5kIGluIHRoZSBj
b250ZXh0IG9mIHRoZSBZb2N0byBidWlsZCBwcm9jZXNzIGFuZCBydW4gaXQgYXMgYSBzeXN0ZW1k
IHNlcnZpY2UsDQpidXQgeW91IGNhbiBhbHNvIGJ1aWxkIGFuZCBydW4gaXQgbWFudWFsbHkgKGl0
IHNob3VsZCBiZSBsYXVuY2hlZCBiZWZvcmUgRG9tVSBjcmVhdGlvbikuDQoNClRoZXJlIGFyZSBu
byBjb21tYW5kIGxpbmUgb3B0aW9ucyBhdCBhbGwuIEV2ZXJ5dGhpbmcgaXMgY29uZmlndXJlZCB2
aWEgZG9tYWluIGNvbmZpZ3VyYXRpb24gZmlsZToNCiMgVGhpcyBvcHRpb24gaXMgbWFuZGF0b3J5
LCBpdCBzaG93cyB0aGF0IFZpcnRJTyBpcyBnb2luZyB0byBiZSB1c2VkIGJ5IGd1ZXN0DQp2aXJ0
aW89MQ0KIyBFeGFtcGxlIG9mIGRvbWFpbiBjb25maWd1cmF0aW9uICh0d28gZGlza3MgYXJlIGFz
c2lnbmVkIHRvIHRoZSBndWVzdCwgdGhlIGxhdHRlciBpcyBpbiByZWFkb25seSBtb2RlKToNCnZk
aXNrID0gWyAnYmFja2VuZD1Eb21ELCBkaXNrcz1ydzovZGV2L21tY2JsazBwMztybzovZGV2L21t
Y2JsazFwMycgXQ0KDQpIb3BlIHRoYXQgaGVscHMuIEZlZWwgZnJlZSB0byBhc2sgcXVlc3Rpb25z
IGlmIGFueS4NCg0KWzFdwqBodHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy92aXJ0aW8tZGlz
ay9jb21taXRzL2lvcmVxX3YzDQpbMl0gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PXBlb3BsZS9wYXVsZHUvZGVtdS5naXQ7YT1zdW1tYXJ5DQpbM10gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lsbC9rdm10b29sLmdpdC8NCls0XSBodHRw
czovL2dpdGh1Yi5jb20vb3R5c2hjaGVua28xL3hlbi9jb21taXRzL2lvcmVxXzQuMTRfbWwzDQpb
NV3CoGh0dHBzOi8vZ2l0aHViLmNvbS9vdHlzaGNoZW5rbzEveGVuL2NvbW1pdC9lZTIyMTEwMjE5
M2YwNDIyYTI0MDgzMmVkYzQxZDczZjZmM2RhOTIzDQpbNl3CoGh0dHBzOi8vZ2l0aHViLmNvbS9v
dHlzaGNoZW5rbzEveGVuL2NvbW1pdC9iZTg2OGE2MzAxNGI3YWE2Yzk3MzFkNTY5MjIwMGQ3ZjJm
NTdjNjExDQoNCi0tIA0KUmVnYXJkcywNCg0KT2xla3NhbmRyIFR5c2hjaGVua28NCg==

