Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293874289A4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205577.360926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrbC-0008Mm-FH; Mon, 11 Oct 2021 09:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205577.360926; Mon, 11 Oct 2021 09:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrbC-0008Jt-BM; Mon, 11 Oct 2021 09:27:58 +0000
Received: by outflank-mailman (input) for mailman id 205577;
 Mon, 11 Oct 2021 09:27:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZrbA-0008Jn-NF
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:27:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83a50788-2a75-11ec-80d2-12813bfff9fa;
 Mon, 11 Oct 2021 09:27:55 +0000 (UTC)
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
X-Inumbo-ID: 83a50788-2a75-11ec-80d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633944475;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Nhj/9AQhuHyYoJKw232vgX+Cae7CgjeZ5eEe36J1kyI=;
  b=e/kWqiURck0DxhX3d90Q0Ii/iM10bxkDGuKXn/j/THpcFGl8bfhKvwNW
   w12CVKrJypDohxI8fWKHrOegwIS3Q/mnhSqCKFR5zI9QPqV5POKWi9UIK
   xhMeZ5stTVbjGwTX3LHwmQgRuBav6Kw2TexKCzXYbykqm1PHl0ggm1YdY
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mXnozezTyWv+DfILVbzqTgn1sy9O41k5aOxcWI+eadU8oM1m13WW1NR2HPtZlCNBzhpatpBZjY
 UvsUZpq9KiXEIpQiqGqho0nxD4OeE6dUrDuV6RUB4MzaNpP8mPLcVJAy4rnbSK+U2Vmm/5P7b+
 RXNjBZCCjn7XNAFrmUIsZwPf9tK+32x15xt8D1raVGWdvdFYre8tLhM44uPDTZZL0sMtXvAZ/Z
 8LhrGKzuVuz6e5tZA14tw1zop7Bg9AM7fVfojFEdKTiT3NWZ6rvnwL1rt94qPnVvjEKhPADTwz
 fguc8MsywMV2+k7T+8KZi9lC
X-SBRS: 5.1
X-MesageID: 54891922
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cz786KkqmOTe8uL3xgQqKmLo5gyKIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeUTrXPqnYYmShKNknOdm28EoP757dm9c3HAI4q30zRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tcx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MUUio7oTS4VArbFpPoAEAFyOH5QOKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gps1pEXTKyED
 yYfQQJjfiWdXTlNAwxUA74Rs+3zxVnYfCIN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKg4eHMySz3yC6H3Eru3SmSL2XqoCGbv+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa71e3R9PwWxm5pn+svRMGXddUVeog52mly7XWyxaUAHAeSTxMY8Bgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZREM48Tn5poyiB3PZt95Fei+ididMTv92
 SyQpS4ywbAal9cW1r6T9ErCxTmro/DhQgcr6y3NU2mi7wc/Y5SqD6SB71TB4LB4NpSIUVCbt
 VANgc3Y5+cLZaxhjwTUHr9LRuvwoa/YbnuM2jaDAqXN6Ry9okGxJYR53A1lLXt3L4UcUxS2T
 krc7FY5CIBoAFOmaqp+YoSUAssszLT9GdmNas04fuaicbAqK1fZpHAGiVq4mjm3yhB1wP5X1
 YKzKJ70VR4n5bJbIC1argv3+YQgwTwi3ivtTJT/wgXPPVG2NSPNF+lt3LdjaIkEAEK4TOf9r
 4Y32yiikUw3vAjCjs//q9N7wbcidylTOHwOg5YLHtNv2yI/cI3bN9ffwKk6Z6tulLlPm+HD8
 xmVAxEDkwqu3SKecFnUMRiPjY8Du74k9xrX2gR2bD6VN4ULO97zvM/zibNmFVXYyACT5aEtF
 KRUEylxKv9OVi7G61wggWrV9+RfmOCQrVvWZUKNOWFnF7Y5HlCh0oK0L2PHqXhVZgLq5JRWn
 lFV/l6CKXb1b185V5i+hTPG5w7ZgEXxb8orBxGWfYIJJBm1mGWoQgSo5sIKzwg3AUyr7hOR1
 hqMAAdeou/IooQv98LOi7zCpICse9aS1GIDd4UCxbrpZyTc4ES5xopMDLSBcTzHDTum86S+f
 +RFifr7NaRfzlpNtoN9FZdtzL4/uISz9+MLkFw8ESWZdUmvB5NhPmKCgZtFuJpSy+ILogCxQ
 E+OpIVXYO3bJMP/HVcNDwM5deDfh+oMkzzf4K1tckX37SN65pSdVkBWM0XegSBRNuItYogk3
 f0gqIgd7Anm0kgmNdOPjyZ18WWQLyNfD/V7589CWIKy01gl0FBPZ5DYGxTa2pDXZoUeKFQuL
 x+VmLHG2+ZWyH3dfidhDnPKx+dc28gD4UgY0F8YKl2VsdPZnftrjgZJ+DE6QwkJnBVK1+V/Z
 jpiO0FvfPjc+j5pgI5IXny2GhEHDxqcoxSjx1wMnWzfbk+pSm2SczFtZbfTpBgUozBGYzxW3
 LCE02K0Az/lcfb40jY2RUM4+efoSsZ891Galc2qdyhf80LWvdYxbneSWFc1
