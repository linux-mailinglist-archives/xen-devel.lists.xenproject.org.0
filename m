Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC44C13F6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 14:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277374.473841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMrZN-0005Ue-OC; Wed, 23 Feb 2022 13:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277374.473841; Wed, 23 Feb 2022 13:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMrZN-0005S2-L5; Wed, 23 Feb 2022 13:20:37 +0000
Received: by outflank-mailman (input) for mailman id 277374;
 Wed, 23 Feb 2022 13:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kuj0=TG=citrix.com=prvs=04643f8d1=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nMrZM-0005Rw-Fq
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 13:20:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 604c7cd6-94ab-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 14:20:33 +0100 (CET)
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
X-Inumbo-ID: 604c7cd6-94ab-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645622434;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=t9Abt5HptcfiUIJQojnXAevW1MtOFNqCDIv2Owt+/UU=;
  b=DJSb7ea7qgn3+Ho5PnluPKUMXtqbnwSQFBKz9AbeWsY//Auvg4jE7f+L
   1TtWhnR7yrNAim8I0fbSacKrB4UH308Y0DR7fwYOXiHF/4QTNDNjkKsLx
   owkSg9S9+Fy9Kh5/5bNtSRtTyBXFzAmWgetWv2oYnwjP+eG8kSsZKATs0
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64698782
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pdBA56JmW5LMRAodFE+Rz5IlxSXFcZb7ZxGr2PjLsTEM7AuW5UVEl
 zVBCC3DeKqUMyGmS21FGIS3phgF7JOGnNQwSgBsqSpjHysQ8MCaX4vBdBf6NHjNd5zIHRw5t
 MhONYaQdcw5RXSMrxmgaea58HIm2PmEF7aU5IIoQsxUbVYMpHAJ1UIz8wJAvrNVvDSZP++sk
 d35/pDRYgX70mErY25Et/vb8U8+5K2r42oSsw1iNK1A7QPSz3UbMskSdPq7R5farii4PQIYq
 8LrluzRErbxpk91Yj+duu+nNBVMGNY+BCDW4pZsc/HKbiNq+2pigs7XCNJGMR0N02/TxIgro
 DlwncfYpTkBb/WkdNs1C3G0IwkmVUGR0OaaSZQXmZX7I3zuKxMA8d03ZK0FFdRwFtJMKXNP7
 ZQlxAUlNXhvsQ4ULIWTEYGAjux7RCXi0Rh2VntIlVk1Bt5+KXzPrjmjCXa1E17ci+gXdcsya
 fb1ZhI3dDPLZB5rCmtNJ5UuxuLyqnz0eDtH/Qf9SaofuwA/zSR02bnpdtHUZsaLVYNemUPwS
 mDupjqjREtAbZrGlGTDoinEauznxEsXXKo9Gbqi+fMsrECVwmULIBYXSUG6sb+yjUvWt9d3d
 RBKq3px/fJaGEqDXNWlYQaei0K94TFMS9VZENYY8C+/4/+Bi+qeLjddFWMQADA8j+ctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxRuwJCwUIGkqdSICCwwf7LHLv4YxkzrOSMhiC6+/itDpGTD2z
 CuOpSJ4jLIW5eYU042r8FaBhCijzrDZQwhw6gjJU2aN6gJieJXjd4Gu8ULc7/tLMMCeVFbpl
 HoOltWa7esOJYqQjyHLS+IIdJms7uyAOSfRgnZuGYcg7DWn/3O/fYFW7yp6LU0vOcEBERfiZ
 0rWuB9N6YVIFGuna7dtZIC8ANhsyrLvffzkSfL8ftdIeoJ2dgKM4Gdpf0H44oz2uBFyy+dlY
 87dKJvySyZBYUh68Naob78F9rQsxQQO+Tn8QoChyk6L1LGVYmHAHN/pL2CyRuw+6aqFpiDc/
 NBeK9aGxn1jbQHuXsXE2dVNdA5XdBDXEbiz8pUKLbDbfmKKDUl8U6e5/F83R2Byc025fM/s9
 2r1ZEJXwUGXaZbveVTTMSALhF8CsP9CQZMH0c4EYA7AN5sLO9/HAEIjm30fJ+VPGAtLl6Mcc
 hX9U5/casmjsxyek9jnUbHzrZZ5aDOgjh+UMiyubVAXJsA8GlGUpIe0JFewpEHi6xZbU+Nk/
 9VMMSuBHPI+q/lKVp6KOJpDMXvr1ZTipA6CdxSReYQCEKkd2INrNzbwnpcKzzIkcn3+Ks+h/
 1/OW38w/LCVy6dsqYWhrf3U/u+BTroldmIHTjaz0FpDHXSDloZV6dQbC7jgkPG0fD6cxZhOk
 s0PkamnaaVfxAwiXkgVO+8D8J/SLuDH+tdy5g9lAG/KfxKsDLZhKWOBxs5BqutGwboxhOd8c
 hnnFgVyUVlRBP7YLQ==
