Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325614C6FE3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280619.478626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhIP-0002Dr-Nx; Mon, 28 Feb 2022 14:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280619.478626; Mon, 28 Feb 2022 14:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhIP-0002C1-K6; Mon, 28 Feb 2022 14:46:41 +0000
Received: by outflank-mailman (input) for mailman id 280619;
 Mon, 28 Feb 2022 14:46:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4KYl=TL=citrix.com=prvs=051d3ddbf=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nOhIO-0002Bu-H6
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:46:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ad6cc3b-98a5-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 15:46:38 +0100 (CET)
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
X-Inumbo-ID: 3ad6cc3b-98a5-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646059598;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=CRQHGiYeqc0Wu0GmB4mipEgrtqt/vOWrKIatVZMfaMQ=;
  b=JlVIoZQtMjhuWdaIPUEqIayzaRzM5Z9mNR+aSocxl80R0Oqgj9RGstgh
   xGTUxmvz7Zz7pAXW/SKdqiDsS3NZ3VYXKnVd0S+KoxEmjyhGiGSccLODR
   l9MGXpjNAtB9gjPkWRc1Q97Be2wFUW+7lXclgMfQTHoAxEIUOZrxtwkVp
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67408518
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oncBt6AH25u43BVW/3Lkw5YqxClBgxIJ4kV8jC+esDiIYAhSlGxQk
 DNbHCvTJK7JMVJBSKkiYYvi9RkF7MTQydAwGQU4qSoyEH8a+ZGZXoSTfkr6ZyieIJGcFhs3t
 JoTN4SQfck6QHONqh2kPunq9iJwiPHVLlaQ5JYoHwgoLeMzYHtx2XqP4tIEv7OEoeRVIiuDt
 YqurZLWYw/4hTV/PG9F5vqK8UI1t6mqsW4TswRmOKEXsAfSmUdOAcNEL8ldDZdZrqq4vAKeb
 7yepF1s1jqBp3/BMvv8zvCjNBdirof6ZWBisFIPM0SZqkUE93RaPpoTbqJGMx8N0WXRxrid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxaT82dB3JQxl1PE5HJc0ewvvruFX+bGgNwL6VjfJfD2n7yQVw1P7mMcbPe8zMTsJQ9qqaj
 juYpSKjWEhcbYHBj2remp6vrrancSfTd48VDrK1sNJ3hlma3kQYCQEMVEv9qv684qK7c4wAd
 xREp3N+xUQ03Ba5UNvRWweVmUW75gczed5uDtAI8ijYn8I45C7GXzNZH1atcucOttIyRDEs/
 k+EmZXuHzMHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRty8bniJE+iFTIVNkLOL64iJj5FC/9x
 xiOrTMinPMDgMgTzaK58FvbxTW2qfDhTAQ4+wHWVWKN9R5iaciuYInAwVnE795QIYCBVF6Ds
 XMY3c+E44gmBpaIkS2RXOgXB5m56vCdKjrejFVzWZ47+FyQF2WLJN4KpmskfQEwb5hCKWSBj
 FLvVR155JoKJHKjTatNZZvhJpsKk7SjK/jkSaWBBjZRWaRZeAiC9SBoQEef2WHxjUQh+Z0C1
 YenndWEVihDV/k+pNaib6JEiOJwmHhirY/Gbc2jl3yaPayiiGl5oFvvGH+HdagH4ayNu205G
 P4PZpLRm32zvAATCxQ7ELL/z3hXdxDX5ris8qS7k9JvxCI8RQnN7NeLnNscl3RNxfg9qwsx1
 ijVtrVk4FT+n2bbDg6Bd2pubrjiNb4m8y5mbHxzZA/0hSBzCWpK0Ev5X8FqFVXA3LY+pcOYs
 tFfI5nQahixYm6vF8shgWnV89U5KUXDafOmNCu5ejkvF6OMtCSSkuIIijDHrXFUZgLu7JNWi
 +T5imvzHMpSLyw/XZ2+QK/+kDuMUY01xbsas73geYIIJi0BMeFCdkTMsxPAC5pUeEWbm2DDj
 F7+7NVxjbClnrLZOeLh2Mish4yoD/F/DgxdGWza5qyxLi7U4iyoxooobQpCVWq1uL/ckEl6W
 dho8g==