IronPort-HdrOrdr: A9a23:TwT7n6AoyQ4zDyjlHeg3sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dCsai6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsMmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZTbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczOgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxeokPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesXMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO11GkeKp
 gsMCjg3ocVTbvDBEqp+1WHgebcEUjbJy32AnTr4aeuonxrdHMQ9Tpv+CVQpAZGyHqRI6M0kt
 gsCZ4Y542mePVmGp6VNN1xMfdfNVa9My4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54891922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ct/Ri8oX2ouVMKcOo+dGyhQO8m6CQbOHszG+fBs5Bl126SEOcQn2/8bgdKAB6NE2rqeCYv7Mz9l6oP0Uils/I2vVo8De5N47ChRkZTncUvi1WmorSbXxM8ibsc1ouOsi7d8F8yvP2BWcHJlWVf6akYnQDXD/t1GoX58JV8WBd7fC7SsMrsjuBGFtwlJfPRbX9aQslhl5qi08PbQCmsAbo2r07RXhD9qrc+r6QyIFIl9S1IL+nL/WPdC3hIbL0O0V4xgxGuqabxLcOy5jRleIqDX/FokDtH1S4icU4BkkTCZkUhezplQbLPKHbMZqe6/Smy3PXofZ+AKc2phZ5px3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nhj/9AQhuHyYoJKw232vgX+Cae7CgjeZ5eEe36J1kyI=;
 b=Gr1F/dOvB5ma6UTPNWlADO9cHK3bWWUHA4wCOcMS4s0s60F/3P59G0wyXLCmdav+7SRJ1jRXRzVuvT+4nWlA6QcJhzeElLQ4dpvIfx/Zf9vxkv2AkDzuAk+ykrN6JOaGHWQ/LMXQw9comQTplE8EWOGEZn0ZKAWotL2rDxUOWyiNq4Vt7AIT33D8oUM9atm0bYCQxPdHBVwYwMm5yRO1z+Gha4nWFIz62Tgj0weinHvDwlJdPsJdEQ2qzmKhv7RTuBDHHcsm8HEKnlLJGCZw3QgUMcY826LxquWpFxSi4mBGKbQglMDRzuETkUchtWFWr9Zed08cpDFJxzHJao4RDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nhj/9AQhuHyYoJKw232vgX+Cae7CgjeZ5eEe36J1kyI=;
 b=YZDjQWKP62zWdpc1i2th2F7vN117yAZjq4x6sK5Vch/TUAp03UmF0DwAOlHnKrpjLJvDXZcW1wZL+EfD3ZjI68/dFRQfhQY83m43hoIY5r4pfaCbD0WzlP/LmkD/vdgN735BpFlYKN8l2RJd34FoLhQWmj2766cEA3bcY+MpmtI=
