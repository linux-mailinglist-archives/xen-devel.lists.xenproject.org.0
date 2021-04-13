Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611935E0D2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109813.209665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdT-000646-Ms; Tue, 13 Apr 2021 14:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109813.209665; Tue, 13 Apr 2021 14:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdT-00063O-IB; Tue, 13 Apr 2021 14:03:23 +0000
Received: by outflank-mailman (input) for mailman id 109813;
 Tue, 13 Apr 2021 14:03:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJdS-0005sc-8T
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51725715-d4ea-43f4-8528-1a696ba6d6ea;
 Tue, 13 Apr 2021 14:03:18 +0000 (UTC)
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
X-Inumbo-ID: 51725715-d4ea-43f4-8528-1a696ba6d6ea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=XX1SugVBrNifC3XmPT1UGL6ovBU2ay/gnB824DeP1Ik=;
  b=Cc39JWoKjqLiS8RspJv8a4hSpqHiTdGaoxgC9B3Do/IKBfPwydKX8hj3
   QmRZcxy31VqLsv1tNL77eiF2t12i/DavLPIkq8W8d9sU6zLqo+yc1542w
   Z7W5AxKSNBMFGx2tPeYqP8B6ieYi7YI2Q+2dgTo5K5VWmq85X8n+eLWYi
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3nWJMVmsW6HjXl3TYRVxnjG9n3P6b5QN3X9n711F0k7EzNNIPs08FxI4yGd+Vq4ZEdd9tEYyS9
 tx7/zvVk8ozmKcYOx1Bo2K4mTquEYaIhq/lKcH1rqdDuRZzzr5FlVozYvOT95t8tFyQ9R05hwM
 SdD0Tu5oRSMePyhFjsUAnR4QX9mSQIdXwzl0Wveo8nc8RyrY5cStaEFioHL54nd4BE4DhduNnD
 gsdY420euYuCh8652VYSRShBm6eBkURjJScd/RfYAXUZLmGEiTEUOFgNnjI3gDgSauuMF/AS1R
 r8U=
