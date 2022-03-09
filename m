Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7E4D2F10
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 13:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287793.488005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvSk-0003WR-RM; Wed, 09 Mar 2022 12:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287793.488005; Wed, 09 Mar 2022 12:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvSk-0003TI-N7; Wed, 09 Mar 2022 12:30:42 +0000
Received: by outflank-mailman (input) for mailman id 287793;
 Wed, 09 Mar 2022 12:30:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRvSi-00039g-JK
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:30:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b989fbf1-9fa4-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:30:39 +0100 (CET)
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
X-Inumbo-ID: b989fbf1-9fa4-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646829039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vpZWRX4Vwa+gsM2ifVy160bm35BDOYv4eSobTOLsP8U=;
  b=f3nGzjo/WzrVWpS8Gx5BFVxL8wWQyBL5UnTOBr5oLaWkRsazJucX9vOz
   33lANU7LC6EY9se+h3j+uoNkQwIIqcu7cmZ7bQaLwyUsYTSdsSekKbOax
   q1c2Ln52kjCkg3sBSnKD7ywdcDXU+WyQGGxaPjAjHPTPxh7shqc/dc1M1
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68162922
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rwXmzqjjSkjHXWgEMdDsGpXbX1614RAKZh0ujC45NGQN5FlHY01je
 htvW2+EOPzeYzahKI13bYvgoE1V6p7SyN5jQQRuqHxkEHgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvc4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQQkJLTlhuYCbzlZMj9xZPx7w5r3Hmfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiOP
 pRDOGA1BPjGS0AVJ003MIISpeH2u2n/ayMGmFSRlINitgA/yyQuieOwYbI5YOeiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sfQmQvrVYRUE6e3ntZoj0eawmg7ARgfR1y95/K+jyaWZdVbL
 EAF/zs0moI7/kerU9rVUgWxpTiPuRt0c9haHvA+6QqN4rHJ+AvfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOKyoitz4Hxngz
 jbMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEqm4xlgTZCneLCI6HnF4q8REb28fmae6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBP
 ReL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9z21+KTPuftmU
 Xt+TSpKJSxEYUiA5GDqL9rxKZdxmkgDKZr7HPgXNSiP37uEf2KyQrwYKlaIZe1RxPra/FuKr
 YoFZ5fWl0s3vAjCjs//q957wbcidyRTOHwLg5YPKr7rzvROQwnN9MM9MZt+Itc4zsy5Z8/D/
 22nW18w9bYMrSavFOl+UVg6MOmHdc8m9RoTZHVwVX71iylLSdv+t883KspoFYTLAcQ+lJaYu
 dFeIJ7eahmOIxyakwkggW7V99UzKk702VrQY0JIolEXJvZdeuAAwfe9FiPH/ygSFCun88w4p
 ryrzATARpQfAQ9lCa7rhDiHljtdYVB1dDpOYnb1