IronPort-HdrOrdr: A9a23:ayjGBaoiCdzS5yepFGhAS4QaV5uaL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXcH2/hsAV7CZnirhILMFu9fBOTZskTd8kHFh41gPO
 JbAtJD4b7LfBdHZKTBkXGF+r8bqbHtmsHJuQ6d9QYXcegDUdA40+4TMHf+LqQCfnghOXNPLu
 v62iMonUvDRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1kjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3TRY0eTFcRcso+5zXIISdKUmRMXeR
 730lMd1vFImjDsl6eO0FzQMkfboXATAjTZuCClaDPY0LLErXQBepJ8bMtiA2vkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DEfeX56tQ0vbWIyUs4ZkWUkxjIcLH7AJlOP1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgE182IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBMB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qqGjMiq9N1lVcQ6duP22vaIJyYEUbICbRBG+dA==
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="asc'?scan'208";a="67408518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOGlXqWHOWjx8DQXlSh1i756612//yKPez9mSlqDUX+qw5yLgZW+xZ+oZoEKQgY2+X78ha9gmm90RnPNd4zr5413HwsM/3Ity3LdB3vLe5OQqm/TmqZWkJDB5eoFXrP1d/VmFUAeclApkBOOTqds28vYrZRsk0wsr36bRsItU64VvVft/u3hDxN1d2hDsU1hyeeR1t60A5yfAwXCPLgmuQvKuTUGzEQ2sXNmoclTWEorlfucF07CXnsyoR6o6kBKjVgsTfzXscmW2oNyKbUSIa4Ww3LLC5+bui68/XnjwoKwt+IPR32N6dv0f59wU9ll9w4PGrMoY2dJzSvg6WI7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjS/we3L3lPcknD5mglPZ+bO1PDKFjyeFBW3U618erM=;
 b=TMCXNhXLcQcphnWWqmCrBvETJzc3py3yyXCDL2exJZcjelSt8Wa7Vxcy1K9+JweNniIDYh6gK3xHMXn1w0BguGdKZBzASFxXBTc+4xngzmwN60fj0cKEy4N+B7sVQpRikKogpFyF8jA4ZXr7dn57ySDlq+GHNIKECfOAKlVUL8fS7dBWc7+IqHENYxVJXnENAscSPRmQ+Dwdg4HLS+Fqmh1WZUWEEv25xMLZ04NueSjSvu3uUaekQkuubrN9CZc2pDd6d2hGp0oq+0aIvaloDsYZxTo9+n4rzaudi3FybzyqumYLAAh7Z8e1VD2fqDnABZ62Nmmx83hCq7DkGlUMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjS/we3L3lPcknD5mglPZ+bO1PDKFjyeFBW3U618erM=;
 b=i7HQDwaIa2IDQSMNh0rqBTntwtqYwxKAs5VI3/7IWSfOaPdSJ+zQCm5Q6iF5u93SvIF0a/THcRcSapNrCX5FNKAidCN3O1R32KrmNvFeK+4jNqSenKopONkPTLyujRUx7MePrX+ZIgIfwQ9/5oEK4ddWtolyuxAQRfLvdcnsnP4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] RFC: Version support policy
Thread-Topic: [PATCH] RFC: Version support policy
Thread-Index: AQHXkDev9/QrG+8IgUOEs2JU9EeShqt6ldOAgRojewCAALAsgIAU2gcA
Date: Mon, 28 Feb 2022 14:46:32 +0000
Message-ID: <3BBE2793-C0AF-4873-8F77-5885CB39D67F@citrix.com>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
 <0bfdf348-8ce3-0f22-d28b-993ddc7242d2@suse.com>
