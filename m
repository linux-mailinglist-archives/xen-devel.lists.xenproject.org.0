Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DF25F7D49
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 20:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418224.662976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogs1R-0000fz-LV; Fri, 07 Oct 2022 18:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418224.662976; Fri, 07 Oct 2022 18:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogs1R-0000da-I2; Fri, 07 Oct 2022 18:24:33 +0000
Received: by outflank-mailman (input) for mailman id 418224;
 Fri, 07 Oct 2022 18:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW8X=2I=citrix.com=prvs=2723e59b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ogs1Q-0000dQ-5R
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 18:24:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 477167e0-466d-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 20:24:29 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Oct 2022 14:24:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4959.namprd03.prod.outlook.com (2603:10b6:208:1a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 18:24:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 18:24:23 +0000
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
X-Inumbo-ID: 477167e0-466d-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665167069;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FiRCk3Y/NObYQimek7mR4D1ZlH2EpOD+gibFR2m8lis=;
  b=WzMUjRKVPkat/D3xPekp7ffOETE40rDsBwANjygL0OW9jY7GaBVXLWLi
   DfN8/v0LvFIgVLbHNp37PnU8A2C8j31X+uLpLAOnubeU4ebBJrnWpcg4m
   fpbJvm/pL5Vl4eri/mVSTFFsGJje4wFPVeMYWYkz9ophrxiYXIhrDVNMP
   c=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 82241758
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AoJQ/UqykBx2GsqYRQON6t4n5zX0fS1M+Zkaij?=
 =?us-ascii?q?kTw14qbGYmMLcPOrxiLQjTXvW5WxI8XJcG4SpgwjnZAGzTh9pmuRSG8MG3qt?=
 =?us-ascii?q?OxfgcBBnHBoNelWH2QmE+eZMoxCFCeqqBMByRJRY04IJcp5V3XXbqvlQFmpi?=
 =?us-ascii?q?BbEbdW9en4LWj7smpYBGba0kFjq/Wp8AHgmszjG/sgnm/LezZO/HL1ujS/Jy?=
 =?us-ascii?q?0FPFlyiifuutNrbikIgvHESZZ0YLKRHX4K7Qk832uHIYpqDB6M/4VriAa+G6?=
 =?us-ascii?q?ea3XXI/zRdZJ2Fkg8ZKvrBtPNKxWUip9q0CFvERvgL714PwVQTyjjBpWA9XV?=
 =?us-ascii?q?fHH8xZo6viNvLFJAybQ3fv8EaP8U+APlGvluvjE5b2ieAp6WhW2lxGS9+pLP?=
 =?us-ascii?q?h7Xw7HfeYzYuXgz7lbKCjVHdF1dNdkSkwGGe2pCATlVRSv4CkCsaEuqhCkS1?=
 =?us-ascii?q?fAEuNsLPYQ/V31YECmMxsSm3j6CQWqfQ8aYnM50vSD1OpS11it6VHWpjbY9P?=
 =?us-ascii?q?xD1jPuOknwckZnztARLQD6VtgBhJJF+axBM8OR40Th7xpQH4NT/SyqDBNQQa?=
 =?us-ascii?q?KD1xkHSj6jMQrSPwhFgO0LtNdD3lZuiyd5w4/aVqJwjCp2NrJ6L/ghj5PgXe?=
 =?us-ascii?q?AygI4+OmOL8RPQ6lHewgAkzUYx9wY5dWWeI+6uz0cqklum/gZB/nxpC1QS/E?=
 =?us-ascii?q?vwJD7J18C50xuvS/xFFOB/czcnu++R3NZ0XrP3L/qyLxriWfD5OOHKgNEaKc?=
 =?us-ascii?q?ZHYF0k2WUufngtT709AcFBGfpCh5Bd8WQdH6yhhBMXcdWldRlE4KGsvGSEWx?=
 =?us-ascii?q?GXBlSv0DElRQTP39e9TBPmC2rDWyBTb8JaCpD3I9hIkogF+Qh7ZmzneC2loX?=
 =?us-ascii?q?NA3oG/l+YnWGjKzaV56qThSIbZKm0jCuqBIyC38pWERrZnM24RBonzNlohA1?=
 =?us-ascii?q?HQ7phtOcBwOmNIA8EuLuwZzp6pAwoPFAfEJC+4m2VZVPxfPZlrMKT6d5BX00?=
 =?us-ascii?q?xEpn/5xRT1VAWSbtphsELuiyNCFUEHMmLuAAjWOickA2wgZ7tQw0nTk2PTXL?=
 =?us-ascii?q?phkIhVUbChRwbNh/fm1ppBDLLhEnr9IzlYfE9FJjAPE3QmFFhJZBntgaM59s?=
 =?us-ascii?q?oVlTwrreXxEZ/YQMRITkWL3fUq8TrZOkvTh2YnAuUpU7Qx/IWrPmJhBuaedy?=
 =?us-ascii?q?mGMZDCi6pF1UGoZUhXEB1rUkwALllr674VKL12ap7mB/I9dOjjwmuxlQh5ub?=
 =?us-ascii?q?jfvQDqhaEDYNoifAeWGiCJlIhVVdF1pPvUfClGzV9z/YKOx2M6FLxMvxhLy3?=
 =?us-ascii?q?+JW4bqqWy+qltlqvtAkdeoVXGtxQmrD/FfIikR2bNWUpkvel6OlX+gcGJ24x?=
 =?us-ascii?q?e6ktxTTt+DeWfg08JPYy5ZqDZxuIfMEtCYWBrHrHAAyPvvTicWccYat2zJ2C?=
 =?us-ascii?q?34GgACxpUGlNHztXxPelviZjR54NdyxooR7ognlhT2DVCNiArNnsRxzMakIa?=
 =?us-ascii?q?gB5/WMUX4Yxzoq74EhRlye4PVSbgzUiyZMFJc1qxfXtwPpX36fnN00eAyQsK?=
 =?us-ascii?q?I5lauqNGPIIYbG+cJJJXXCj4f6IBcfu40qZjpz8UZfKsJ9T6er7KIy6Jb7vO?=
 =?us-ascii?q?jLZ6riPXQu+E0/lZtii83+9gtRbC3zZRPPf/h6yyVj6k8WcGv/Oh6L0kFyvA?=
 =?us-ascii?q?UCa5T3XzrYc80fUnw3lMRYwXVcoIQrvPzdrZhizppEXFUTNlMI0mO9TIC42H?=
 =?us-ascii?q?LJjZJezaP2r+G2BjhvhxEo+byhnbc78QYgQ6CM9FZ0FPJMC6ZENe1Q+YGj+n?=
 =?us-ascii?q?084KpfCMubK2z3UsTiwSML9klv9gmGLSshRs7ityrfcKPmSCctl8eMzdWrCs?=
 =?us-ascii?q?weU2kbmXZCtFYLM925ebCOg1jKspdL0MYwBXKc1riytVOdE0xUl3AOLYnjju?=
 =?us-ascii?q?8Y8v1YCOVeYjR6wvm5RCWNR2V3AvExhugGWt4lXRzkrseCB/uR7t1Z7JU2hO?=
 =?us-ascii?q?+5/cTH0yvLNIxOIxswOASXX3b2X0uRQXLRVCUmpkRIQ8FUKl/1yYy5jIxDZR?=
 =?us-ascii?q?w6E8/V84kTay1pT79qiZiKdlBuIG+v76n7P3angNnItPVogiMXg6z2daQcA7?=
 =?us-ascii?q?juE7v49SDh9RLbehKoVjVzQg83fOU9VLEwfzFL08g0eyn+qIPwVUxdf0JXlz?=
 =?us-ascii?q?GvowuP51ogCZdiflBGY5evmF/Kf3i7OI8YFgxWKl1bhoQvClr/hnoZadyRyr?=
 =?us-ascii?q?jAslFXWB87QAJszQP2O76x2BtTn+tY1vDxAPC8GEx6fyNUhbfPiZ6dAcgX/+?=
 =?us-ascii?q?rc8Z4TefhY/zSvHxFd92GBcHY0a/cyzHHvcql4YYhdK8zD1cizy3i52g7DlR?=
 =?us-ascii?q?HnSkKuv72MLCnJ1mYgo8fP+nQP5GsZoG5TjMgu0SPxoICWG8jhf6VKtZ/SXg?=
 =?us-ascii?q?UdfKGx8+/QqL88gQu/4x8173UOPU/Nucwr1VHvuY8eGYmdu3QppE9LbvGojG?=
 =?us-ascii?q?ezgbxzdbKAwEY4TIJoQw15zmEsPACxxwISCJxrb0jKhvT8LSIADvL16VzmSl?=
 =?us-ascii?q?xxE6Fs5AR0Vnuj1uKTQnapuwwihQuJ9yEDSamsii8WlrnCCFOz5P2iIgEHbG?=
 =?us-ascii?q?O9mUJdEmC09vfjtJ9GJpavSLrRi5jwEda4I?=
X-IronPort-AV: E=Sophos;i="5.95,167,1661832000"; 
   d="scan'208";a="82241758"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/HYTodbG6cL9pE3tLtSWeAH/m77vd9gj+Nk16AnQZO3/X9yK9Aw5FazJqMTn2r9dfdnkFccE8flq3f5rWU9D3QMJVYyAelR0mRdCevLDwuezMW2Tde6mR0ZObxl0+7C2TNVEmEB8EhuVX2t6bEDl71VRnj4b0POXUiwfNiZfcbwcF/jKXlBJ6j2wdu4BavbghqVae97zaPIS772CNRO6wsAbIH0ozN70Uuf8biHMMkFZw/7zAzND5WKqwvgx0bxjhWZN0+LuTi+JmUCJyY4AetlRL3S0ibTyBDN/X4AdI9ORXI7bwRjH+SmidKmeqQ+TAcE0p52zdKYSdIB4EB/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiRCk3Y/NObYQimek7mR4D1ZlH2EpOD+gibFR2m8lis=;
 b=j4PFLe1rh4GO4FNS+9Ld10WwAAoTzHq7HTRk+2idPSI+561DGJeUP2Yk94b4xMB3Q1MF8+b2RNflZsT90dxQiB4ZO8nwCsxNs8jDfBCNeAuJ4GfvyXDHegv7vePW2CGofW16wJVXjA20w7Ap6lDWN42iHPvuvC1mSHPBnYk9z/tqFj3Rm9z9Ag38S3G0/DWKoDJSETYWTe691ULoAdBN0iagEcNThxybCWgR1YGqsaEDupKr/d9TCNVJAqWZ0u+xiTxP2l9OXLo8oV5fa2CvZYABUu2LGMVOcy7JHmWq4+weNLZyWbwj5mgpIcCKEAyygUYjtpQPk9qohqE+ZrhImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiRCk3Y/NObYQimek7mR4D1ZlH2EpOD+gibFR2m8lis=;
 b=XymrT3Gr/QGO0j0wXNHqtdt4zALUkM65luL1IUsAZQY6VM2zq51kjmkQ6WU7MOVxlrkbGgI5KrYb5YOtqKHOhWb0T89mb4d0p1kQQZ2OHB+qZLRRfC7HPDvbkKUdye96mqoo+e2TYrOb0NhVPUUVd7aVwpjmVwE6EzV9SWNEKzY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/9] gnttab: no need to translate handle for
 gnttab_get_status_frames()