IronPort-HdrOrdr: A9a23:Hhu2GK/Wql77SkLLbStuk+E8db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc69qBTnhOFICOgqTMuftWzd2VdAQ7sSlLcKrweQfhEWs9Qtr5
 uIEJIOeOEYb2IK9foSiTPQe71LrajlgcKVbKXlvgpQpGlRGtBdBmxCe2Cm+yNNNW177c1TLu
 vj2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W3Dk1ZrsA8ciYoV9MJOA54e7rNNoXse2OEDIvAGyWuKEk4U0i936Ifpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="68162922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V59PGV6k7gOSgG1VMNV1lmwnIm7jyKh1M22cgkpKvzU5PiIQYK6sE4MpF8Ohw5PJxXCfdUsxmwMYmQyctovxc2GT71Y1cGs8qZKVCdLu09UAnak/+StVttd5ITd4APvP3WXQS9OZTDVXBp0AWnDibnVKs1hZyomuSnPnXsm7mwMz/gtgke0fMniEw8gE9KdQPEX1+SPDa8lonIPMTv84GfZpzOeXp3f4/nrGwfpqFl45UvtAE9s4fMDGN8Z6uMAaO5vgT0Vu9ZyeUgWCK9fUG1T8ISDXiIAVYAxqsl3m+u0Bp6nkttQ1tkSFzVc9PqwnGgEY2jqBSGrth1NabxFqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuSbsghuNb3YWyNl9xxHsiwvDb+ewABgs4/F+WArUBg=;
 b=iNUMATBLPCuEHesSEFX0BL4QRSv6B349hn6Ri4cbLRBVyiqVTeq5Anl15FvXD9mdYzPcQk093EqAypYsTGeEC94kg0bz+k/aQElX4AYGIdAH/JdghSpsAOiwkvCgaE4to8kt6GEzDwJ1/sKTdtzZ+yCqf1OBWsvsVVWcsir71e6qBLs9vjl5fRRRVD/JxArmlWeoKAUo0UgjRd0XaRViqigtpKsPfhtHkn/U/Zn9gW56embIiABV9TWapA4seh55apOlD78yrn+h8Xl7fCFLuscEXriTdRvpsi3gs8J/wxg+KWG5H9dduFAKsj50p3klmA2y88VUiE7AEJOUD6vdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuSbsghuNb3YWyNl9xxHsiwvDb+ewABgs4/F+WArUBg=;
 b=ViI2bgUo5UzelbtN2TfxJ2yOc1iU3nPeQMSTt7OC00Ij7AAMmkPewTxSSK/U65swsQlRwGTCZO7bpFXCbdHxTIrS76SMISn2RJFk5w8bU2DqTjd70U6k9m9ccVAg+/iNDxlzAIhiA4umIMUdg2r7DpOhZc6rLwbg+3lf73xZJ2M=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 2/2] livepatch: set -f{function,data}-sections compiler option