IronPort-HdrOrdr: A9a23:ijFVu65kvhcQ6rMLsQPXwXmBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qADnhOJICOgqTPuftWzd1ldAQ7sSlLcKrweQeBEWs9Qtr5
 uIEJIOR+EYb2IK9foSiTPQe71Lobm6GeKT9JzjJh9WPFhXgspbnmNE43OgYytLrX59dP0E/f
 Snl6h6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKXSSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8y/T9aw+cyjpAVr4RGYFqjwpF5d1HL2xa1O
 Ukli1QfPibLUmhOV1d7yGdnTUImwxelEMKgWXo/0cL5/aJHA7SQvAx9b5xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa3XZdMRIZ4J8uZlFkIMIjgYVq3MQiFYJuYeM9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonVrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB7aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOZNSRP5uw9zvngehTOYd228LAs23FQgMyIeIbW
X-IronPort-AV: E=Sophos;i="5.88,391,1635220800"; 
   d="asc'?scan'208";a="64698782"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It9xbV0zvEBNBAocYozZ0r12hVOuj+dMe5Zn2XTLFJomH2Cogmd+wk5FGg2opC58Eckbtb4/t1kBp/wHCGZ0PGpvRX7BhsNTZPYJPV9+OXvPnLoyKUEXn1Ntvmd2p+KV4XX4bJU7/ndSkzN6IMGOAgqDCKTglu1RV4hc/xvtWHVYuMAK+WwAdl2c8K7Gz+aUxUjaZRtnXUZdA83NdnXfKg2tF5hj6fg07ydcq8jaUCds5tltsHZEskPT1o38+HWu532DBi7C5IXrw0XVCks92Pt7DHZl07SrNVYyZjf0eb1H1iF2igVzIqvwOXzMLriN94ece2dzsQ1CDHZa2lgj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaA0pvouXxcedgS0dwikwDh+3s3XQh7JbYVRgKIjLFE=;
 b=H+j73V/UIc18gZW1BklmLcEzffuNXisHvw0c4GsKgmKUOPOV8zRd5k8hCX6hd227QGMtdkqltZ7jTi9uhvd0eIKVEFVfCyldKWFPU/Z0tYDTu9Iddx79OvKhhxaiHa2lz6yLGpDpHj2YvhowM1H4laaT1hxz56Wvzv7Ey+vzQT5QQ+BIyrOmrRwinqBXPSLuRpJ8cO/waZPDVSI5zwT9uALgh5KEk7WJoQxpzlPHPefB9kmBJGW7kL3I6lkzlFr9LuZ0yTDKY++5j0Wvm3exg1iMPezfxmHz4qw8cno1fWkEHAZeB1xBsqEd6mZTk3GkE8TxvgOLKloQI+anixnWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaA0pvouXxcedgS0dwikwDh+3s3XQh7JbYVRgKIjLFE=;
 b=vtu3Z5znwi2Sser42YmXi/gTifLtRIDDwaeIXPueaZfBY1EIRrS8Z3mF7g1EaYb0NX0vYCUensRictU5k6YBsxelbdy1GED+y/OzGOMbUs8+qEO5THp66QEvAT3ULf5ClnvH0fiaefMJidZKbLxFplJY/ePYHWKFcsALuY5iu1Y=
From: George Dunlap <George.Dunlap@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Wojtek Porczyk <woju@invisiblethingslab.com>
Subject: Re: [PATCH] RFC: Version support policy
Thread-Topic: [PATCH] RFC: Version support policy
Thread-Index: AQHXkDev9/QrG+8IgUOEs2JU9EeShqt6ldOAgRojewCAC/K9gIAALOIAgAAB2YCAAApzgIABanSA
Date: Wed, 23 Feb 2022 13:20:26 +0000
Message-ID: <17643780-C062-4565-B05C-7D42745B5BC0@citrix.com>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
 <YhTUe7K5/rlek4AA@invisiblethingslab.com>
 <77CD0734-A343-45CF-8A44-5C53771E404A@citrix.com>
 <f5c50526-2fdc-029e-751d-eb05b29a8366@suse.com> <YhUEc+Ztwf312ZRx@mail-itl>