X-SBRS: 5.2
X-MesageID: 41476562
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3XEvuqnR0tnhCZODHbm0AmYu1cbpDfOpj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW17LLA+E4
 eR4dcCmiGpfm4ZYt/+Kn4OWeXCoNOjruObXTctARk75A6SyQ658bKSKWnk4j4ycRNqhY0j/2
 /MjhDj6syY3c2T5xfA2wbonvJrsfT7zN8rPr3vtuE0LXHWhh+sdMBdXdS5zUsIicWOzHpvr9
 XWuRcnOK1ImgPsV0W4uwHk1QWl8BtG0Q6a9XaijXHuodP0SVsBYqIr7+IpEWqq12MasN5xy6
 5N1W6C3qAndy/opyjh+8POEyhji0vcmwtSrccok3ddXYECAYUhyrA3wUU9KuZkIAvKrKojEO
 VoEfjG4udXfV6wfxnizxdS6e3pcXIpEhicRE8e/uSTzjhNhXh8i3AV3coFgx47hd4AYqgBw9
 6BHrVjlblIQMNTRaVhBN0ZSc/yLmDWWxrDPE+bPFyPLtBJB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMynxvRwg1DwaVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA/fcR+
 24NPttcr7eBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OBZbtssDdbfbPNJvgGTspQQrEcz
 k+dQm2AP8FwlGgW3f+jhSUcWjqYFbD8ZV5F7Wf3+V78vlJCqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4U2//WPC6XRVKgNQZ3wlpInIYjdvn0snIkn0ebEMt5G0YmZJxkaKIRd5UofwHB
 NAoU90vYa6NYaZyyxnK9/PCBPVs1Ij4FaxC7sMkKyK4snoPrkiCIw9ZaB3HQLXUzpvmQhrr2
 9HQBQeRlDWEw7vjanNtu1WOMjvM/1HxCu7K89drnzS8W+Go9s0e3cdVzmyFfKMjR0WXDpSjF
 1p+6o5iL6N8AzfblcXsaAdChlheW6XCLVJAECgaJ9Pkr7mQg12UFyHnCeXkR01Z2rs+XgDn2
 CJF1zmRdj7Rn5m/lxI2Kfj9115Ml+QeE99cVhWm4xwH2augAc57ca7Io6Il0eBYFoLxe8QdA
 zfaTwJOwV02pSczxiOgguPEn0g27QjNuHQF64YbrnWw3+hQbf4050uLrtxxtJIJdruuugEXa
 ajYAeTNir/EP5s9AqPpHopURME3kUMoLfN4lnC42e51nJkXqaXD1RiWr0BI9aTq0LjXO2F1Z
 1ljdQz+cu8W1+BHuKu+OXyVXpkLBiWnEudC8cPgrpQtbgptLRyE4LAOAG4nE1v7VEbFoPMiE
 gaQK5H+7jPNY9kQtwKd0tijy8UveXKCHFujxf/DeA/d2w8lnP3P9uG5LzTtLoka3fx0zfYCB
 26+y1Z8+ytZVr66ZcqT4YxK39Rck4y9TBL+/6DbZTZDGyRBqt+1Wv/Fn+2a7lGTqeZXZ0Wsx
 Zh+tmN28uabTDx1gyVnTx1JMt1giuaaPL3JAKHAuhT9dOmfXyKn6ux+ca2yA7NdgHTUTVQua
 R1MWoKbspCjTE+jIo4lgiKI5aH3X4Noh95+jFollnkx468xnzUdHs2aDHkvg==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41476562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PP3ZwZ0VgTXT92mijYjp5LG19kcwVniCezFwajGVbGphd3PlLSP4v3MuRfIFaV8ySYIyYQxldv5U3iV9eU3rhJcLGFCgls4s4GcYN2EUp54/F6Qa4zqIRh1JXppB/cLGOY0P5kVNrzubtrQ2uvk8vBH1YSvm5H/F/DobhDbtnOE1ob+X3vz1RsfmSn0EUvhR9g3ncseqQgBpzAz7S6Vwh8R00+kj0v/VSPYIYpEuflnf0j9J9IehHiQeKGeRfsLifNPtyEBa1beX9GCnO7ptchp2w+XJHoykaOOTIBGWMpLTJUgumHpK9Y6up54RSTCEwLZKR2MStrjPuBaQfNdSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDZhAJDB/rsUQo+Z4e8pQdhxsoyKmVpWA1PSI58wKuU=;
 b=h19POVAQunWfkCqXZGZn3OCtC00PQCc1Em8SuDn2A4Xia5cNNovmHEY9oebZFPEHTqBXyHewwOEeLeZNlAUALfgQBmJ45Mw/HtZCPeeOfgA1dvuquBgMZfagNpp2jTBUVbcr78l/8NNxV0/OiHoh/g4w+B8kBF4g5TdVKxMSkyJRfo2Mp/VtlmTh1/eKdIZm8VwXsjJrYnyuXcHh+sTwzGJRhsRDHDAMqp+9ZC+kHNfSTG2ycg+xLtJtMCq8+mtYpI0IAQKdjhs1wK4nk5XExJeYduuJOAHkGW8HJrGtWgP44R58G3kVun6++bZs4pPx/iNf86+JkyoSga4tvXk5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDZhAJDB/rsUQo+Z4e8pQdhxsoyKmVpWA1PSI58wKuU=;
 b=cFxUb1fIRubkaC1putWAOfaK/NMLjcrZg3d5UyZ0wcVTgE+Sk7cUjf2xSOFmimilNkJAeOO9IeqAqbbq4KdDYtT/2IMN7bxUdzDdUq8KTG6SKOCA+wOa9pWI8W9peOSbB5h167Hs/H1rjlzQjjshwpe3o9W8+Xp0GeoavMlFHQ8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 14/21] libs/guest: introduce helper to check cpu policy compatibility
