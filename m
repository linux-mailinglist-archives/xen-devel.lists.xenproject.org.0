Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C434C489B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:20:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279378.477089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcNu-0007wA-98; Fri, 25 Feb 2022 15:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279378.477089; Fri, 25 Feb 2022 15:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcNu-0007uB-4V; Fri, 25 Feb 2022 15:19:54 +0000
Received: by outflank-mailman (input) for mailman id 279378;
 Fri, 25 Feb 2022 15:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNcNs-0007u5-AJ
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:19:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f1f5a33-964e-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:19:50 +0100 (CET)
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
X-Inumbo-ID: 5f1f5a33-964e-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802390;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ZHAFFtgdwJyMnejfvYqugN7Durmt4Go3z7wTrKNqX80=;
  b=AVc6g0BVZaMXFdgFJVudDDS642LqtYWAGX838i/QFeD79rtFscTUPFt2
   EAXi6+3k3UmsOMe1tFUydItsE906ponjDkn9R6Q6STywzitscPJWzSmAI
   OHi56RNPQ5gt+YvQFTBfhy4ACQF/QYHMIjTy85lEC0QIzcE4npaR1GXbl
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67265528
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E2USHavaYo9YgLzQNCeDMwN1MufnVGheMUV32f8akzHdYApBsoF/q
 tZmKWqBbPeDN2Kmcoh+OYizoRkO75Tdn9IyGlRlriA8Ri4V+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1nX5
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8OeZzekqcfVyNdHn05MYNPpZHnLmOw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 JBHNGc1PHwsZTViCnUrC5Nlld2qlyfdaWBpkWqSv7M4tj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3ErvDLtTP2XsQVDrLQ3vx3hFyewEQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1q6sYaGp3CwPRIQIDNFaQENECUl7MLs9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZROdb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQI+d3XC3270k5JGQWy2yGsvTKuOGpxZEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPsUuKFbboXk2PRb4M4XRfK4Ey/BX1
 XCzK5vEMJrnIf4/kGreqxk1i9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SnsChcFkwOk3RUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 ZHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:lgXHiqn6GXfwQaKFd1odFZaTE4jpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67265528"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0r9J01DOLhTju/fn3od5+/pAjveP86w2ABeJ3iecqIGlD86WPDO5itYOg5J/duw+u7+AnbVzpRPASjEwRaPbfJc+catsikbVhCd2+NlbOJPg2yCVg1iTTruge3xfXAUy2tKhljOVDj/TFmRyiDlnD1pectD7eOp8tmmrsVRCzxjN6vxf4F8GcJ6oclsFg1x5iD2SUITpozdMGNDg+rSqn+qx7M+LCmAN3gMid9yE8OOhfd4ijeQ2jj31vakBGi/FW74kqFET2vr/9a6PGucRuRjGyMuXfoxbnaVOgKC3oQ1ygEu2blaW70vMFcHukvlZQ0uFyu8ONSDUpuZjXtAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KL1Y0yuM0Lq869715xLMo+zCsvaKf811cVwl6HDo0Vs=;
 b=PA8Idk5+l+4beQerYdpdpW48NcNcfCvmLpBfkquUUx6cCzxQ1fjqgaZ7xe4le5zGbt7nzPj0ScZ4Oz713QqWsGibz6Ja+7WX80gPbB1cYj6BKCqoHVBT/sZV7zqRolpMRl6z28nu3uUifTXfnxKz4Q4QrTMSNy/glLa3DDxOp+U4pjY+PK+21dMhb/+CXVkQXkm2tHPnMXHMkgIwdxFWaYZUeY55GBGdHrql4nH6H93qUBX6oYs9gXodF+1pxhot96KOECstts4HduQF2HK3v+Cgl6rF7S2TySzQZbg8TSLzzUeYHAbzaUBaTLIOztoP3SIGREs/dj5d+RDE84HCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL1Y0yuM0Lq869715xLMo+zCsvaKf811cVwl6HDo0Vs=;
 b=BmMLzKX0vYy6J+gZxC8tY6y3/1SrTXrUGfn1Hf7H4fWuywd2Szk+elV8F1dnVdSQvfn6Xdyk0SHIA0xcB8emDxVPh23T8oKJOzyxeMdXdMJOZ56tdMcJEFuuV8KTwzBfKzU6K+Qsn1Z2vKehmpZg9hxLuJpFTJ9Ir3W6BkmMrCQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] codeql: add support for Xen and tools