In-Reply-To: <YhUEc+Ztwf312ZRx@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bc1e77a-919a-482a-fd6d-08d9f6cf416e
x-ms-traffictypediagnostic: DM5PR03MB2764:EE_
x-microsoft-antispam-prvs: <DM5PR03MB27641DE9FA0EB973E3305111993C9@DM5PR03MB2764.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0cpV8xfashwERsrrCEVGn8x0l77DBeEac6SrT+TlG2jeb71DKLjohay8GWcy+ntTmPajfB4byycr8eH8fvGyTk/3J2DKqLSK14RExIFdO5GDonx09/GDW+hcj46FeO3HEH3XezgE4lArE3J8pxeBzUB0Xi/bwdT5yGO3jtzz1ZOE2SBrn0CuL8TrqxGmVUDhtILfkelDgeV7N/DZgUa+WARrWLE6S6OIoz2TojWxcMMvWbJMIPmpziR7WQI44YP5tDsIZ2g1hpbHTa4zrwIJwQf5aZ9+13XwxWMCanBtmPrHOTQvAvFVmBx7ep5iII/BLnl4EPIg0PB61jAYeryuji6Ks4n42KkbLXGz6WapfJ3NGZL8xPKaGE9c/xt5ifxQafWK0A3YhuZr0Qi6SFw0AaZsrv4Le980O4hmuh5K8j9sWWDj/TEuoExNUA7pikcIKAPiDISqd0+x78KilCyPhMjApdqIhiJY30QIv/RR7RnTu0TBGcVUlf4/P02EzExFa0W3Em26gFs9rZDXWJkevQ9tcoeCvu0I7QAaj5SGX2MQ794UVo51ip42tm11FMOAyZWfZ5bPWOB2BAuUJWPwMobk10JcZF1lM9ENTXINL2uU3gJubxOpNJpRgzUq+COs9iMpf8MMNwf18IN/ctutqTKf+BgCdEzDyzV3tvAhWLQ31mto8hDwUrCmlGODuLJE5pSog40YSS+lFt43m+pDClKkBjiZayJ0bJISN4wYm+g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(2906002)(2616005)(122000001)(33656002)(38100700002)(186003)(26005)(99936003)(38070700005)(64756008)(66446008)(6512007)(8676002)(4326008)(66476007)(66556008)(91956017)(66946007)(76116006)(8936002)(36756003)(6506007)(6916009)(54906003)(71200400001)(508600001)(6486002)(53546011)(5660300002)(86362001)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnJNNVNwN2RGZVRwMTdMMDdKb0d3SjFwY1VFODV4OGFqQUZXZVk3Nm9NUGZQ?=
 =?utf-8?B?eHFCTFQyM0xDaWpMNHYrUndnaXpNMHpOK1F0Vk1MWlNKbE54Z3hkbE9IZzRY?=
 =?utf-8?B?aXllTnhsNG9ydU9lTGI2YzZOTG93cHhrTlh2dG50NkFSSENsOVVzeEFEMHAv?=
 =?utf-8?B?S1lQMnhPdlM5WkhMTm1TaTU5YU9ua0lkZGtTUjdzTGF6WlZtWjhoK0lxN0R6?=
 =?utf-8?B?WE1EQ2hkaHdFQjZkYXJkYzNWUUpPdldDaFVMcm5vNmVwMVZid0RVSGNwU2U2?=
 =?utf-8?B?R3BNRzRtVkk1NnhaYjRTVUgrK0dFNHArNUVLRzlzeTJJWGxYcTlkaHRPbkZa?=
 =?utf-8?B?UEoxb0tRMHllRVRyZlV2VkNNeVVQU1pqVWh1a01NVVdWRmNBTS9ZeklYL1Ji?=
 =?utf-8?B?Vkxnd3ZMUkxSbUp5SDBYR0FMMFZVMXJPRFNRdmJrUG9VcFZLT0x4SUtDVlpQ?=
 =?utf-8?B?TXZrYnd3U0F4WkpacDhkV0RPbU9sODFlT3lJb0gwM0lCZ09EZzJieWpqdVpo?=
 =?utf-8?B?OHNOMW14TXVhWVFpajhHamtXaUlHbGR3R1hGVG96SGFnWm9FdWg4MndSWFp2?=
 =?utf-8?B?QkVscmdXOFhyNVkweFkzaXhmUFd3VjJINWMxSUYrNi9kN05aOFlCTUo4enpz?=
 =?utf-8?B?Q2dyd1krRjQ3bStaNVFuWGxnRnFETUdUSUxWaXVId09OaFpHd3NqbVhCNGtJ?=
 =?utf-8?B?QzdyWXA1eTVuQUhKd1piT3lJWFpnSS9SQTF6bUJCTFRvd3p0cUpWWDBqamNa?=
 =?utf-8?B?VXd2ckJhUkY4NC9Ecnd1R3ZUcDBpOWp4dUJEUlpoSHRDbERaTUxVS3YydnVX?=
 =?utf-8?B?UVlzZndma2ljK1JVNUQ1bTRFMlpIeWtsdU9lSG1lMEpwYlBkc2wyYkEyR2lp?=
 =?utf-8?B?QnBERGxJekgrZVQyajZEdnBlbHBRNHhzbC9Qdys3WHZpVXhOeDZNR1F6NU5P?=
 =?utf-8?B?NlhNTnNOdzg0dEdvQWNWV0RJVXNMaC9OOUlnU2FqdkZIdkFVMnQzdWtrQVZC?=
 =?utf-8?B?L2RaVGxzeXl3NTdrZ1E5bFJpc1cyY01PSzlyNVVobEVWS3poWlVWV3BYMk45?=
 =?utf-8?B?M0kvRE05cXhLTVBlR3ZQc0piQkE5aCtITUdzTVorcC9BVFB3ZFovT2llVFVn?=
 =?utf-8?B?QXQ4c25RcUExMVpYbGZsTEtxVzVjcXBncmlTbFFlY3RrMGxRaWp6TEZISlcx?=
 =?utf-8?B?eTBIdmFTNGtpVlNoNlc3b3dFc1hNdEV3cjJyUXYzMkJmdENUU0ZRMW5pNStU?=
 =?utf-8?B?OHIyWGdtVklERW1BSUtDaG5DaUgxeFN4eE9MZytGOHhJdFVjUnFrcHQxWHVJ?=
 =?utf-8?B?VVJaTWFRQUJWRHVoSEtLSS9lT21JUWVMZm5TZ1kvVFFCQkN0MDJJTG9Rd1RT?=
 =?utf-8?B?ZFZqYVZHRmtTR2drTHYxZnNjakViVVhHTS9yS3ltRVV6Q2xpUzZUTHVwZ0tt?=
 =?utf-8?B?Mzh0REsvRE45U3R5ZGpLZjA0aWtxN25QZytCRUtvRS83SkdzajNDRnREakJQ?=
 =?utf-8?B?OEp2c0t4eGh4aUlRNit1Y3pZSFRMS28zSGd6Wm9UaGVGMzFhNVdtK0dXSElM?=
 =?utf-8?B?Q01OWVZRWmhMZnhyZnh3ZFk2eFIweE1rQUZCS09NTDVvZmh5Qjk2WVJFblI2?=
 =?utf-8?B?enA3Tm5OVEhnc1VEWm9mWGhGdW8xNEI5UlY1ZHcwcGVoQSt4bGxuSWdZWlN1?=
 =?utf-8?B?OEZ4dWllblBqSkgyOGl1WGVwemNyMXE0U0RrUVJ6OURpMWxpUmx4MjBNZlJu?=
 =?utf-8?B?OG55ZXlCQlhUYnF0YTNkNmlrVmE5emFhYVJYZExXS0t3cUwwclBsNWY0OGVo?=
 =?utf-8?B?M1h2K3JpR1BPZ3FZRDRvNXVFdGJYd3M3bGhQNkF4OHBIWjJIWEpqdHZSWXp3?=
 =?utf-8?B?Z3dWcWhEWmcySTBTZGJjZTJtR1dIRjRqOXEyTEoxQ3V3MzhueVNsazZKWmNU?=
 =?utf-8?B?aEl4UTBlVlMvbG8ybFcxT3BBd0swSHZtc2UwK1FXbEkxbGx3NGN6bFVkYjIv?=
 =?utf-8?B?YjZWbXd2QWlKZ0J6aHlBaFVEMGRCeVBPZk00VmZFdFI5eHJmYkFoN3RQYUJT?=
 =?utf-8?B?SU0xcGtlakpwYktyT1V5R1ZuNlh3VG43ekJDWjNvbHgrU3dNUjNoSG84ZzZs?=
 =?utf-8?B?V1IvSnZkVEZEUmRSclRDVHZWRThVbUxEbVZUeTAwOWx6cXR0VjYzWWRaNFlB?=
 =?utf-8?B?TWIwbzZ2WHNpOW8xblU2TXJ1anZNNlpkZEtNckVUME5DOVdaR2ZwQXpPYWYw?=
 =?utf-8?Q?AW7+lbyuIuRjMGEVnz6wKP6Z81oe6NRUWovDHJiawk=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_372F4DE3-3004-4217-9581-4FC9E2631BEB";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc1e77a-919a-482a-fd6d-08d9f6cf416e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 13:20:26.4204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WXsSL9pW86x6CJ0OWOnEZdnyl/2CvdSDymYw1J6PHCn9UT5G14hv+6vNMoRBjV/RVUJQkN+a0lh+t/tCMWzDz1Aa8cDvS+u0VkJ7PaeGNQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2764