Date: Mon, 11 Oct 2021 11:27:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<Andre.Przywara@arm.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Message-ID: <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b362b2d-d6c7-42c4-cd2e-08d98c995c2f
X-MS-TrafficTypeDiagnostic: DM5PR03MB2635:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB26351E99E085AD5FC77346E38FB59@DM5PR03MB2635.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jOHsX8gowVjFeErjg37i5ORKgryZXzJzXhqPwuPj4act0p2j6XR6aHh6qwpiONhcopVIoFQuV+paEFyYVZ4R45MXAytb7IKj44fkrpKaBci3or9bbTDJhX6owP6veupKUSuGB74W1JRW5FfoX1nERUbvhxOoOv7l3RQrK/ALiCHawVCLS0o7TX11uP1Pf6VrvZYlpkGC7OB+hZW3wMjKK9/DyxPAaRn7uGJKYpLvZ08hLAYG5SnlTuMG3jkotVh73zA3mkvbrugY9XYX/nls7DmqGvniGjbm4HVFQzaIqEoBzOIISo1fWpA879qxpCZS+h31s8kAlObJ1ZlIlbsCvjsbTnybyg58BkxoGlunbSJ8OvTu4YSvIl+sfoQHQFdMXZmIAJ1NC923A87GytVTcJPo0S6lDzT/kKWkYWZgapycyIy14miEQxIRiHQzq2jmg96I5Lr7Gap8DKNlBVge8LTH+/qH8gO5Qg/6foaYdz8ewFNP4641IS1yymt59j8BgWjifrkpVpYtePQzajuPIlJWDIJxbw4VSrWs5hQNsvQnN/GUFTYjhqmA6Cdu4Vr6LCqlVol/O546mZWRVY3R2UhmdLsB10vtcO5bkaI+DocsF482bmdvnYNtec92mq4FbJ0o17JoVwsI/9eDlyoKwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6666004)(956004)(38100700002)(4326008)(5660300002)(316002)(9686003)(508600001)(54906003)(26005)(6486002)(4744005)(85182001)(7416002)(6916009)(2906002)(186003)(66476007)(6496006)(66556008)(8936002)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBsK3d1dUhuNFZTMEswODBTNW9zTHdvNGc5cUxiQ0VETTJYc3R1ZS9Wejlj?=
 =?utf-8?B?NEF1UEliY3VzUmE0TjhNOW9ZOFkwaElSaVczbEVUakhVVGRrWFFTVis4NHRF?=
 =?utf-8?B?cWtQa3A0NkM4SEhvVXN1aFNjbEdxL3NKVEFWVlhYZTA3bzBIS2VuTjNPL3dn?=
 =?utf-8?B?cVdkaWtpVENJc2NEa3c0dEdVVXA4NTVZR3pWY241elZHN1M5WEpsVnkyOXhi?=
 =?utf-8?B?TnlMa0EyREhidjl0eGVVaTFYVzBQYjJFN0NPNGxtR3RvcVVZUW5HV3RaTjZT?=
 =?utf-8?B?b01aYjZEV3AzU05NSVVjVWk1dk1YUHpkazZlNmZRUE55VTBJTk5oU3YzSkZp?=
 =?utf-8?B?QTBBb3J2dUlMTzg2aThMR0xvY1EvUnkvZnl4ZWI5d1M0OVY3UnF5MjdUUVJj?=
 =?utf-8?B?bVM1ZmdYekZLWTJqZFl1R3pqU1ZmWkF3Mk84eGZyalp3Y2RQWjlIclVKTEx4?=
 =?utf-8?B?MWVqUEVrSHdWZkVMNWc5cmxDUFA2SitoTVRKdG1RbGo4WHhHMFVXbUFWMFRm?=
 =?utf-8?B?bXRWeEk3YkVVY1BhRHo3ei9JTEQ4VkQ2ajBWdmFEVzNBT1ExVDk3ZG8yb3Ru?=
 =?utf-8?B?NmhXczEza2lqYzVGeWdyTWlxM0V0T0lUV05LOTVHdFF0WFF0Q1lWNFJlbzRW?=
 =?utf-8?B?RXVoYXI4OE1sblkvV0dCcG45eUxzT1plVldreUFmZzJBVWJ5bER6K24xVzg2?=
 =?utf-8?B?eVc1Q1dZL0NjU1FwSGNOSTJoYmIrYnJFRG5HNEVlellNUVB5YkZydkFGQVFC?=
 =?utf-8?B?UEdMYzdtcnZPTk1tck9wKzd0ZTh0TGQrYVloQlJlM2p6QVdyKy8xYzl5aTRG?=
 =?utf-8?B?aERrYlV2ZHNsbXZIN3JMOVZTclpRUUJpYUpJdTZiZWZwRTNrZ2lOaUVqV0lH?=
 =?utf-8?B?VTkxa3RSeTBJS3UxbXlWSUNqejFDRjd1ZUpRQlA1bFZWK2MzQXR5OEhyY0k3?=
 =?utf-8?B?UWptdTU3Y2VlTjNxY2R6MjVjMzRoYzN3OEZhTmx0ZGtaSXNlc2k1UlQwUnVR?=
 =?utf-8?B?czlJYUdqVDlOM2NzTTlOSStjd1BaUmtLdmppTDRVUjdKaTVLUUFidmpCV3Bu?=
 =?utf-8?B?TFBOeDdUMkx3YUVZWGF6alZlL0hYTUMyc2RxdmpJMFo1WTI4cGJsZjQxTVZm?=
 =?utf-8?B?ZDBJVGxpSytJTXZTR20xOWhKbFRGc1JYbm1KTXpFZ1A3R1k4S3E0eGpyYmlE?=
 =?utf-8?B?RTdEZEJuQWFjWlJLWUJYYVp2WEFjMHZIRUxBVTBnZUw5NVlLa3ZYVGlFdFBX?=
 =?utf-8?B?eWJiUDBBamFzNUJnUVpicGF5OGh2Z1EzdlByR1hKZmhuZ0tQTGxQbnRjdmRN?=
 =?utf-8?B?aE9TcmhlVnY0dEZ1dkVydCtpb1lyV1NKUmhMTjltUTMxcTV6K0tZY3ViOU9u?=
 =?utf-8?B?S1o4a2ZKckt2UWpJazB5Q3ZOaEF3dlREZHpxblFKVGtYUC9peHUvdGVLNzRy?=
 =?utf-8?B?RVlaWWs1ZitWMUdNdE5STTNiMml5czZPd1hsNWFZbHMrcEFkcFpvcE41bXdX?=
 =?utf-8?B?Ulkxc0o0ZWpyNExyTEFrUWlKekZiQmx2SGhxQkFnU2JZeHJlV0w3S0VYNXZS?=
 =?utf-8?B?T0VEb1FSV2ZRNlRRbVdZVllCZlcvekNMNHNSMXZrVUhGd09vWU9Ib3dsZ0tR?=
 =?utf-8?B?UkVhMFpZSVFwTjlEdy9ET0NNdU1rcGI3bVFkRWVYZ0ZKbTdHbXg3SkR2d0Mz?=
 =?utf-8?B?ZCtCTEo2a3BhYVRaOFh2ck41elB0Yzh1bmxIa2E1YjcrNitSTUJwYlZuS2Ex?=
 =?utf-8?Q?ABMbli8qNCOPGVFxUljI/yGbWHucCsCI8iK+huk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b362b2d-d6c7-42c4-cd2e-08d98c995c2f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 09:27:35.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdrTsL/9qNQkI9f+f1WxOm0Ogik9TYpQskGNMwZicERhgf3GT9aPUZBDdFx6OGtw9Rg1lTeThAHDqHF9qthKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2635
X-OriginatorOrg: citrix.com

On Wed, Oct 06, 2021 at 06:40:33PM +0100, Rahul Singh wrote:
> Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
> Reject the use of this new flag for x86 as VPCI is not supported for
> DOMU guests for x86.

I don't like this approach, XEN_DOMCTL_CDF_vpci should be set for x86
PVH dom0, like we do for any other CDF flags when Xen builds dom0.

Things like PVH vs PV get translated into CDF flags by create_dom0,
and processed normally by the sanitise_domain_config logic, vPCI
should be handled that way.

Do you think you could see about fixing this?

Thanks, Roger.