Thread-Topic: [PATCH 7/9] gnttab: no need to translate handle for
 gnttab_get_status_frames()
Thread-Index: AQHXmmM3wQfSlkpB0kOBlQDRimPR0q4Fv0QA
Date: Fri, 7 Oct 2022 18:24:23 +0000
Message-ID: <f797f122-2fd7-3acb-3c0b-ec790c16be0f@citrix.com>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <ed6a8403-dc91-05c8-25e5-81b5fb706cc2@suse.com>
In-Reply-To: <ed6a8403-dc91-05c8-25e5-81b5fb706cc2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB4959:EE_
x-ms-office365-filtering-correlation-id: 8bd02edb-c816-44dc-79b9-08daa89128a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Kw9HKKaTPgtBmFrZf43lTIF/P5CP0Ff5/8pyLiE7TFP34dwnaW9gpy0r53B4ZiBAt+8YTKPC9i0L6pqMaSZqDO9A3q2SOY5cPBBwLQLyR1e+ttsaRuVapd8+8em3LtwW3UH2z5TcT/D2Ewl4MeGZ4ZTBjvNhR206PjjIczCSqxr1cYrObYIpKRoZMw7xWUE+l6vbCgHkiO50t0GirJy813FvdyAf8nfosC2vuI6ptZO4yk2PYLwmQaj2kq+iP8AAZ4MBotGlqY5JehrAYfJOLmEuitgKHllrgStQpwzL9JlEdantva0fRIteII5VRopvzSR8ErQQhJd2FYBT2fTAz2V1carnXJiHN8IRrBhQC2+6WK1vKEdJCgx9IitPteE+/+oNjiBvukTEiJm7XptoB/0/TrccW5ahEmEV9qjjt88sPNQHe/o6bZ7NPYUxF0pnYCl+tkJ1iG9+tdL067QlhWlX0IuIXbkL45E+ZEXxB0XsIFS5oBBs8IJiaJvdvAnchz4CJMeaL5Ul9OiXguzMbAlmtqHjznU5P94VHdxjpHxTpEfWrxl+GpicMkLsVQ62igFrzbow+Pa0Nm2HN9Tl6qL6B9sA9uiUGS0Gb6IkfkSXASvS70POngvUITqWNzGRomBXOaqTX+6HgAR6/B1qFidW0g80niCHQ80zNQow2CjWPkd+qH3T5nzxZAM3449zqGaFN5PYU7H5AYsqSPfmFw8WBGYtIzieuYpV2fpfZ+VWnqOJPyZDBojLnVnc/VGmj+VGcIl46Ti2PgP273DIm4KyTiSDHilPnYJTZpLpF6kSmGhhRQnStvgQewXdU4pK2fubW4PCdP2G57FbmSvV+g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199015)(2906002)(4744005)(4326008)(91956017)(64756008)(66946007)(66446008)(66476007)(66556008)(8676002)(41300700001)(8936002)(5660300002)(76116006)(54906003)(110136005)(316002)(122000001)(86362001)(82960400001)(38100700002)(2616005)(6506007)(53546011)(478600001)(6486002)(71200400001)(36756003)(26005)(6512007)(31686004)(38070700005)(31696002)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHlGZjFSM1haMGlXR21xTmZtZS9yMWdGbDI3MnZXdlRVZThyQlViZ3VFWTBH?=
 =?utf-8?B?Tyt0K0ZJaUVnMVhTQ1huRkpoRGdXeWMzOE1UNGtDNUh4NUZyUVdJQWJTS0wv?=
 =?utf-8?B?RlJQMTh5M084bnVRbDh6ZmYyVnF1S3ZYWjV0aHd3RExvYy9FOEIyRXpSYnRT?=
 =?utf-8?B?L1ZjTmdQQ04vWndtRUhoa0Ixdi8yamRkb3R1eXlEakE5cTdjV1h2eE5ReXBM?=
 =?utf-8?B?eGRDb1ZBRG5VWVg4NmYxazVrUGNoK3FDbUREd0RVU3NibEtEMUdBL3MrUS9S?=
 =?utf-8?B?UkY4MG5QUXNsSml2TG5ndUx2N1lFZ2VBZU95SldrODhBQnFXdFB1TUZzZnN0?=
 =?utf-8?B?bkVtcUJCUzBLTUdiRWpFeU10c0FkTkdTVmpLSWJBODNHc3FSK0ZGeEFmZUJ6?=
 =?utf-8?B?RTE5cEZ0SFJCaC8zSmpxRmtoWTBWd3ozMzFnWDNSYlI2NmtUWnBSNHlxY2ZF?=
 =?utf-8?B?aXg1NW1WQ0lVNGc3NUVVM1pvQTFJNlU2QjJOWmdXbGF6S09TR3ZOdWc3V1VG?=
 =?utf-8?B?eC9QcXlETTZZQTZFakV3V1Vhc3FsNVRUMlBqeTNnamgreTVzNXlvSWx4VFh6?=
 =?utf-8?B?R0JuWEJXdnU3N3pkZzlORGdlOE90Ly9Fdm85RDVSWE9LN2JPS3lXK1B2S3Q2?=
 =?utf-8?B?M1RXV3JoU1NXSlNENHhqamZvSDhEU2ZpejlZU0Z1MHhrTnlPdmd4dkc0NGc0?=
 =?utf-8?B?bXFPSGxGRDkrS0luRytnUk5VaXBKVnlLNkhDTi8wV0FrUjVRbDVKd01vSVVM?=
 =?utf-8?B?anZOank1MzdDdW1SRDhrWUd5UnFHcXBNdGc1S1JyM3F3allCZWFzTnF2SkpU?=
 =?utf-8?B?T0oxMkVhSmc5b0k3dkNRTmZPTU5COUtra1BvOXBreFJHN09JU2FTdWJKWGhs?=
 =?utf-8?B?N1pxS1poVmRqbVFzL29vOTNYcGIvbUZ5NmsvUmJZQ0d4aXFIMnQ1QzBLQXM2?=
 =?utf-8?B?bFNHcDFleEl2VDJSZFozb0VEUWtWWFlObFY3dEY2UFFjWDRIZTNKTUx4Mzhs?=
 =?utf-8?B?VlFzby9JN3A1REZJUE91b0cxeGVrZDg1a28yb0ppMTg4YnIrdmRUclU3d1dM?=
 =?utf-8?B?WHNKVnJEUlN3YnYrQXVsNkVLM00rTzhoL0p3MmV5YUhiV09JRzMrTzEzNGk5?=
 =?utf-8?B?SWtnakEyVnNSTmltZGN4MENmSVZkQzRvbUJUSldXN0c1emhvUVFHelBWN2Jn?=
 =?utf-8?B?YXlIeWdDRFFIbGVLcm5ZamR4VVVUazNHVndlaFhKa3RKc1BXRUh3UUdlS3hh?=
 =?utf-8?B?MWlaSk93ZUV0SExHZHZadWd5R3FaVXoxS1EyRnFJY2dYZDhHcFYzNmU5KzBs?=
 =?utf-8?B?Nmp1b1lCc2N2elZRV1AvWWN1S1ZGNGtqanR2ODVvaXdJUnpoVXFyQ0doeXlT?=
 =?utf-8?B?d1oyTTdpemtFUkNQOFRUR05YWUJnbjJCZ2Uvc1htMjFQV0hVS1J1U3h0Tm9G?=
 =?utf-8?B?QWgrZkxYOGNkb3RYQ1NQMGhuQ1hKT2t4ZWVOSEcrL2VleEFOTVEvdjZ3QkRJ?=
 =?utf-8?B?N3k2cEJ4cVM5WkhMeWdJQjJKbU9FVFUzOWpBcnNsRlVoVnJJd3BiZ3k5TEJn?=
 =?utf-8?B?bVpycmYyYmlLbGdHUGtpS012cFZOcXpKdFRXVllnYjlzTGIxcmdsZ1Zicitl?=
 =?utf-8?B?OVdHZU9OUGxkaHc3Y3huclFxdStnS0V5K3lmVmt6eThvWU5sQU0zQmdUZFJH?=
 =?utf-8?B?SGp6QVEzZXhyTDJvSU1XQTFKcnJYeUIzZUhHUVprZWlPbmtMeHJUV2gzQk1M?=
 =?utf-8?B?NkNCR2hwbVNXRmh6V3o4MVJXSDJrSnZaWUp2dlFhRm9MWWNCVlplTDV1QlRl?=
 =?utf-8?B?L2dicWlKSVNiNHh0Q1lPbzk4eEcwKytCdXl0OS9ZOXpUdyswa001NlhoL0ZE?=
 =?utf-8?B?M1BPUWhBeTFwVU5oZGxFTEJCUXp2MlEyWXBmNUhFdzAwNWllTXZibUFvbFd1?=
 =?utf-8?B?cnZMQ3h6QlZOOHUxVG9rUFNaN2NlYkZRMVViQXFGaTczUGNvRUE2dUF6VjBQ?=
 =?utf-8?B?VE96bjFibzFOVklNYjFyUitCdnZESzB6c0VwYmpMSEdkbnJ5blNVS1IrVmdQ?=
 =?utf-8?B?Um5oWVVOYytIbnYzYWZRWHp5eG1rSmVIQzJUNC9QWFc0Q1Rydi96aE56L3A0?=
 =?utf-8?Q?yc5E86TLH3VEsb56CoS8Nws9o?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDE4437F81138140950F0C3ACACFA54D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd02edb-c816-44dc-79b9-08daa89128a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 18:24:23.1600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r8PyrBY0f3frxxcbkVBmcMQWm9kzJMLjjFocv1qFq/5OZE2/IFSzVcSZYKsNQ2TBXn6MBvCR4f6BIG3TOgRtRMFU2+JG3HW9CHQ+pNcDBOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4959

