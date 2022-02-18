Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A464BBA0D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275412.471269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3E5-0003Ts-7f; Fri, 18 Feb 2022 13:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275412.471269; Fri, 18 Feb 2022 13:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3E5-0003Qf-3m; Fri, 18 Feb 2022 13:23:09 +0000
Received: by outflank-mailman (input) for mailman id 275412;
 Fri, 18 Feb 2022 13:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL3E2-0003QZ-LW
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:23:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6b9f0ee-90bd-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 14:23:05 +0100 (CET)
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
X-Inumbo-ID: e6b9f0ee-90bd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645190585;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ArgSZLkCL7gUMLOr3Uj2rcxDXVSxdO5cj6dGuKr9+oA=;
  b=ZSR7xEnGFcHBcQxUacNAAn82gU7LPuUX6V3zG/vC7Z+6evn6w5o1ODcA
   yKBC1AKVNGxxJwCWG4BkLDuRpXs0ZK0+i1T16i1pXdJG87nhhPfYfUtgk
   Bxt0FDXs9mBXMDtYfUYTMEJKyUskAXDuXptFNCrTB39jzqDWA107zujkI
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66760077
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QcfR2qIkbC37QXRyFE+R85UlxSXFcZb7ZxGr2PjKsXjdYENS3jRUm
 zEfXD2GMv6Jamqncop0bdy18E5X7JDRm4c1HABlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 O5B6qeJT19yAqDdlb8hdUFUOSRSE7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6iBO
 ZJBNmUHgBLoOgB2JmceLMMCt6SrrUDGLTx3hmnNuv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 2Qd/yF/84Ap7kelCN/wQ3WFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsdTIeU+Ug7JQKSC0nj
 WOvx9/DABBBr+jAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFYg6TvPs5jHhMXSpm
 m3R8nBi71kGpZNTj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 lBYyqByD8hUVPlhcRBhps1UTdlFAN7fbVXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusMOZSH2Nf4rPdvrYyjP8UQGPY20PhwzRoATCqWdiSfdpH0+DaJu9zuFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5YJLrXaelI+QgnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZ0TA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:xV2Gnq3HyL9l2CO89qZdUQqjBRZyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/heAV7QZnibhILOFvAi0WKC+UyuJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZm6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngdOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerV8bMpiA2XkAgwbzYxBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIeLH4sJlOz1GkcKp
 gkMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbQxFreWpe5PdI+c9vcfEzc8
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="66760077"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOljm7JtnDn9OBfgWtza9Md80vRZPemG13QihsAeslDSZfPbFfk4jWauof5+9wpn7BaG3vXmVzQdZBJ2X8qYTZhn1AyRGg1U1jxaM2J3veDJ2ATJPYlKjwC4oc/bDHX7GIw8KXfg/5oltaugzsO9jQJpBOZt4+oPeD/QTEU+IXfpMDUTiRIuFEZ7mdcPpjyPRPIBEix4aTO/bECl3KAVAIHEWxpFkNERW+YkVqimDaBPvQJ5PtIoTmZX5snhuKu7CG/9+6XDRGoOlLbotei/kEkQ3wiVz4/bkhQJppeRD/N1MgGmH5z2LUq4a0aZNp7rlT3KNm88XOm7p0I/uffQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArgSZLkCL7gUMLOr3Uj2rcxDXVSxdO5cj6dGuKr9+oA=;
 b=L9LxzMeuMcZVmmY0/ttiruOVJxiET2EIiU1JjA2IvkhP5S2FvXr7rHIqSxw78j1rG5+eW6AwXaF2ABVkbz5S7QrbBHDWQlKA2LRvPHQqDKoIXZ1bTDthG+2pwyW1BWZKTknw76KeLNMAa6mDmZ65qIEW+PrqNVxSM8OZSeYXyV5dGmCUN+4NnBAUvkH5OJJdD3g9DqQBLHA6tZ2knlK0HhpRug8s6etZ5tDV8OnvhzrLC3i1XUWZxXw/tEnVOFj2LFYKe0K/7FIXbTcU/XtnVWE7IMe91oVrOWKCnF78HYC64MLgBAr3kNiAvbw3waByDPRh4EsCxNLDJ6tzokANJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArgSZLkCL7gUMLOr3Uj2rcxDXVSxdO5cj6dGuKr9+oA=;
 b=LUosB1eyVsCINKSGW+uH0j+OTysnDPWVGd0+TF5Ts1rmRVzOOiW802lfuO5h4vH9u1j7mABlRcZ7EX1OdJyYnkpxe5iHHFBWrlFMxDmuy5Y/HEAcKOWH6LthlersjjuD3Ga0vcKV/RvB7kDAxVOCvI6vQvgnjMOJpo7wCTPqvKg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <amc96@srcf.net>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH] x86: replace a few do_div() uses