In-Reply-To: <0bfdf348-8ce3-0f22-d28b-993ddc7242d2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c3460c9-2a14-4320-6815-08d9fac91ce3
x-ms-traffictypediagnostic: DM6PR03MB5162:EE_
x-microsoft-antispam-prvs: <DM6PR03MB5162E4C8CE7CB478BB00B26599019@DM6PR03MB5162.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iqt84juRK0jEnckG0H8/gm1rI5DboUlx2Cl95pmhT36yaYKUL9/+sAafkJ0VanraUN3T3pfpQ2vfcublE/uV1hwQUcBYLlOwXSoNSbIIwVI9AyZ/MhAWgyzBdDmsAIB96Eetyf2PN84sYbYbmOkj6y8tKF+7/dhlmVdYw5YBrcCPH0Hd1VFhpyRhzACtxbmi/8bwkkY85BTPLLM7I294D8a3bW98i0A/86vT7Npu8xO85++J1LcrAsS9GZVgE1dR3MMxz/o8zr/t6OLRx8KgMKvkRQZNoHa3KF/sT+L8wD81YirorlLgdC9Cvux+pIGAJS4/u3m4UaMwdJgUocZ1237HzKwW584KehyIGIkrfx4xs+ZTP3iSaIZN8LafD5x3hYv9G44KPuQM1Mg+ISRP16EJFZ1nPRbNOHqbyEwBBo01MvzXUTcbKyNHjI4XUVQGADrlEQ3P4SxXaZTbdFZQiUTa+mn+SCllfjxfuBrm0nWuHVixeX8C7oNYL62bq4ER8i+LCnXvPcPL0qhKuoJUhBf38MZhn5OhuivC3iULNAkNTlDW1bquqBaVA7hN0McckEXMN6ZU1mJi6lAl5WGDXmdua8BbDjbxNas6nqPWZppWFXmU18Ke3ywT8gAMPya3Zbz45KwL6uKpyn1FXo1pUiEH0HfSoG3HrO2SO+yoYhXpsyrZBvjT0dTtyAsV2AyWtPuZbhUMpnuk6WP8EK4njGNJhhZWoG8dldD/6ZrhF/jG+Mpkc9099IagjWJbW5si
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(38070700005)(2616005)(316002)(8936002)(66946007)(66476007)(91956017)(64756008)(76116006)(66446008)(8676002)(66556008)(2906002)(26005)(186003)(33656002)(6506007)(4326008)(38100700002)(36756003)(53546011)(71200400001)(82960400001)(99936003)(6486002)(122000001)(508600001)(83380400001)(54906003)(6916009)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGRmd2FwQ0dSa0FvMXdUNmlLSE1raUVib3JtMnNzNWtOdEtnbittcncxUlFw?=
 =?utf-8?B?aVd6WkFZbk84dTVmNjB6QUR2SXRPSmFCYWlvOFd0T0JFajlUVThwMTArbUhv?=
 =?utf-8?B?aHd0NVhKdzJZQmdGeGt0YUgvY3BpVzRxTGFNczFRK1Jmb1ptWENqZFpLSXJl?=
 =?utf-8?B?YXZFWEhiZkFBSm5YVjQveThTZlJtYXU3VUdYRHJuTlF2cForL1FGNXRCaG1D?=
 =?utf-8?B?SGZlUXQ3UTJDYkdWaDVTUktTYUZSejZCOGtxRkZLazNqVGpxVWFPSnU4cGJG?=
 =?utf-8?B?V2toWHdaZkxBdzNvaldpUE0rTWdndnNodmlBZ1dMbDdFSjJlWXEybUtrbVBi?=
 =?utf-8?B?N3lYczJ5dUFZQ1hyZ3JPSFlXY0N3dFI5R2t3dFRFWFljOWVhMjNPbWdqbzNi?=
 =?utf-8?B?bDhhZksrR3p0aDd6cFNMVTJ6V01JN09hcGdaY3B6d2dybXIyQ3RCaU1UaVhY?=
 =?utf-8?B?L0tEclF6TDRBR0ZabGh0NzREQ1liTGl6c0FQUStDMktWZEExTTlFNGowdDhW?=
 =?utf-8?B?NUZGZzViL2s1ZmVkWmxuakNGZUU4Y2hWaDNQNjhmcWliM2J4d2FrZEYxY0ZD?=
 =?utf-8?B?dXptVXVzMDVMbDZUUHMwbmZZdnlXUC85MTdsMFcyNjZLQTJrdUVscWd0bmt4?=
 =?utf-8?B?cHBTZVd4cm1XOGFyMUdLVHFxVDBQVkxqWnBwaVhGWXU5Y0QyV2VIZTlYd216?=
 =?utf-8?B?UGFKTFNTOEtiSjNqRTlZbWRpOEdVR3hiYkljQURIR29uOUpaR2UyYjFKYUox?=
 =?utf-8?B?cEQrN3ZBNGJHMU8wbGlpVmMzeUhpMWJqV01VZXFqZ3BWMm5yekhSdFZYMjJn?=
 =?utf-8?B?VXF3RmNCVHR6WWVPckl4bU85aFFKQ2tmOHVUTkl1Nm9WVzc4K3pzQ0tvNnRs?=
 =?utf-8?B?VWtjRy82YjMvMHhudlUzM1dKVFlZT09WSi9FU09iV0dGdXBOOVo0QXNNKzBY?=
 =?utf-8?B?YmxaSTJaTlk0VUgwYkJzVXE3TUc1Z0w3Zyt2SVlhY2ZjSm1mYlJ3bTFWOUNV?=
 =?utf-8?B?ZEl3WkkyTzYxdXU2NUVENXJQWHdDajBDTm5CQWsxdENwSWU2Q2VBTnh5cXdE?=
 =?utf-8?B?QnJVNnVqaFA4eGpJR2N2aW51YjFXaFVVa29zVnpNZHVRTE16NVp2Vk9keUNp?=
 =?utf-8?B?MDJHVDBMZWUrdUVsS1lMbWh2aC9PN0ZhV2YwdW5oMmp0clV3MVNuNTdxYUxz?=
 =?utf-8?B?MndwS0tzVjR0L3hNOXhvZHlDdDhsRUZNNG85NGM0MHNoelVWZHVEWkFhWUdS?=
 =?utf-8?B?RzZwVHorWUR0aVJLZnljbDk3WTdwZHd1MzFDRlNrM3ZZamNOMkJxa1l4SnRa?=
 =?utf-8?B?UWl0TG54TjNBMFl1VVFjNWJHQzhlMFQwVzZlbkZ1VVpqU283UldPdGJTRFli?=
 =?utf-8?B?QUpkREV6Ly82Mi93MktEZnlHUUtRMVNBZXFMaHllVGVtSDdBSGJRTUdTVHRu?=
 =?utf-8?B?REZ4dTl4d0ZvblVOWXI0MEhpSEgzMk5hU2svQm9VK0NONzM3N2VBbms4ckJp?=
 =?utf-8?B?YkRGUDNkdURZSW8xRkdLS1grZjlMa2N5eHpSZmRRSHU2UGd5enJNYk5FL3RB?=
 =?utf-8?B?dnMya3R5L08wcHovYnVkcHRncHFKYXRUclpPcjlZVE84NUxGbVI2V0RNOGlY?=
 =?utf-8?B?QXNrT1hOOEJIU1Z0ajhtVzhGcUVZWGYxUDRtT2l1VERENWdLSVljYWFadWhx?=
 =?utf-8?B?cm5lSWpTR3R2R3pZSGtxZGF4T3RBc0NvSXY3SU0xUXRQMWxwemJjNGEvTG5Z?=
 =?utf-8?B?WUxoWXp6QUY3S0IvT1V0SDhYY2NROWowUlNpMC9Ybkw3bjV2T3JuNFdzSlhI?=
 =?utf-8?B?QXYvSjNmcXVEakpwTFI4L09HakNyVTRjTVdHbytCTU54Q2ZqQ3FOVzFPSjNq?=
 =?utf-8?B?VW0rRE1YYWgyT1E1YURCc2trV0pGK3NOckRBNzZ6dUtJUFg0WEJUM3B0OEw5?=
 =?utf-8?B?d2ZiaStmMVNtc3YrQURKcW1QT05hUjR5cDd1OGdRTkViZVRyMVpuN0FLKzhP?=
 =?utf-8?B?dHY3S1lwajJVSXpnb0dJYkN0TExlZzVoTjVaT3RHTXArdWk1UWYyaEgvZUJm?=
 =?utf-8?B?VktmTUt6TlNsM255M1Q0OHpHcEkrTExINnZQMzdpRSsxRno0ZnExL2xvWWto?=
 =?utf-8?B?Z2x1U1dZbnpzMTRVeEtCWCtydDVJanNvWjA0NjhDOWJITFN6VFBMODRla1Zs?=
 =?utf-8?B?Yy9TSWRMcSthU3JqTHZ3c0pmUVFQSW04TVljdmNmVTFrM2dDZEFNSFV6QjFK?=
 =?utf-8?Q?n0nSW2hsfJUXIgFAjoTN+aAoi2EwY/F5b4db3kTlYg=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F2E62668-53D5-45AF-97EB-DAD64F132CCC";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3460c9-2a14-4320-6815-08d9fac91ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 14:46:32.8578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdNBaYsBdbwBRWf1h+3bN/xIhJ33Ol7gRbAxatb55tbKEYz9ujl5Yim38dVoDtNmYXENVjcUf3KlAiYnvHG5Zlh7fN0Zdhf5zt/25o5XzYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5162