Date: Wed,  9 Mar 2022 13:28:46 +0100
Message-ID: <20220309122846.89696-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220309122846.89696-1-roger.pau@citrix.com>
References: <20220309122846.89696-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5a89d11-db37-493f-be11-08da01c89aba
X-MS-TrafficTypeDiagnostic: BYAPR03MB4359:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB43590EF97F2B524D12919DD58F0A9@BYAPR03MB4359.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtyRz2w9IA+CtcaLqjCLLPe3OLYIY8FF/GD7bGtHwYK1aUyyg6e2IP1OJEHP6aTi7qY/wWiqU2d3r8fknJY4DLi8yUnXRzpAF6OvoNDxw/JLjqL5LwVUFM4/JuABdj/jKx0pNfkVUe5M5gxEUxD/gY6ADqJNlYrWhwpzT5wRWJgBuFwmyZE0Elpdg9KNAiBDr3+E20XdTFtwqWFDkPnjFSzSOzjeZBPikbI30x7nMdvtUadsVhKLl/P1vnfBcb1SFntLeC/qcqIXHJQfYDt/mMKO4O3b9Fzh2OeuulwKT5ctT81TorxP5SrAPuFd9s3IkxrHzvPHus0+XxzydkmfklZqeTg9bJ2ErQee20zOOFdq8gD19plPX6r/WdEP1CqTZittE2FSUGU0nQKX1Lstn6owRDQ5/1L8IrYDugtLGlJow3Kt5l2+i7PEcK/LW/IDXEOl7pho2jBAXQ/YlQE3WKj46g+xgKp/iYEEfa8SVKP6Ny3Hc4YK8UQUHFORB/HVWpe/wZLZbxV1RoBPXnUUSeDD/qhrLjFhIJVNFq8xPtf4d4pMruizFzDHLbOSSKViWDlFH0cbtIyzW/EFF/vNJqkVmrIB1Rqj1DHh6TqslmnKc1QmVSUYov/ex9ZEX9G+hb4Fer5QbrDbUqqImY3Gqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(66556008)(4326008)(66946007)(1076003)(8676002)(6666004)(86362001)(83380400001)(2906002)(38100700002)(66476007)(82960400001)(5660300002)(8936002)(6486002)(6916009)(6506007)(36756003)(54906003)(508600001)(2616005)(316002)(6512007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHpwTzQ1NDJnblUwV3NzZFg5L2ZoYW1obFBmSDBGRmJZYlJzR3JISktJY3Z6?=
 =?utf-8?B?ME8yVlNQeGtlYXJlakZFQVVJZlQrMWlRUlY2d01NeUZza2phUWRGcFBOZUYy?=
 =?utf-8?B?UFgwa2FNRXJpZzJ2L0w4L1BlQU5rVXdBMWVldmVRVjYrRUI2cWkxOE9seHVl?=
 =?utf-8?B?MWQ2RWVNcTlKeUhoT3BkSUJKcVZaK2NNajduZXZlcUQ4NEdpaVNvOFFUZ3BL?=
 =?utf-8?B?MDc5Q2lkWU9sYXBLYWRrZXR3NUVrK3pScnJOUUI4aEV6T2grZU1STzdhamxq?=
 =?utf-8?B?S1FvSUxYWGJpWE9MdlR1Z0lCU1N0aWtkb3E4MFFvZ1ZORHZiT042bzNSckVu?=
 =?utf-8?B?YWJJVERCbFZJZGtUeERTT0IxSUhlR1d0Y3hJZm1vbnFla00yc2tHQVBCNGN2?=
 =?utf-8?B?V3Rva2drRzR0R3lZOERQc3ZhVTRKYzc5V0dBSlI0Y2tieGFWQnJGSGx3Z0h3?=
 =?utf-8?B?ZVFERzExRG50TWtKN3Z5R3ltZWVseHY3cUF1aTZPeUsweC8wR1pYbVJ0NkIx?=
 =?utf-8?B?VVpuNzZRZzl3ZXhiZitPb3pzcVorVkRKbFhLd0NhV05WSVQyNlFETDR4MFlQ?=
 =?utf-8?B?cWtDZkNRZ1NkbzUrcFQ5Uit6bnNkcDVtL2NsT3VaZlZibDhNSE9RK1NiVE9T?=
 =?utf-8?B?SzcxaU5ucGFpOGF6ZzhUTi9FTTlJZ1E5R2JFWjJWU2FtRGNYaWRKMyt0SDhR?=
 =?utf-8?B?eHZqb2l1VGZSWEw5K0t4NHpHMkdJeDE4WjNrWlY2dG1YelkvS0hmNzdCTDRl?=
 =?utf-8?B?RVpwUlYybGplZDkrZTFQMU9kSjZqY1BYb1FuTXVQYmgyQVpCekFzVzJMemty?=
 =?utf-8?B?dEZHZmh3RzhyeVp5anhUNWJlQTNubWV3VWxrY1FLVmpvQjZKRjUxbjR0dUs3?=
 =?utf-8?B?WlByN25LOThlUFRZOXp2bDdkUENoVml0a1JGZS9DZ2tqN3VoSXFORmFxalF2?=
 =?utf-8?B?RkpQV0JiNUxtZ2xaZEJFanU4SGh0S0owUzVtODU2L2JZd2N1MU8vNmREUWt1?=
 =?utf-8?B?MmJyVmIyTGR5L0xxbHNhamN0OUswYTEzeEVSd0NFdHpiNGEvZDcybGRJcnJ1?=
 =?utf-8?B?cFhVMGdicUltMWMxRXhuVzFoY2JiVXZnV29LWTFUSWNMQVVXM2Y2d2NUNCta?=
 =?utf-8?B?Ry93RHl1ZHYxTlIvcW54NDV0cWh6SzNEMUlKNENXMDd3RzFsdmZKdjdQYjNi?=
 =?utf-8?B?MHZ5YjRyRmNWa0ZyS1FtRUJhOHJPWU0yOEc0REZldzZZQy9BdUpqUHp6a25q?=
 =?utf-8?B?ckgzbTVzd25RVXp1cjliYlErbGNHS21lVW82cjJIOE02VWhVcUZjMzFOQSt0?=
 =?utf-8?B?bTY4OEhzM0VTeVB1dHIvOUlWYlNVeEhSSkFibE9GYm9qM01pN3lsK1QyZDJr?=
 =?utf-8?B?cStnOC85TERVTDh6S2xyRGZ5WW5yY2toVnBRNENXdnlCbnBSMDltbXNiZngx?=
 =?utf-8?B?RHlZVDYrak9GMUZGUjZzTHY2QlBtb1F5Yml3QW44UlpSdGhneFJiK0dQMGhw?=
 =?utf-8?B?dU1MdXc0andtQ2d0QXlYOGVxbzJMUG81TEVMSnNLc1phbWxoVy94NXFEUGVx?=
 =?utf-8?B?Um9JVzQ4dXlmUndPbXlBQWQ0eithZ1dWeWdpeVR6eDNjTmNRdmNuQ2NkbGlY?=
 =?utf-8?B?QmEycWpjdWo5OFlYRWJ1L05KbzJiVi92NVVOd1RNZmxva3FRamw1Smxtc0R3?=
 =?utf-8?B?S2FzRGVXNjFrc0FMZnFMTW9zd3RyZ2ZGak50bEVVNHFiN2tuakVLd216dENy?=
 =?utf-8?B?K0xYdDBPWHluNDlJb0phbDdZVjVOQlBzYkp3VzNiS0lsdDltSmR5Zm9keFAz?=
 =?utf-8?B?bmFxN1ZsK0Q5dklKeTVnOW9rVEh5STd5aEFqSTFaNkVUU21QMVdvVGNxMmpm?=
 =?utf-8?B?K2dlRER4KzNydnpaTXgza0pQNkZjUHo4eVoxWmtCOEVvS3JjbTNiS1JXVVpE?=
 =?utf-8?B?R2Z2aFBrUWlSZzh3aitzamZ0ODZwOWtRNWhWbFduekJHN2haRHAxbmQ3Z0hX?=
 =?utf-8?B?MGp5UWtPZis2SlBHeGRBREcvcnR3NithTFRHVlJldzVOcEdiMUJFbDhyakxG?=
 =?utf-8?B?YTQyTUxpSGU1UlNKQ2JNOUNScEtlVXBYMHpyT3ArakNKVjVhNFd3UGVUa1JG?=
 =?utf-8?B?TWlFcTh4NmxCdUlOQ0pnc29hcWlnY3U2ZFJPTmQ5dzM2TXlpVS9jVXBXWUhI?=
 =?utf-8?Q?ZJ1XZH+jIWa8D4W2LvCt8eA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a89d11-db37-493f-be11-08da01c89aba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 12:30:32.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5gerJdVjPo/Rqd8NPfXul54Zyu8/jC8XJxBMZvYFJ6gETCGfbsXsYrWIqB/FKGhwoyjjWRol9XC8MGQ3gL1SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4359
X-OriginatorOrg: citrix.com

If livepatching support is enabled build the hypervisor with
-f{function,data}-sections compiler options, which is required by the
livepatching tools to detect changes and create livepatches.

This shouldn't result in any functional change on the hypervisor
binary image, but does however require some changes in the linker
script in order to handle that each function and data item will now be
placed into its own section in object files. As a result add catch-all
for .text, .data and .bss in order to merge each individual item
section into the final image.

The main difference will be that .text.startup will end up being part
of .text rather than .init, and thus won't be freed. .text.exit will
also be part of .text rather than dropped. Overall this could make the
image bigger, and package some .text code in a sub-optimal way.

On Arm the .data.read_mostly needs to be moved ahead of the .data
section like it's already done on x86, so the .data.* catch-all
doesn't also include .data.read_mostly. The alignment of
.data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
up being placed at the tail of a read-only page from the previous
section. While there move the alignment of the .data section ahead of
the section declaration, like it's done for other sections.

The benefit of having CONFIG_LIVEPATCH enable those compiler option
is that the livepatch build tools no longer need to fiddle with the
build system in order to enable them. Note the current livepatch tools
are broken after the recent build changes due to the way they
attempt to set  -f{function,data}-sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com> # xen/arm
---
Changes since v3:
 - Place .text.page_aligned ahead of the .text.* catch-all.

Changes since v2:
 - Split the placing of the header code in a separate section to a
   pre-patch.
 - Move Kconfig option to xen/Kconfig.
 - Expand reasoning why .data.read_mostly needs to be moved on Arm.

Changes since v1:
 - Introduce CC_SPLIT_SECTIONS for selecting the compiler options.
 - Drop check for compiler options, all supported versions have them.
 - Re-arrange section placement in .text, to match the default linker
   script.
 - Introduce .text.header to contain the headers bits that must appear
   first in the final binary.
---
It seems on Arm the schedulers and hypfs .data sections should be
moved into read_mostly.
---
Tested by gitlab in order to assert I didn't introduce any regression
on Arm specially.
---
 xen/Kconfig            |  4 ++++
 xen/Makefile           |  2 ++
 xen/arch/arm/xen.lds.S | 41 +++++++++++++++++++++--------------------
 xen/arch/x86/xen.lds.S | 11 ++++++-----
 xen/common/Kconfig     |  1 +
 5 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index bcbd2758e5..d134397a0b 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -27,6 +27,10 @@ config CLANG_VERSION
 config CC_HAS_VISIBILITY_ATTRIBUTE
 	def_bool $(cc-option,-fvisibility=hidden)
 
+# Use -f{function,data}-sections compiler parameters
+config CC_SPLIT_SECTIONS
+	bool
+
 source "arch/$(SRCARCH)/Kconfig"
 
 config DEFCONFIG_LIST
diff --git a/xen/Makefile b/xen/Makefile
index 5c21492d6f..18a4f7e101 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -273,6 +273,8 @@ else
 CFLAGS += -fomit-frame-pointer
 endif
 
+CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
+
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 743455a5f9..7921d8fa28 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -36,6 +36,9 @@ SECTIONS
        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
 
        *(.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.*)
+#endif
 
        *(.fixup)
        *(.gnu.warning)
@@ -82,10 +85,24 @@ SECTIONS
 #endif
   _erodata = .;                /* End of read-only data */
 
+  . = ALIGN(PAGE_SIZE);
+  .data.read_mostly : {
+       /* Exception table */
+       __start___ex_table = .;
+       *(.ex_table)
+       __stop___ex_table = .;
+
+       /* Pre-exception table */
+       __start___pre_ex_table = .;
+       *(.ex_table.pre)
+       __stop___pre_ex_table = .;
+
+       *(.data.read_mostly)
+  } :text
+
+  . = ALIGN(SMP_CACHE_BYTES);
   .data : {                    /* Data */
-       . = ALIGN(PAGE_SIZE);
        *(.data.page_aligned)
-       *(.data)
        . = ALIGN(8);
        __start_schedulers_array = .;
        *(.data.schedulers)
@@ -98,26 +115,10 @@ SECTIONS
        __paramhypfs_end = .;
 #endif
 
-       *(.data.rel)
-       *(.data.rel.*)
+       *(.data .data.*)
        CONSTRUCTORS
   } :text
 
-  . = ALIGN(SMP_CACHE_BYTES);
-  .data.read_mostly : {
-       /* Exception table */
-       __start___ex_table = .;
-       *(.ex_table)
-       __stop___ex_table = .;
-
-       /* Pre-exception table */
-       __start___pre_ex_table = .;
-       *(.ex_table.pre)
-       __stop___pre_ex_table = .;
-
-       *(.data.read_mostly)
-  } :text
-
   . = ALIGN(8);
   .arch.info : {
       _splatform = .;
@@ -211,7 +212,7 @@ SECTIONS
        *(.bss.percpu.read_mostly)
        . = ALIGN(SMP_CACHE_BYTES);
        __per_cpu_data_end = .;
-       *(.bss)
+       *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } :text
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 960c51eb4c..4103763f63 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -87,9 +87,12 @@ SECTIONS
        *(.text.cold)
        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
 
+       *(.text.page_aligned)
        *(.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.*)
+#endif
        *(.text.__x86_indirect_thunk_*)
-       *(.text.page_aligned)
 
        *(.fixup)
        *(.gnu.warning)
@@ -292,9 +295,7 @@ SECTIONS
 
   DECL_SECTION(.data) {
        *(.data.page_aligned)
-       *(.data)
-       *(.data.rel)
-       *(.data.rel.*)
+       *(.data .data.*)
   } PHDR(text)
 
   DECL_SECTION(.bss) {
@@ -309,7 +310,7 @@ SECTIONS
        *(.bss.percpu.read_mostly)
        . = ALIGN(SMP_CACHE_BYTES);
        __per_cpu_data_end = .;
-       *(.bss)
+       *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } PHDR(text)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6443943889..d921c74d61 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -354,6 +354,7 @@ config LIVEPATCH
 	bool "Live patching support"
 	default X86
 	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	select CC_SPLIT_SECTIONS
 	---help---
 	  Allows a running Xen hypervisor to be dynamically patched using
 	  binary patches without rebooting. This is primarily used to binarily
-- 
2.34.1