Thread-Topic: Ping: [PATCH] x86: replace a few do_div() uses
Thread-Index: AQHYB5LijlOnVfNOdkqZn9v3W4GnqqxfHNSAgAABroCAOhh0AIAATy4A
Date: Fri, 18 Feb 2022 13:22:58 +0000
Message-ID: <48fe4bb7-e02d-520f-a023-2c762fdbadfd@citrix.com>
References: <01baee92-9d7f-5a2c-d63f-1de390bc10e2@suse.com>
 <a5af3a6a-da51-2624-622e-2566c8db7dce@srcf.net>
 <f4dd528a-d1e0-f516-bb7d-f1ec01abc3d5@suse.com>
 <66c63b32-aca9-0fb8-ea6d-8b91c23eed9e@suse.com>
In-Reply-To: <66c63b32-aca9-0fb8-ea6d-8b91c23eed9e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc55fef3-f378-4147-3187-08d9f2e1c83a
x-ms-traffictypediagnostic: CY1PR03MB2315:EE_
x-microsoft-antispam-prvs: <CY1PR03MB23156C45A800EA5978F0E456BA379@CY1PR03MB2315.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K4H1GqRNfkCLMqhKgMMllV9HKO/P0Kvtmtd28BIMzaqroZs9Ysc+8dz5EQy2znOOht0nIk6o33BeWDvQjyzPVGr1btbId8f/djoMr9KalCiC/O1FodhqveAYLxjpeqOJll3zlvWk3QIdoBoDpmbo3d2f8lD6P/TZIPCDta8WO6XWfjhnchPjWP9W/Fy09p8TmZg/f5mifs+rp8QpHMarBM9+X85jpEi8QX6murYdpMLH0VGv3aTiEl8DncqsBEKjaUy7dCw9UNviWYjVYD1QwQNBk76AIEyk4rT7ywIj9gYa5kYiJ5M4unS0j4Zld5RdQK1+tznVoFldXXiscV+jUsV5QjVXLVfJy0pFtoM9vQiXpgQHNZXCflgI1Kp6z06USEtQdXHyMJfMAl6sZyjZ+LHlNI3ctg1K9F4p5ymRS2WNjDLvDpL0gIq3C2pkEFeSAoMZKhv8Ipf1g7bqkEFYqqtiPDHwjyyD9RRftBDx5A2kEc/JVUWp/zd8vJ8AmaDw1sSjdI4JhxamcOxxGwKd1lM1qc3FRCXsBR8QOEMeXCMTCd+U5V1vPfbG99Jh5iIgoFFfyp5shKF7kyrJ0mrEuAHYJZCoNiaOVJriSf4DkYXXckf7SjfRpmI3vhhy02MvQLIwg5uKIjfhN2yf4K+ekvPDVVHUvFkGbTj4/da0eCw/OuX0nK1kRNOCMNM3hHbWGAFcykcThY3ptFGOHmC1HwoWlIt21dslt7hOdU4EPxlN3irBu6/0cfDr7PATw0h7e0nDTNQAfXwNUh91JwO//g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(31686004)(83380400001)(186003)(26005)(31696002)(2616005)(6512007)(8676002)(86362001)(71200400001)(2906002)(6486002)(6506007)(508600001)(53546011)(82960400001)(54906003)(66556008)(66476007)(38100700002)(76116006)(66946007)(66446008)(122000001)(5660300002)(110136005)(64756008)(316002)(91956017)(38070700005)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEl2OXVkZEVRWUxZbXhPYzg4Ylk2b25tRkJtbWpZREZVZUZ0VU5PcnFxemlQ?=
 =?utf-8?B?M2szUlhBYVo1N1hlbnVNL2NFazFpVXNDSGZ3cFZXWExRdVJ0WVhDS2QzajNE?=
 =?utf-8?B?bmh0SHZwUGdEZUQ2eG1KSWRpYkNOZnlZcDFGSHMxMklMWTEzU1U0YTJOQWRt?=
 =?utf-8?B?VkwyY0UyVi9uOGZHV0xSNm91N24xdzZhZkxYOG83WVFONUc4WlJzeTFuZVBY?=
 =?utf-8?B?MXhva3hidGlabUdsYUN0dCtsa2tiV2NSTXNNQlE0VTloeWM5dlUxenhLYndO?=
 =?utf-8?B?UVlNSkc4dEUyYkU3dWNnK0hFbzhjZW1MNE43clpMSjd2SU9aeW1aOENiQ2h1?=
 =?utf-8?B?eW5acUpFQUZtNExvVFZZaWNUQ3hIMGl3SUNkUFRqMEhoclR6ampUTVVwOFda?=
 =?utf-8?B?aFRZQWZHNnRiNlU1N2NFRXUzQ3pVM09aVWhrNFkza1o4L1Bkakk3M1NyaFpY?=
 =?utf-8?B?dDVncC91T1RROUxSdFlPTHJhcklwNmNRRTEyejhUa1FZamUzNmtmVjlWc2Nt?=
 =?utf-8?B?QVJrZ2lzem14dDdUVy9GS2o2dFZzT09VSDlWSUVTdnNLMzMrdUdCeFZaSU15?=
 =?utf-8?B?bDJKWi9tcllBd2t4Y3lPNysrV0E4NUI5S2tnU0dQNU12TitsaUxEbGc0cEND?=
 =?utf-8?B?cXczRi80RCtJcmRsNUszMmhzMlp6OVA4MmVmT2JMTEFtcTcxYllaUUdrSnYy?=
 =?utf-8?B?V3V5SUIzc1MrWUI1d1VWaEp3eWVvM2RaMTJGYWdhTkNwMW1QWFYzNEhreXNT?=
 =?utf-8?B?M05CbDVzYy9QeEMvZGg0cFVMdFFEWHp2eGNzMFB1WlhUMTFDR2hWdVMraUZ4?=
 =?utf-8?B?TmtRZ2ZkaUR2Rks0K1hyK0J5endaYVU0NDlDcWl0YVJIc2hQQXByaVBqNTJm?=
 =?utf-8?B?R1VhNXdyU3p4YkRQa3I0Q0VRUGtrNmU5S2hNVzc4eTB1MUJYcjhwUU0ycTZW?=
 =?utf-8?B?MlJlVHFIMUxjcUQ5ZmJ2K3ZnZ0paS2VHYUxpUEw1Y0lLL250am5MbmtydjVQ?=
 =?utf-8?B?TDNRZmJueUFtRDVwc3VaVjRhazlwbDQ2M0lBTzRzbVExVGgwbFAzcThyZGdK?=
 =?utf-8?B?eUhkejBBR1JCQjUvTjNwUlNsUlBQQksySWVrSFMxQVNTbVllVlozZk5lL2s3?=
 =?utf-8?B?UTVJRXcrMzB0Y1hIS3lKc0pxNXBGeGx4eUVPajVwY2N1a3pVQ1Y1aktrZjg3?=
 =?utf-8?B?MFk2akxJdmh0b1o4bUlqeE5VOHFiUUlCY1RJcGdTZExNdFNuS2M5RDdRNkpW?=
 =?utf-8?B?ZW9GMDhCRi9VNUVyb0Vta3REZW4vQTBMVk9NOHJkcW9ocmRpSlpMRHRJZitw?=
 =?utf-8?B?a05yNEkzbXdXYUZmOUcxYmZ5S1JFRlZySFA0dThBN1MxMXRrRDN5cXlNVVFW?=
 =?utf-8?B?TTQ0WlNabWMxN0hva0VqcEs3YnhsQy9DUzNSVS9xMzFGS1RORDM4cFdCU1Mx?=
 =?utf-8?B?c2JOWVZzT2Vyb0p2UCtPVDd5RGJYMnQ0b25RQ0NOQzYvZlM2bDNoeHN4ZUUx?=
 =?utf-8?B?QkdlcWRjU0dzVyttcm40OUxZdmZWZTNBYjRjQnFaUG53WkRSbWNVYTZyRFFL?=
 =?utf-8?B?QTZkalFQcmE1YWxhcyswdG95MFo4cDFqcElQd0VxNDl6bWV1TTdtNWxLZkxV?=
 =?utf-8?B?U3ljS0NwUmFQVkhCNWk1KzJrN25aVEhjZExDbWFCZm5INUVOeXV1dXFxNzBP?=
 =?utf-8?B?SEFvdWhoZThtUVR0NUNEWVgySXRRd3pkZlF1MU9CWUtJQ2g3Vk9kVnI2b3B1?=
 =?utf-8?B?cVBaOTZkaTJJeG00bVBkV3luTDhNL01nL3U4Mlg1d2x6UzRRSGZSbUhzN0lE?=
 =?utf-8?B?ZXBnZldKUUZvL05VNHVnMyttV3pDbWJkNnVlRGI4eE9jODU2MlU0SFNhWDJw?=
 =?utf-8?B?bDRORGJWSFF2cTc1eGlZanZ0bTZMWjRmajk3R1haT0JHdkhmSVA0ajh0ZDZQ?=
 =?utf-8?B?NndiUkg2dnVwS1pjMDJoR1ZEVEtSMUkwbnVIMlFHeVYvV3JXTllIdm5tMDlC?=
 =?utf-8?B?Zk9jQXVDZHZiYXlsalJjZ3dWZFdxTjRxekVNQk9Qd1d0d2RlTXBPUFV6bkMz?=
 =?utf-8?B?aTI0NWkrbldaTmVZN3FORHZDcjZnQTRoVkZuQ01ZWHRnRVc4cHYwSnNXU0dt?=
 =?utf-8?B?Zy9XcGNjL2h0V2E5QWY5NDhQUWlDUzc0aTlJZklLT2V6dmN6MHJmWmJLRFMv?=
 =?utf-8?B?YUwvczBEcVVPQndLQTJOQUVNeDJrRm9jL0xsOUR6VEQyRXNhNm9VN01iZGI3?=
 =?utf-8?B?d2ltWjdYWEo3ZDJROFhNRHpVR09RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AF4D9FED1FCDD488F8E8A1B8ED6C495@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc55fef3-f378-4147-3187-08d9f2e1c83a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 13:22:58.8893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1kKPxf24NDOi2J6JThtM8wfbL52YgG7YKZaxhVpaFJUdaumtiW5G7B2ULlrTlrV1smP1ucFv2vXsLxKkstMK580cALT0KezEjjist7gH3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2315