Date: Fri, 25 Feb 2022 16:19:29 +0100
Message-ID: <20220225151931.99848-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca53773a-41ce-470f-2a0c-08d9f87241b7
X-MS-TrafficTypeDiagnostic: CY4PR03MB3063:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB30637615CCA2E989C94083588F3E9@CY4PR03MB3063.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJqQ5ziI/gS5aTQYMo5B8SBmcLaMh5WDDfFQ55QN4y027uuFvN2prmLUhO/vleMgk76zbN2c9k76Gd3bMzMbsbq/vTGj0wn0Be1adjCi4GhjYPjpdhvInI74xaEwDoJx0ha5r6TRqcG6mz/0xhqRpEUXoiJCzzz3QTh1rE+AVKxdF1kIcmGbWT/Dr1reqXkfJ5styV3+y9+myhXnhW8O6QLHxDSDQoylyLMLX2KaznZ20xuqVW5ggel76C+9VKgxGFHZb20CX8AlprDIL52E0YsP85gUdJW8lfFvWS0G7GNAES0M6DFhSVq6kcKhpMwPxFGiZLC0HcXm9JetjpWtzPaFWnrgl5MCcvAIfFcxz6fDPlVS8nCEbw1gB69CQHLnCnQWuAt/VuhRVb8a6FQiZkKANuzui+pA5Q2VP9SWNhNvESrxbNxodyYIyxZuXGjWLm6OCBH7YBvtmpXIvJqGZSKoQb8euvbx0sTEzB9x5CZ5ckzf7MLfxnhkrpD9G5uK+jE54W5bzvhC4s0NNpgJ6Ul1EP3yAr16w7yO7VYakPUkwaDSzcWlV8s4kQfTqXjx8hnwspsFLi3UqvZZdMhJ1/7+9yCdKEJ9Jj+NdHJ3LeLDJXuAiFMioPJ011bGcJYBKeW6TAgCXlAytbjsxGEjWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(6512007)(6486002)(26005)(8676002)(66476007)(5660300002)(6666004)(4326008)(6506007)(6916009)(316002)(66946007)(86362001)(54906003)(83380400001)(186003)(1076003)(2616005)(82960400001)(4744005)(36756003)(38100700002)(2906002)(508600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajhvYyt3MHFkV09HVCtnZW9wYXV6UFhJOFZWUm5JbEZ0TlFGZmlqaFc4WUxZ?=
 =?utf-8?B?L2dRWWpoT1hOOUtSNitYcU9pd0Z2ZXhjaGZkKzcrMHJOVWExZFQzUmh1d1V3?=
 =?utf-8?B?ZWlQdU1rSEN5VnowQWM2RFdHQ1ZuS3NCV0t5RythTTl1THBicWM1eHUwZ0xZ?=
 =?utf-8?B?MzJ2RkJtcGV6eDJIOFE4YzVHOWF4Z3VlUVI4aHBlUzd2azV6N2E0QUJnd0hJ?=
 =?utf-8?B?SFZ1K2dBR2dNYkFoMTBMaDFWMnpkTEFpaHlwUmVXdXNWL2diaUJ1WlplZGU2?=
 =?utf-8?B?aW94eDBCelpGL0VtMGpBVGUyUFhrdi9HdTJMZlhwZTlpVzcrWHVGSDZaZ2dm?=
 =?utf-8?B?ZU0veTZrUVJIVmNkUCtzR0UxRmptZmcvbnFlSXpja3U0N1NGbTdkdDg1NXVl?=
 =?utf-8?B?RXViY1UxRjJ1S1VsazJSRmo3ZFNIUnpIQzVqYXQvRjV2Skt2T1QvVk10Ujcz?=
 =?utf-8?B?cGxCOGdIdDBHN0IzSEQ4MFVycmxIdThDRGlLQW03b0JjeWRCUmROV3hIQ01Q?=
 =?utf-8?B?LzVjOWpISG1EQng4WUNsR1JHOVlLaHVjOFJOM0laVE1UUWk4UE12TEtNOHJ0?=
 =?utf-8?B?d1ZMTEdQVitDMXJvbGdzK09DcHlvUVB3QmsvUlYya3NnRXpJVW4xQmcyYXdD?=
 =?utf-8?B?WWpnK1VkblFXNkZEZkMxaWo5WW44THJmYnhlcGcrMTlaZlBtMDRkSlFNTkZo?=
 =?utf-8?B?KzlPOENFQ0lRVldmcmVpRzRpbUNKUEZxRlVyYVFYaWFneVRwY2V0TUdCWGRU?=
 =?utf-8?B?YXNRSTI2WkFXUHBqaDJNSnI5YjhTcFBXTkJxM3BaS0Vva0VISFAwM1o5YzEy?=
 =?utf-8?B?OHhMMnFVb25QZjllMWlTdXE2dWJUZkJiMmdmSGRqUDdPZVEyQ3h6VVVzdG1s?=
 =?utf-8?B?LzBjeUJ1WEJWaTdlLzZXNXJwbGxnMzNFT0txTGdVdmZWZWRGNEo1eUxhcGdl?=
 =?utf-8?B?K0pnWFlHN2ZGZkhCNkFadlZIeWxqZDkvcklCajl6MC9vc0V3djk5d1VCcEhY?=
 =?utf-8?B?OWxiRDVoVS90UW9qeW1vOFVBWkgvNUJsSU0xWGs0M2M5dm13UW1nRlQrUVFB?=
 =?utf-8?B?WElLTUlJTU9xWHFaREF3ZHo4dVdlLytHV2ZZL05udHAxNVNMUEtUamdnRDZW?=
 =?utf-8?B?bW0zYktSbFhBRDAxY1N3dWRSMXBiL094U2RuZEl4UVdWRDdLVGxHWVZCaGlu?=
 =?utf-8?B?N1lVdTZGK0NHMWZUNmdaWm4zWUpLZkt0SUJXUXdic00wVTJ2c0hRekgvdFNy?=
 =?utf-8?B?aWtMbjNVRU5ESzdLNk14SU1JbUhGSkRNallDcDlFZnI2L21VR09MT1JHdmto?=
 =?utf-8?B?TGJ3LzlHeHFMMEdUaUliQWd0TVlFWU11NUM0SVJmQktEMlcrbjArQTc1d3Zq?=
 =?utf-8?B?ai9sZE9BZ1dMY0NlUk5udG9OeEl0MlBGc3dRbUNzN2llZFdRaEw2VUZmT3o5?=
 =?utf-8?B?cGJ2SXo5SDU5Q2huYmFhVnZVeEk5eHNsWXpVWmZVditUZGFJOEt0Ni9ZeHhk?=
 =?utf-8?B?SVk5OWhPN0pRa1BkTUNTRExUL2ptSXdmUUpGL2tHdkhhZ29qUTFlNWkzZWk0?=
 =?utf-8?B?THZML3pOQlhNRldIait0YmpCN1krN2FSS3NoSDdqSW5aYXJkU1dUbzZNMGJ1?=
 =?utf-8?B?K2M1cmFMbi9VRGR6Mm03blFKM2wyTVBTY2pLUUI0YzVQVWtldXVGNTZrM0Rh?=
 =?utf-8?B?YjRFTjMrMWZ4Q3dFY0lXNFZpanVqUWIwbmZUMTRRcFI2UnMxYnZWYW9INmJP?=
 =?utf-8?B?MGhXWW0wSEcvS1JEZXVwQTlZSlF4N3hXUUlhZlBQOUNzN0wvRUJEQlh2N1VL?=
 =?utf-8?B?Qzd4Y2JpQmhEMDNVeUU0LzJvUlcxY1VBMEhXb2NiL1hiUUlVdGdXVUJ6UFRN?=
 =?utf-8?B?bmtndWxNcEhaQ0lld01RcmpNcUhFOXEzM21iWGoxOUx0V0JPdDFhQkNqQkkz?=
 =?utf-8?B?SkZSd0hOU25WcXFFYjhnckZTT2xjbVF6am1xT2FEMU1rTmI3M2RIMUFTWEpY?=
 =?utf-8?B?OVlQSkswOGs2MnhHRmtoZEhNM0p0NHVPM2ZHb1JZL1o5WjhWSUJPRzE4K05p?=
 =?utf-8?B?VDYvaHd1R29lcEFVRVlvUW5teTMxc1NSRWRXN01NMEdMV1RoMTNyUEw1TDFW?=
 =?utf-8?B?SGpzYk5Mc0h1R0Z1UXRvNGdWdS8rYnE3L0Y1bWtlMW9kOGx5bW9DSGU0NGpP?=
 =?utf-8?Q?e/8AHA0Noac6Qx+3UWdB3SY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca53773a-41ce-470f-2a0c-08d9f87241b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:19:46.3368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76mIqVAuHa1snaIeN3Rm0TDfYEYoEULfk1+aH6vtadlHuQj+CIwpNBWoZhmhlY0h8rWDO0iVzGXZxyCtnCsaZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3063
X-OriginatorOrg: citrix.com

Hello,

The following series add support for Xen and tools to be analyzed with
CodeQL using a github workflow. The result of such analysis ends up in
the "Security" github tab.

Currently we perform 3 different analyses for C, Python and Go code.

Roger Pau Monne (2):
  codeql: add support for analyzing C, Python and Go
  codeql: ignore Kconfig

 .github/codeql/codeql-config.yml |  2 ++
 .github/workflows/codeql.yml     | 60 ++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 .github/codeql/codeql-config.yml
 create mode 100644 .github/workflows/codeql.yml

-- 
2.34.1