X-OriginatorOrg: citrix.com

--Apple-Mail=_372F4DE3-3004-4217-9581-4FC9E2631BEB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 22, 2022, at 3:42 PM, Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com> wrote:
>=20
> On Tue, Feb 22, 2022 at 04:05:19PM +0100, Jan Beulich wrote:
>> On 22.02.2022 15:58, George Dunlap wrote:
>>>> On Feb 22, 2022, at 12:18 PM, Wojtek Porczyk =
<woju@invisiblethingslab.com> wrote:
>>>> On Mon, Feb 14, 2022 at 09:50:25PM +0000, George Dunlap wrote:
>>>>> I think it=E2=80=99s too much effort to ask developers to try to =
find the actual
>>>>> minimum version of each individual dependency as things evolve.
>>>>=20
>>>> By "find the actual minimum version", do you mean to get to know =
the version
>>>> number, or install that version on developer's machine?
>>>=20
>>> Well suppose that a developer writes code that depends on an =
external library.  The external library on their own machine is 4.5; so =
they know that 4.5 works.  But will 4.4 work?  How about 4.0?  Or 3.9?  =
Or 2.2?  Maybe it works on 3.8+ and 2.13+, but not 2.0-2.12 or 3.0-3.7.
>>>=20
>>> I don=E2=80=99t think it=E2=80=99s fair to ask people submitting =
patches to do the work of tracking down which exact versions actually =
work and which ones don=E2=80=99t actually work;
>>=20
>> But somebody will need to do this. If it's not done right away, =
someone
>> (else) will hit a build issue on a perhaps just slightly older =
platform.
>=20
> That's why declare what version _should_ work (and test that via CI),
> instead of trying to find what is the minimum version that is actually
> required. This may result in saying "you need libfoo 3.4" while in
> practice 3.3 would be fine too, but I think that's reasonable
> compromise.