X-OriginatorOrg: citrix.com

--Apple-Mail=_F2E62668-53D5-45AF-97EB-DAD64F132CCC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 15, 2022, at 8:20 AM, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 14.02.2022 22:50, George Dunlap wrote:
>>> On Aug 19, 2021, at 10:18 AM, Jan Beulich <JBeulich@suse.com> wrote:
>>> On 13.08.2021 13:37, Ian Jackson wrote:
>>>> The current policy for minimum supported versions of tools, =
compilers,
>>>> etc. is unsatisfactory: For many dependencies no minimum version is
>>>> specified.  For those where a version is stated, updating it is a
>>>> decision that has to be explicitly taken for that tool.
>>>=20
>>> Considering your submission of this having been close to a glibc
>>> version issue you and I have been discussing, I wonder whether
>>> "etc" above includes library dependencies as well.
>>>=20
>>> In any event the precise scope of what is meant to be covered is
>>> quite important to me: There are affected entities that I'm happy
>>> to replace on older distros (binutils, gcc). There are potentially
>>> affected entities that I'm less happy to replace, but at the time
>>> I did work my way through it for example for Python (to still be
>>> able to build qemu, the community of which doesn't appear to care
>>> at all to have their stuff buildable in older environments). The
>>> point where I'd be really in trouble would be when base platform
>>> libraries like glibc are required to be a certain minimum version:
>>> I'd then be (potentially severely) restricted in what systems I
>>> can actually test stuff on.
>>=20
>> The question here is, why would someone running a 10-year-old distro =
that=E2=80=99s been out of support for 6 years want to run a bleeding =
edge version of Xen?  I understand wanting to run Xen 4.16 on (say) =
Ubuntu 18.04, but who on earth would want to run Xen 4.16 on Ubuntu =
14.04, and why?  If such people exist, is it really worth the effort to =
try to support them?
>=20
> I do this, for the very simple reason of wanting (needing) to be able
> to test a large range of Xen versions all on the same small set of
> hardware. Internally we're still maintaining versions back to at least
> 4.4; upon customer request we (I) may end up needing to even play with
> 4.0.