Date: Tue, 13 Apr 2021 16:01:32 +0200
Message-ID: <20210413140140.73690-15-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efdc4159-a63a-4dcf-9dda-08d8fe84e186
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2553B25E5BADE26E00F343E88F4F9@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a2oAP/yFTX6/8n6x/Hh76oJ9N2vaZXSPu44dvv1a+w8su5/0bzthNQFWZZkSLzQAXlHDDY/v2QPrB/eXP9uRaHROKHaFpQR7HDTLKx3lKAlPDIyk0xls8jmXa7I3hyXD5vhykpl/hjfbSeoGMLqlfinQC1XfIEsbhtiyi8FEGUq9NGyYq6X8oFUALNpOwC1VmZFtWO/f8x6EjxEoqoPBT2l2TcTk37kscKcf65b5rwamIjEZ55jhaXowySkvuBkvqgZTOkL04jrSNjMvGVBhG1p2ddMZVbZM6GmWt067TqcXiK3O9gQGED0Vypa35hd79bcRn4+vE5l5Fo1ayQFu/fT/hnSKUcEOGJkANifB5cBMCcVcJMywv4pELPcHgo9YETOIEAbuw2ADLL2zp7vWiMIXcjXj6Lc9EYO5Qu+RYensgsJBJJbaG3TcUnvY3jPpn8XDKe50WS+Fdl8aMv8+n4+Tia992VqkIb4/iei6Dtelo0V2iaImx2aX9fNoUJsPMuma9nRTCQPpZGXapKszCBuI6ZGIdmAGABA0InkYx/R2m/2UggD+mfCJfwtoIMgWe2dHBjgVMV41qa+P2z8LzgvDkZfIUG8o7TVwZbJXAKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(8936002)(6496006)(186003)(83380400001)(38100700002)(2906002)(66476007)(86362001)(956004)(2616005)(8676002)(478600001)(66556008)(66946007)(6666004)(6486002)(16526019)(316002)(6916009)(36756003)(54906003)(1076003)(5660300002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dmRpWHNJdGR2VEZ0dXdLbWRRdGIwUWZVQ0paWlViY3Y1ZTFOZGxQWVNlM0R0?=
 =?utf-8?B?UWRzYmU1R0dSdGNVV2w1UDVPeWNoZjdVazByS21MUkIwSU0yVVVkYTdkSHMy?=
 =?utf-8?B?WmhNWnh6OENxZ1pIUnV2ZUJRM2xIVTU1Q1RCcFZVTWNJR0FHQmNnWFdBc1Fj?=
 =?utf-8?B?UWFxZnZoL1A2T1l6WWI0d0lvTjVWUkhwZ2ZrWEdvUzQxMldHTWpFZHdHUSts?=
 =?utf-8?B?eml5V0Ura2pkWkFQUTJIRGtPYzlON1NBbXpGNFBPVlZyWlJ0azBxQk1QRkdt?=
 =?utf-8?B?K25YcWQrb2pnTFpKVFVPOXg5Rkg2bVc2QVVFVUFmWjVwMmhwZU9SZk51OFA5?=
 =?utf-8?B?UGdueHJiZjdQTmpMUWIzdElBajdiSldXb2pRU1F3b3pvUkJzR1U1N2U2M2JQ?=
 =?utf-8?B?L1cxN2NjWGVweEV0Y3BSSXlXbmszOXF6Nlp6cThubGVhVnZxWWZuZW9vNzhz?=
 =?utf-8?B?UGFKT3dzUUJZR0ZXU2wwdnljRUJmOE5aRGFCSGhVd09KdHp2eC9EczRTV3I1?=
 =?utf-8?B?eC9FdklSTEJNYW4vSDBxMnZJbDVvdHR4QTNCSW45TUNHNXp3NVFYeXh4cG9r?=
 =?utf-8?B?bFRidjNhcGRFRmxIWDJJV0U0NUVvbTlldk9laGo0Q0JsNVA4N3p5WFJ0cFVj?=
 =?utf-8?B?UytOcUI0WHN6ZTJKMTk4TFdRWEkvRTJDN0p6Nk8vU2tmQVpYOEhMdURXVzF0?=
 =?utf-8?B?bTg3eTYwTUJUOWdkOTIvK0ZHbTdRMFp0ZDNuelk0VWNGY01qams3NXBaTVdH?=
 =?utf-8?B?a0RHQklzWjhxeWpsaFZoTjVRUzJqOW1NY3hjQ3piS3cwQXRNbEZoRkkwYytZ?=
 =?utf-8?B?a3BLaklRM2tMSjJNZXlkc0R0amtNdFBmbHJBTFVXWHdtbGhYMEFiOVhjZ2Za?=
 =?utf-8?B?cWNWN05TNzY5SGszQ0hmWG1KSlZORm9NZS9rcWx2WHUxM2ZNMzQzTDgxd3B2?=
 =?utf-8?B?M1M1ZzAwK3Fpckc4Q1h1YkxMc0lyajZrc1l0aEhKcXEvVTFjUDY4c09xOXpj?=
 =?utf-8?B?UjloYTlaT29mN1Fxem1SZjNUTUhsNUJoRFY3czBhcUtLT1Z2bXMrNHNhRUVw?=
 =?utf-8?B?M1Nld2srWmhXaWhRQ2JpZ3FZOVJGYlA2aDBJQkpSS29odGVhWEhRRHZvQVhW?=
 =?utf-8?B?cm93MUZpYi9TenR6d1lUdWlxRHc0NXFMZTdBNlpvRVhtcUZkMEZORk1JWEJy?=
 =?utf-8?B?REtvVzJwZUNHejdMcTN0bXF5RkNXTXFTS2NuRWpsZDVnZTgrbUxaeUowUTFo?=
 =?utf-8?B?MzFZM29zdmNpeDVrazRGRkI5azRrdzQyUHNZZ0d3NnY1b09Raldybm9FVUFN?=
 =?utf-8?B?dWZzaXdHaTdUVjFvNEFkZk51WUY2N1hlVjM4YytsYnRHeFBTandnNWF2cFor?=
 =?utf-8?B?OC9KSzByZ1IzZHh1ME1uc3ROQ1ZwSStVQXVuQndXL3Z3NmhWWlJYMXhCdVM2?=
 =?utf-8?B?blAyMWNuODVlWlVUOXZnaGI1SWUyWElzc0p5a0x1UDdUblFZaGtKZ1FtRWZJ?=
 =?utf-8?B?WEtYRTBFSjg5bUJMUWVNVE9xZUw5WXdOYzVtRUVjekRXYXg0Wnh5UXNTY29W?=
 =?utf-8?B?M2VqZU1leWpEMDk3bjlpWDhRTGYyL1pjWEVOcTliNUlGanUyZU9GclRhdUFN?=
 =?utf-8?B?eTQ3eFRPMEpZSDV5NjVnL3cxTHJXMnBvSDl3ZVZsdndXVlFrb0lVTTZQejIy?=
 =?utf-8?B?WFBUcHJtYktSMDJEY0FNRmM5eEVDUnQ4Q3F3MW5UdGVSNGRqT2l2eENTZXVL?=
 =?utf-8?Q?bP6KInMj/McpyWCo6huqyllhxu1rNm0+oljgXCg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efdc4159-a63a-4dcf-9dda-08d8fe84e186
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:14.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hIOav2WbjNwSbrWFaROLkZYL4jnSDbZCBwqwAACZYCosVX65fF9DEWOdExlwvzzGtOYZ6MJPGK+1zWGwZmYbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

Such helpers is just a wrapper to the existing
x86_cpu_policies_are_compatible function. This requires building
policy.c from libx86 on user land also.

No user of the interface introduced.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Initialize err.
 - Explicitly name parameters as host and guest.
---
 tools/include/xenctrl.h         |  4 ++++
 tools/libs/guest/Makefile       |  2 +-
 tools/libs/guest/xg_cpuid_x86.c | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9a6d1b126d8..5f699c09509 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2619,6 +2619,10 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
 
+/* Compatibility calculations. */
+bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
+                                 const xc_cpu_policy_t guest);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 604e1695d6a..6d2a1d5bbc0 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -40,7 +40,7 @@ $(patsubst %.c,%.opic,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
 
-SRCS-y                 += cpuid.c msr.c
+SRCS-y                 += cpuid.c msr.c policy.c
 endif
 
 # new domain builder
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 26b09322dfa..bd2f31dd87f 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -925,3 +925,22 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
 
     return rc;
 }
+
+bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
+                                 const xc_cpu_policy_t guest)
+{
+    struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
+    struct cpu_policy h = { &host->cpuid, &host->msr };
+    struct cpu_policy g = { &guest->cpuid, &guest->msr };
+    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
+
+    if ( !rc )
+        return true;
+
+    if ( err.leaf != -1 )
+        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
+    if ( err.msr != -1 )
+        ERROR("MSR index %#x is not compatible", err.msr);
+
+    return false;
+}
-- 
2.30.1


