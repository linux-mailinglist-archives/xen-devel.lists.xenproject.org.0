Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED5F666FB2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 11:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475963.737898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFurn-00011B-QJ; Thu, 12 Jan 2023 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475963.737898; Thu, 12 Jan 2023 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFurn-0000xt-Mo; Thu, 12 Jan 2023 10:31:27 +0000
Received: by outflank-mailman (input) for mailman id 475963;
 Thu, 12 Jan 2023 10:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFurm-0000xn-Qn
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 10:31:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41303408-9264-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 11:31:22 +0100 (CET)
Received: from mail-mw2nam04lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2023 05:31:16 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5583.namprd03.prod.outlook.com (2603:10b6:a03:28e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 10:31:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 10:31:11 +0000
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
X-Inumbo-ID: 41303408-9264-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673519482;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fgzrP60jBfGrPQdP/DsLEQGZ1cWMKjUiLE91ksIgTHc=;
  b=JI4sHJFzIR5sWt75qRaNkAeGjZUPqPbXOsxx64t3S3JDlA344yxP2r3j
   AhJE6Jujd8/iChJidMuF4ICL0aQbMZV0SqL+ukdwEBe5AumMFMPjOePLM
   Q4VxxMwiEAsAZVe55xIlR7ML6XrwwDYB5uxXnANXPhCKrDaWBqhBh4D/c
   g=;
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 91215629
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Yl1OgarzlFnY5nJ8W73dSnufNq9eBmIpZBIvgKrLsJaIsI4StFCzt
 garIBmBaKmKNmSmfYpzYYvlox4Au57cn9VmTQQ6qCgxRi5Go5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHziNNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADMmbkuGiL6R+riEe7J8rOU8D+36AbpK7xmMzRmBZRonabbqZv2WoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OraYWIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpr6Qz3QPJlwT/DjUndmWCodOesneldNxxL
 EAm9XILsIMtoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ21
 1qhj97vQzt1v9W9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJuuPC4awh9zxXDTvm
 TaDqXBig61J1JFWkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshVZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:nJmgaatOZBz9ZcLVw896ER3B7skDctV00zEX/kB9WHVpm6uj+/
 xG/c516faQsl0ssR4b9+xoVJPgfZq/z+8X3WBhB9eftWDd0QPDQb2KhrGSoQEIdReOktJ15O
 NNdLV/Fc21LXUSt7ec3OBgKadE/OW6
X-IronPort-AV: E=Sophos;i="5.96,319,1665460800"; 
   d="scan'208";a="91215629"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNxOq3D+U3iDH941E8zovEiXM9wvX9hNhC+g/NGLvoPwRc3LNZX0vgwvE/KX/BlQVXKOp0IxOCZjAQk8slVoZEvepU3d5jp5cAOikEi2XgHhOax2pInFj3AxinFhcxGJtP8h9aWhIrPXqaH0SO/Z2Fl391fvD1Fyv19whmoGTiKKOCIUHQlrWU7As6YDCPOhcoZu4JWEMFaycauPIjw3m9Cy67k9EVFCe6tJEG2IEv2cRBS/HoX15NxkrXKr+sRwqs1DIqbKLE5GBe/mKGJk4gFGtyCu7JOjgQF0TnU7sPLxoe/+6vx7C4QJnWb9u5qUlfNeOzp7+C3Qt0jOF8KDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgzrP60jBfGrPQdP/DsLEQGZ1cWMKjUiLE91ksIgTHc=;
 b=DZNZViFJ4rS9YeMGjGfD6zO9QWZqPFvVQT6hEEVjCT8x+9m04mAY8gltzilZhID69Nldxo7QWtJgEXLKy431qL3uQ+XZdjF2RnM5gpnEdtsfB6NmfyF9N57zQ+sJQ2hVq9IdtC47SxDHPisq7o+2XixpbBT51bLBkIDV+kq0XhOWbZY69Zhajx+Xiftx+TN3zMZJDutFGFPAzz4lB61aG9UMFdQvp7uzk4WsWuD37PJd9Zn4K5d+pFR5iRL+kx36AHIZ8NPcOsNxCe6p9GCTPmTutJsSCE0NAQoyXzo8h0GHV12LaNOlDt5imAXTViQ33TCdrzHqWlvy+13eZ35hQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgzrP60jBfGrPQdP/DsLEQGZ1cWMKjUiLE91ksIgTHc=;
 b=VWhPrww/PH1ilJQdK4Pqxn56W8yFFgctKvJNFVqws5ztJ6wI8YXNYLkU19W4vFOT7l2PfOw9xBeSYfZJPNvKpOSZ283HTq6AUeclkKeL06Fk/xeCAFgIbEFb5UAE4bSibLs4MB8PuUrJAugY6I80dEJp1fifGgjnDSUaYtJNitY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Thread-Topic: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Thread-Index: AQHZJcS6xQlTtpJxX0O79yAhgOZJ+66Z2cOAgACwbwCAAAw+gA==
Date: Thu, 12 Jan 2023 10:31:11 +0000
Message-ID: <71e7ba34-f1ea-16fd-ec01-bb2aa454270c@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
 <c5d201ac-89ca-6baa-d685-5bef2497183f@citrix.com>
 <a438f16b-7d45-d7e4-2191-4ed7b2077785@suse.com>
In-Reply-To: <a438f16b-7d45-d7e4-2191-4ed7b2077785@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5583:EE_
x-ms-office365-filtering-correlation-id: 6ae85160-01c9-475f-f99b-08daf4882017
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1DdEIbxbTTfjaVOA/r16rzbzt6MYI1qHwQILOyXoT7yiqeKDoqOwfG4mKf45Ynhd7AhuHzeQjGng3i695QExpkz9OMBzuumEZ8GXZYZSW30VZwnZuphVeesXkWM6kcv6frsoBYmiXIZEHTIhDtUs53fpfohIcMw+Zt6xV+hXF9wPA7d+YTvrjOFZCMHOLg4HNtxyRPYdqE9ROOid4VPXUlo6boHl6SERNjeljNHUvobqRUPZhElvQ6jz1UNJ1iRycLi5IYviQORCbAN7giAU9p54BPWSh2WbDUgIuCxXCp1tw7+V0HA+XcBDtwUDE8Pc5R9B96bQ5Mv/XiISX+pGzx2HAeDSLGMo781gZ5UAEw7fvMxH5OConxeVjG7v5IO5YsQBqeQLGW5RuDUP/BrtOe6LW8AgpQUU8xATFcyXa3yJrK1keCQhe6guc0odzRjOJvc/LAKRGrul0eTohedBXy6ziqzjT6A2ovb3bRF//x2vxJ9DuvrWyosOVsQUhliAfUxN2x4nGTFYrOLjGNNf1sjHFdXGjCk5qNtr4c1UjVYzXD61GuEMkPFX9FyzdTrkREhPxNnPWmxx4EJSxaVN3NAiBFiiMzwf+dl+c8M2oniYquRQUvm1vUoH4fAYyPvOLVPTzyjmZaUey62Lm/HXGthcn9EB9050PLNPdRChWjP+97ZEoE7jLwu+gcUi00DfsfueDFOBklGrdOMd2dFoxTlmQ4BkSrl6y3pKDT4GLuamDoxnsCv+OfDiyZyElYL/z8ujY5WjwpfPUxQ1i6pgLg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(2906002)(83380400001)(478600001)(66446008)(66476007)(64756008)(66556008)(5660300002)(66946007)(8936002)(53546011)(122000001)(26005)(36756003)(186003)(6916009)(6506007)(31686004)(6512007)(6486002)(2616005)(82960400001)(41300700001)(38100700002)(8676002)(54906003)(76116006)(86362001)(38070700005)(316002)(71200400001)(4326008)(91956017)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHlqay9LOElYMWgwcjdEM3FMSHVYY201OEpJODRqNEttWHFuRzRQNHVZZnFX?=
 =?utf-8?B?ODhTVVV2ZktPcGtPWWZiOU8wSTZmWmdDMHp6blBrS2srY0Rpem9SdjhyeDBO?=
 =?utf-8?B?ZUhMQnIzSG1tTjB5UldXU0VpVEl0R0tIZkJ4ZXRxam43c0piMHlzY3FGOHFm?=
 =?utf-8?B?RGY4MUlOSXdvd04yR0Z6L1VtZFBKVWRyMFpZNjFXZXltU0oxaEJnMWhJeWt5?=
 =?utf-8?B?Q21hOUVKcDlveUZMbTVoK0Z3MldURGNTUGtCVFNhU0d1ZVFwVUtFbEtmU1Iy?=
 =?utf-8?B?d3hrQ1dLQXdMdjZaakFscnZoUFBwS2lpVmJMSG56b25WbXEvMGFaUXV5QW9z?=
 =?utf-8?B?akdaM0phWWRERFdGaGVXMnE4Vlp5OWVyOUVXQVc0eG1QR3N0aE5qcDl3R0hV?=
 =?utf-8?B?REdhL2w2SFBFamM1dkU0VldBNkhZRktYTXRCRkVlcTQyUGFBenpYNmlqMnlw?=
 =?utf-8?B?SUhiNXo3TmEwS3ZvbGYxZWJjelNNWGVBcGd6WUxVZEFuMzlHckM4ajFBanhL?=
 =?utf-8?B?Q0tpaGEvVHY1bVN4Zm81MDlDRms5YUtjSTBNNEdEVUVwekxqZzBoblplSC93?=
 =?utf-8?B?MUpqUEpFY2MyL3g0MDBBSHd5MFJ3VGFHZlZyem8zbWZ4aEY5NmpQYWozTTgz?=
 =?utf-8?B?cldiYnJxRU5YaFJQd2FjNlVnWXBJbjRHYkU3WUwxa3l4UmNDZEQrb01pOHUw?=
 =?utf-8?B?VVNNcUlKZmJ4MlBNbHRVNFM5bmhyTzRpbUVYUzZoYjF1bnNuTDV2ZXdJbmRU?=
 =?utf-8?B?UUVBMVZuV3lFZUcxNHY3Vmhyb0J1OWRHanREMUtJaDlhcS95ZVNTenhsS1p2?=
 =?utf-8?B?ZUF3ckpMSXlobURrTFdhK2lTRnlwUkFRU3NrKyt4SXBJM3MrM2h5UGV6ZkRm?=
 =?utf-8?B?amFRU1BRdE5XeVdCSTQ0ZmJlLzVTUkhNT2hkOTZ6RUxqSCtiSXU0dmRkNWE3?=
 =?utf-8?B?RTJMSXlWTVVBMUh3RGdmNnQ3R1QwK0pFRjIzR2V0SFU1aXQwRDZDSVhVMGlF?=
 =?utf-8?B?b016NVpoTzYvMEVCWmJadU9nWk04Wmw0NWR6MkRPQTBZOWhBS0FwUXhZQkRX?=
 =?utf-8?B?SHFHS1k1djB4aTlhcGdFaTlSY3J2bUtWOFR5UFpnRk9Zc2hycjRHM3ZRK0Np?=
 =?utf-8?B?OUZCLzZpdGhiTGt2RXhWWFNYMW80TFBkeVdSZDRNV0xvZDZLVXI2N3FoaHRO?=
 =?utf-8?B?TDRpMnIyQktGQUhuTW55dkFIbENNMm5jUlZqQlNGakpML0kwL0NydEdDelN1?=
 =?utf-8?B?bjVSb0JxSEdqSjNaQjd4L2sxMjJGeVFiVXdmTGdmVHZWRWU5eW9RMW9FaTRV?=
 =?utf-8?B?bFhCZmpmOU1xK3FSV2M1WTUvWVpURDRQSWZJTzQ1eUFKV1ZzTFdJdlE1bTVX?=
 =?utf-8?B?N2ppZVR5WXI4NWtaREFMODJ5aDM1YS92MGErdUgwa1ozS3RnVmM5eDNiTzBM?=
 =?utf-8?B?Q1Q3em1Odnl0T1dhc1dPSVFwcGhoUkxwZVVPV1FKWGxwdmREWnA4RlNOSllM?=
 =?utf-8?B?VkhnbDYrTmNDNWk5SkFmWGxsaUJ2NUFHcHRyZUtWK0h2RVVkVi9ubk53dC9h?=
 =?utf-8?B?aUdDS0hwaEVFV3VFd0JXaUtQb01kL2puRDVuK1dNQzFNZzNGNUFGQmhHSzZp?=
 =?utf-8?B?eDlwWG1wa3RHejcvWXFHWVpGeThtbm1LeEptVjJiRjlSYXI1bXY1ZE5zN2dj?=
 =?utf-8?B?eFRZMEZaV2U0VTlWald6UXlrcjZ2aXdjSzlkOGJOb3dGQ3ZUQW9UdjVJMG1w?=
 =?utf-8?B?MnB6c1R6TVpkVWpNeUdVeDcyWTZpamtOejdhRTFGUms2ejc3bzMvMFNYRTJl?=
 =?utf-8?B?TTlJUmg4WnZOWjEzdDgzRWkxTk93VmJyQTUzUzU3Y01ZZFlqdkxwbHFzbkZo?=
 =?utf-8?B?SkJrd05abEVFVE9neEhCZDhQVUx6SElkNklFM09UNG15T2xIMjFTQ2xZdmNk?=
 =?utf-8?B?QmtWc2lDSjBqNkhYbitmWm15QWFCUEF6Z0l0NFk4dURMNW51bzRiQytOWGVt?=
 =?utf-8?B?bm9qa2ZuOExrdVUwcDFpVDVUWklQTFRmTUpubXBPTnk5aW4wS2piaVI1L0pu?=
 =?utf-8?B?a2t4VTBOZlFPY25uZUxxeSt1eWVQZEVCVmNmUVNiemM1YnArSnJMZ0ZrZ3lk?=
 =?utf-8?B?YUZSaGFWOUYycUlGeDZZNnphQjV6dzBjcEc1aW1lUmJsTUV3K3ZXUWxYdmg3?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D87378AB7FF01843A7B8D2CAE6A245D6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PnGkO3gOH5CnaCCXwf9Uhla00rhxcIJfvnpH4gkKr7ltwTF3lgrOU/fZfr+0L6QfYGYfAkSdoSQLGXsc3il/MoXoVX/FbifNy6bASw3DJ9b0i7GxK7+/quq9YHQiqB8WMGCN85/TkxQmmfLZiuAi170zr/utOarq9FCZFUUW4ZMpD//maGniwTZAgyzAwNcIb7B0Ha4F3unztu2Ft8F/CYMC9J17MNgK/218RnYixecoyFIX5RJgY9irIdurEvehu0BNGGUmH6Zfc1WYc6TMkoHGkR1WC9wNGJELCVHzITGLyEgvpeLbtlqt1RD0gNIn+fbyTqtMNt5Sh5KbcWNETsx9Cbfvh+bybof+1AIvVZCWpyitsHLakqyjXcRd5GclbuJExoBl/XIdIUu/D/Q6rcT+Xha3RQ1El4qS66MYr8OBKbBN6NQANDVwPcZ37TC0CpsDe4ZqoE3N0wPapMyIoeRpRoHX2GubwtyRJMN+2REgKpLdN7B4JGq15T7irW67xbfOsIoPJDBNqHRcaEWnEV3EVwbxo5Vf3ZYa0q3YYvj4yvR9ayg7vaEoaQVNZv5/SrXY2TSKR1jsGSwG8fFG6ei23h9iiXrndQAj2DzcC6mBrbzydZJfdbJYgq9cddwyCA0gZvwIpGzBhIaJ7jGxT9smZwEoTyy+CDEdTTw1N06j4E8I9U7L2O6ixqT1e4LjoSNI+i6mwl7YuqvX2bnK6Yn73xjM0ptKH2UbCi3co9XNIVPuw7SA31gasGD9NOWzRKkKMmajMwaVr+lgBxHWuC2wUjA0Us3xyk1tIbcrEigbrVKGY1wpv3rkE3h30b7/3zae7yNX35MSx15el4/UIA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae85160-01c9-475f-f99b-08daf4882017
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 10:31:11.7362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3rtaEAab+OuZHdVhCRTDSj7jTqESYBkzTjMzHXwBR79QrguMcGUeMNd0QBG0cYYfJJIGdndMtxMIFtP3ehhd9JxipQ3ymtDmCMgABEgzf7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5583

T24gMTIvMDEvMjAyMyA5OjQ3IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDEuMjAy
MyAwMDoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDExLzAxLzIwMjMgMTo1NyBwbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gTWFrZSBIVk09eSByZWxlYXNlIGJ1aWxkIGJlaGF2aW9y
IHByb25lIGFnYWluc3QgYXJyYXkgb3ZlcnJ1biwgYnkNCj4+PiAoYWIpdXNpbmcgYXJyYXlfYWNj
ZXNzX25vc3BlYygpLiBUaGlzIGlzIGluIHBhcnRpY3VsYXIgdG8gZ3VhcmQgYWdhaW5zdA0KPj4+
IGUuZy4gU0hfdHlwZV91bnVzZWQgbWFraW5nIGl0IGhlcmUgdW5pbnRlbnRpb25hbGx5Lg0KPj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+
IC0tLQ0KPj4+IHYyOiBOZXcuDQo+Pj4NCj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93
L3ByaXZhdGUuaA0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvcHJpdmF0ZS5oDQo+
Pj4gQEAgLTI3LDYgKzI3LDcgQEANCj4+PiAgLy8gYmVlbiBpbmNsdWRlZC4uLg0KPj4+ICAjaW5j
bHVkZSA8YXNtL3BhZ2UuaD4NCj4+PiAgI2luY2x1ZGUgPHhlbi9kb21haW5fcGFnZS5oPg0KPj4+
ICsjaW5jbHVkZSA8eGVuL25vc3BlYy5oPg0KPj4+ICAjaW5jbHVkZSA8YXNtL3g4Nl9lbXVsYXRl
Lmg+DQo+Pj4gICNpbmNsdWRlIDxhc20vaHZtL3N1cHBvcnQuaD4NCj4+PiAgI2luY2x1ZGUgPGFz
bS9hdG9taWMuaD4NCj4+PiBAQCAtMzY4LDcgKzM2OSw3IEBAIHNoYWRvd19zaXplKHVuc2lnbmVk
IGludCBzaGFkb3dfdHlwZSkNCj4+PiAgew0KPj4+ICAjaWZkZWYgQ09ORklHX0hWTQ0KPj4+ICAg
ICAgQVNTRVJUKHNoYWRvd190eXBlIDwgQVJSQVlfU0laRShzaF90eXBlX3RvX3NpemUpKTsNCj4+
PiAtICAgIHJldHVybiBzaF90eXBlX3RvX3NpemVbc2hhZG93X3R5cGVdOw0KPj4+ICsgICAgcmV0
dXJuIGFycmF5X2FjY2Vzc19ub3NwZWMoc2hfdHlwZV90b19zaXplLCBzaGFkb3dfdHlwZSk7DQo+
PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgd2FycmFudGVkLg0KPj4NCj4+IEZpcnN0LCBpZiB0aGUg
Y29tbWl0IG1lc3NhZ2Ugd2VyZSBhY2N1cmF0ZSwgdGhlbiBpdCdzIGEgcHJvYmxlbSBmb3IgYWxs
DQo+PiBhcnJheXMgb2Ygc2l6ZSBTSF90eXBlX3VudXNlZCwgeWV0IHlvdSd2ZSBvbmx5IGFkanVz
dGVkIGEgc2luZ2xlIGluc3RhbmNlLg0KPiBCZWNhdXNlIEkgdGhpbmsgdGhlIHJpc2sgaXMgaGln
aGVyIGhlcmUgdGhhbiBmb3Igb3RoZXIgYXJyYXlzLiBJbg0KPiBvdGhlciBjYXNlcyB3ZSBoYXZl
IHN1aXRhYmxlIGJ1aWxkLXRpbWUgY2hlY2tzIChIQVNIX0NBTExCQUNLU19DSEVDSygpDQo+IGlu
IHBhcnRpY3VsYXIpIHdoaWNoIHdvdWxkIHRyaXAgdXBvbiBpbmFwcHJvcHJpYXRlIHVzZSBvZiBv
bmUgb2YgdGhlDQo+IHR5cGVzIHdoaWNoIGFyZSBhbGlhc2VkIHRvIFNIX3R5cGVfdW51c2VkIHdo
ZW4gIUhWTS4NCj4NCj4+IFNlY29uZGx5LCBpZiBpdCB3ZXJlIHJlbGlhYmx5IDE2IHRoZW4gd2Ug
Y291bGQgZG8gdGhlIGJhc2ljYWxseS1mcmVlDQo+PiAidHlwZSAmPSAxNTsiIG1vZGlmaWNhdGlv
bi7CoCAoSXQgYXBwZWFycyBteSBjaGFuZ2UgdG8gZG8gdGhpcw0KPj4gYXV0b21hdGljYWxseSBo
YXNuJ3QgYmVlbiB0YWtlbiB5ZXQuKSwgYnV0IHdlJ2xsIGVuZCB1cCB3aXRoIGxmZW5jZQ0KPj4g
dmFyaWF0aW9uIGhlcmUuDQo+IEhvdyBjb3VsZCBhbnl0aGluZyBiZSAicmVsaWFibHkgMTYiPyBT
dWNoIGVudW1zIGNhbiBjaGFuZ2UgYXQgYW55IHRpbWU6DQo+IFRoZXkgZGlkIHdoZW4gbWFraW5n
IEhWTSB0eXBlcyBjb25kaXRpb25hbCwgYW5kIHRoZXkgd2lsbCBhZ2FpbiB3aGVuDQo+IGFkZGlu
ZyB0eXBlcyBuZWVkZWQgZm9yIDUtbGV2ZWwgcGFnaW5nLg0KPg0KPj4gQnV0IHRoZSB2YWx1ZSBp
c24ndCBhdHRhY2tlciBjb250cm9sbGVkLsKgIHNoYWRvd190eXBlIGFsd2F5cyBjb21lcyBmcm9t
DQo+PiBYZW4ncyBtZXRhZGF0YSBhYm91dCB0aGUgZ3Vlc3QsIG5vdCB0aGUgZ3Vlc3QgaXRzZWxm
LsKgIFNvIEkgZG9uJ3Qgc2VlDQo+PiBob3cgdGhpcyBjYW4gY29uY2VpdmFibHkgYmUgYSBzcGVj
dWxhdGl2ZSBpc3N1ZSBldmVuIGluIHByaW5jaXBsZS4NCj4gSSBkaWRuJ3Qgc2F5IGFueXRoaW5n
IGFib3V0IHRoZXJlIGJlaW5nIGEgc3BlY3VsYXRpdmUgaXNzdWUgaGVyZS4gSXQNCj4gaXMgZm9y
IHRoaXMgdmVyeSByZWFzb24gdGhhdCBJIHdyb3RlICIoYWIpdXNpbmciLg0KDQpUaGVuIGl0IGlz
IGVudGlyZWx5IHdyb25nIHRvIGJlIHVzaW5nIGEgbm9zcGVjIGFjY2Vzc29yLg0KDQpTcGVjdWxh
dGlvbiBwcm9ibGVtcyBhcmUgc3VidGxlIGVub3VnaCwgd2l0aG91dCBmYWxzZSB1c2VzIG9mIHRo
ZSBzYWZldHkNCmhlbHBlcnMuDQoNCklmIHlvdSB3YW50IHRvICJoYXJkZW4iIGFnYWluc3QgcnVu
dGltZSBhcmNoaXRlY3R1cmFsIGVycm9ycywgeW91IHdhbnQNCnRvIHVwIHRoZSBBU1NFUlQoKSB0
byBhIEJVRygpLCB3aGljaCB3aWxsIGV4ZWN1dGUgZmFzdGVyIHRoYW4gc3RpY2tpbmcNCmFuIGhp
ZGluZyBhbiBsZmVuY2UgaW4gaGVyZSwgYW5kIG5vdCBoaWRlIHdoYXQgaXMgb2J2aW91c2x5IGEg
bWFqb3INCm1hbGZ1bmN0aW9uIGluIHRoZSBzaGFkb3cgcGFnZXRhYmxlIGxvZ2ljLg0KDQp+QW5k
cmV3DQo=