T24gMjYvMDgvMjAyMSAxMToxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFVubGlrZSBmb3IgR05U
VEFCT1Bfc2V0dXBfdGFibGUgbmF0aXZlIGFuZCBjb21wYXQgZnJhbWUgbGlzdHMgYXJlIGFycmF5
cw0KDQoiR05UVEFCT1Bfc2V0dXBfdGFibGUsIG5hdGl2ZSINCg0KQnV0IEkgdGhpbmsgaXQgd291
bGQgYWxzbyBiZSBjbGVhcmVyIHRvIGZvbGxvdyB3aXRoDQoNCiJmcmFtZSBsaXN0cyBmb3IgR05U
VEFCT1BfZ2V0X3N0YXR1c19mcmFtZXMgYXJlIG9mIi4NCg0KPiBvZiB0aGUgc2FtZSB0eXBlICh1
aW50NjRfdCkuIEhlbmNlIHRoZXJlJ3Mgbm8gbmVlZCB0byB0cmFuc2xhdGUgdGhlIGZyYW1lDQo+
IHZhbHVlcy4gVGhpcyB0aGVuIGFsc28gcmVuZGVycyB1bm5lY2Vzc2FyeSB0aGUgbGltaXRfbWF4
IHBhcmFtZXRlciBvZg0KPiBnbnR0YWJfZ2V0X3N0YXR1c19mcmFtZXMoKS4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