This paragraph is a little unclear; you say =E2=80=9Cshould=E2=80=9D, =
but then talk about what has been tested to work.

To me =E2=80=9Cwhat version should work=E2=80=9D means you track down =
the version of the library where the relied-upon functionality was =
introduced; in your libfoo example, it would be 3.3.  I think we should =
only include versions that have been tested to work.  If the CI loop =
only tests libfoo 3.4, then we should list 3.4 as the requirement.  If =
someone else tests 3.3 themselves and reports that it works, then we can =
use 3.3.

 -George

--Apple-Mail=_372F4DE3-3004-4217-9581-4FC9E2631BEB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIWNH8ACgkQshXHp8eE
G+04swgAskndD01oPcO8uMbLpgXpT6AoMLTlG4V+SDQOGgZEHr/or9kqt5S6dLlQ
m16AgUJnnGnfD4daFMxchBJ+yRJIjn8ib3Lm/NbyV18pkmXTIvPe2nArfghOJzKQ
ehR3gPog+nx1DrclANBEjok9wyoy6HrcsydeA0M6TvA+m+SDG/Ayg7tLZ44XFTqj
kHwWH+Zf6Uak+ib+Kwb1YQDgGGYCUvEWjdYSXXWMwo8o+R53oQ2jmqGHkMOGNi/j
Qt5Hy3N0dgKBGRRXnXdwTUnlc43B7AR2qD6hT9SmZpfHxUpdUuHK/q+dFomhPlJH
2tI++XCTiSlDBznBp9TQxruzRVI2Gg==
=5k5I
-----END PGP SIGNATURE-----

--Apple-Mail=_372F4DE3-3004-4217-9581-4FC9E2631BEB--