X-OriginatorOrg: citrix.com

T24gMTgvMDIvMjAyMiAwODozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEyLjAxLjIwMjIg
MTA6MjgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTIuMDEuMjAyMiAxMDoyMiwgQW5kcmV3
IENvb3BlciB3cm90ZToNCj4+PiBPbiAxMi8wMS8yMDIyIDA5OjAwLCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4gV2hlbiB0aGUgbWFjcm8ncyAicmV0dXJuIHZhbHVlIiBpcyBub3QgdXNlZCwgdGhl
IG1hY3JvIHVzZSBjYW4gYmUNCj4+Pj4gcmVwbGFjZWQgYnkgYSBzaW1wbHkgZGl2aXNpb24sIGF2
b2lkaW5nIHNvbWUgb2JmdXNjYXRpb24uDQo+Pj4+DQo+Pj4+IEFjY29yZGluZyB0byBteSBvYnNl
cnZhdGlvbnMsIG5vIGNoYW5nZSB0byBnZW5lcmF0ZWQgY29kZS4NCj4+Pj4NCj4+Pj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+IEkgbGlrZSB0aGlz
IGNoYW5nZSBpbiBwcmluY2lwbGUsIGJ1dCBzZWUgYmVsb3cuDQo+Pj4NCj4+PiBkb19kaXYoKSBu
ZWVkcyB0byBiZSBkZWxldGVkLCBiZWNhdXNlIGl0J3MgZmFyIHRvbyBlYXN5IHNjcmV3IHVwLsKg
IEF0IGENCj4+PiBiYXJlIG1pbmltdW0sIGl0IHNob3VsZCBiZSByZXBsYWNlZCB3aXRoIGEgc3Rh
dGljIGlubGluZSB0aGF0IHRha2VzIGl0J3MNCj4+PiBmaXJzdCBwYXJhbWV0ZXIgYnkgcG9pbnRl
ciwgYmVjYXVzZSB0aGVuIGF0IGxlYXN0IGV2ZXJ5IGNhbGxzaXRlIHJlYWRzDQo+Pj4gY29ycmVj
dGx5IGluIHRlcm1zIG9mIHRoZSBDIGxhbmd1YWdlLg0KPj4gVGhhdCBvdWdodCB0byBiZSBhIDJu
ZCBzdGVwLCByZXF1aXJpbmcgYWdyZWVtZW50IHdpdGggQXJtIGZvbGtzIChhbmQNCj4+IGFkanVz
dG1lbnRzIHRvIHRoZWlyIGNvZGUpLg0KPj4NCj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3RpbWUu
Yw0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYvdGltZS5jDQo+Pj4+IEBAIC02MTAsOCArNjEwLDcg
QEAgc3RhdGljIHVpbnQ2NF90IHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KA0KPj4+PiAgICAgIHN0
cnVjdCB2Y3B1X3RpbWVfaW5mbyAqaW5mbyA9ICZ0aGlzX2NwdSh2Y3B1X2luZm8pLT50aW1lOw0K
Pj4+PiAgICAgIHVpbnQ2NF90IGZyZXE7DQo+Pj4+ICANCj4+Pj4gLSAgICBmcmVxID0gMTAwMDAw
MDAwMFVMTCA8PCAzMjsNCj4+Pj4gLSAgICBkb19kaXYoZnJlcSwgaW5mby0+dHNjX3RvX3N5c3Rl
bV9tdWwpOw0KPj4+PiArICAgIGZyZXEgPSAoMTAwMDAwMDAwMFVMTCA8PCAzMikgLyBpbmZvLT50
c2NfdG9fc3lzdGVtX211bDsNCj4+Pj4gICAgICBpZiAoIGluZm8tPnRzY19zaGlmdCA8IDAgKQ0K
Pj4+PiAgICAgICAgICBmcmVxIDw8PSAtaW5mby0+dHNjX3NoaWZ0Ow0KPj4+IGRvX2RpdigpJ3Mg
b3V0cHV0IGlzIGNvbnN1bWVkIGhlcmUuwqAgSSBkb24ndCB0aGluayB0aGlzIGh1bmsgaXMgc2Fm
ZSB0bw0KPj4+IGNvbnZlcnQuDQo+PiBJZiBieSAib3V0cHV0IiB5b3UgbWVhbiBpdHMgInJldHVy
biB2YWx1ZSIsIHRoZW4gaXQgY2xlYXJseSBpc24ndA0KPj4gY29uc3VtZWQuIEFuZCBJIGNvbnRp
bnVlIHRvIHRoaW5rIHRoYXQgSSBkaWQgZXhwcmVzcyBjb3JyZWN0bHkgdGhlDQo+PiBlZmZlY3Qg
ZG9fZGl2KCkgZGlkIGhhdmUgb24gImZyZXEiLg0KPiBJIHRoaW5rIEkgZGlkIGFkZHJlc3MgYm90
aCBwb2ludHMgKHRoZSBlYXJsaWVyIG9uZSB3YXMgYWN0dWFsbHkgbW9yZSBhDQo+IHJlbWFyayBp
bW8gYW55d2F5LCBub3QgYSByZXF1ZXN0IHRvIGNoYW5nZSBhbnl0aGluZyByaWdodCBpbiB0aGlz
IHBhdGNoKSwNCj4gc28gbWF5IEkgcGxlYXNlIGFzayBmb3IgYW4gYWNrIChvciBhIHJlc3BvbnNl
IGNsYXJpZnlpbmcgd2hhdCBJJ20gbm90DQo+IHVuZGVyc3RhbmRpbmcgaW4gd2hhdCB5b3UgaGF2
ZSBzYWlkKT8NCg0KTm8gLSB5b3UncmUgcmlnaHQuwqAgTXkgbWlzdGFrZS4NCg0KQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