You don=E2=80=99t mention what software you=E2=80=99re talking about for =
versions 4.4 and 4.0, so I assume you mean Xen.

What I=E2=80=99m hearing you say is:

1. You have a handful of test hardware upon which you do your own manual =
testing.

2. You need to test at least as far back as Xen 4.4, possibly as far =
back as Xen 4.0, since you have customers that are using those versions.

3. It=E2=80=99s not feasible to test Xen 4.4 on a modern version of =
SUSE.  Presumably this is some combination of 3a. The customers using =
those versions are in fact using versions of SUSE from that timeframe as =
well, so thats what needs testing and 3b. It=E2=80=99s impractical to =
get Xen 4.4 to build on a modern version of SUSE.

4. It=E2=80=99s not feasible to use different SUSE versions on this =
hardware, such that each version of Xen is being tested with a version =
of SUSE from the appropriate time frame. Presumably this is some =
combination of 4a. You don=E2=80=99t want the hassle of re-installing =
the machine every time you want to test it (and it=E2=80=99s not =
feasible / too much of a hassle to maintain multiple parallel =
installations on the machine) 4b. Newer versions of SUSE wouldn=E2=80=99t =
run on this machine, since it=E2=80=99s so old.

Is that what I=E2=80=99m hearing?

So first of all, you are not an end-user, and running this sort of test =
is not =E2=80=9Crunning Xen=E2=80=9D.  I=E2=80=99m talking about =
end-users actually using Xen 4.16 =E2=80=9Cin anger=E2=80=9D as they say =
in the UK, on Ubuntu 14.04; not for testing, but because they actually =
needed to use virtualization to solve a problem that they had.  Are =
there any people out there who need a hypervisor to solve a problem they =
have, and want to use Xen 4.16 with Ubuntu 14.04?

 -George


--Apple-Mail=_F2E62668-53D5-45AF-97EB-DAD64F132CCC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIc4EYACgkQshXHp8eE
G+1cpQgAvxtkvCcF4soI1dhuqHIrgDYbo8SYH07vZ5/NNClfbIlBGZoO1b39RV8m
7bNETr2SsttDzy36B89lpgKoRXE1mssVM8D3y7Ao4wv1TRNBtkWHFTfoQZLA779b
BY4ZDBMhUueW5QtH4VM6JWXuupDBHua3RyVyRD/+oaYQHmrXNJzt7j6ePy21BvjG
e1FM4tQc9nGwS/EsXydqACoPy93k05GUjw5wDzhUj0VDw21LipjgY1jqLHSOxN4U
ml/WNTvyu6Tma2W3PtKs+txhzUn4MCHHvz4CKPVU1kBhmeP3mOALrII1umVABbpx
SlosyqyuDAHJJyAS3+k3NSY49xxGzg==
=u5hj
-----END PGP SIGNATURE-----

--Apple-Mail=_F2E62668-53D5-45AF-97EB-DAD64F132CCC--

