Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E0621412
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 14:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440057.694107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osP4z-0003ZK-PE; Tue, 08 Nov 2022 13:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440057.694107; Tue, 08 Nov 2022 13:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osP4z-0003Vs-MB; Tue, 08 Nov 2022 13:55:53 +0000
Received: by outflank-mailman (input) for mailman id 440057;
 Tue, 08 Nov 2022 13:55:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5nK=3I=citrix.com=prvs=3047eb21c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osP4x-0003Vm-OW
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 13:55:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c691cf5-5f6d-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 14:55:50 +0100 (CET)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 08:55:36 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6039.namprd03.prod.outlook.com (2603:10b6:208:31b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 13:55:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:55:33 +0000
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
X-Inumbo-ID: 0c691cf5-5f6d-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667915750;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=YI8Loby8OEU7HAkxsQgjM8PSU8xTXjmQkw0OKZZyKGc=;
  b=AiVpbttlaTnV+9GvKL80J7gbUit0RxAlt8GgYa5ZTNVyyxkArWjXKNkx
   uXbvenBeuMvEyksuYl455eDnlsJy47+B1VoHUo8YjgVttxnwLOEJDO2Pj
   jgJbDH6owlOI6ZZFNnsRKRQ+TLS2XJ1sHwB0pyJA8s4Ib9nFlSwJLVxmH
   E=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 86924562
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+qInK6+Iywbflc63Hh+GDrUDYX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GFNUW7Sb/3cYWr1edp2Od/n90gFu8XQzYBiQQJl/CE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKgb5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklXr
 KQWdgEdQyyens+45oC4dsxgiOYseZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpi9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+RzHmnBdxIfFG+3v9GkH+v614uMjhMDhy4i+WF0mikcusKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZhZdo8pYkJTDol/
 laTmpXiAjkHmKecWDSd676Sohu7PCRTJmgHDQctSQYV6t/vrZt1oh/SRdZuCoa8i9GzEjb1q
 xiIpiUjg7QYjeYQyr62u1vAhlqEuZzhXgMzoALNUQqYAhhRYYekY8mt9gLd5PMZdIKBFADZ5
 z4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsI1cFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:FQIpMK550W+5PL1tRwPXwSeBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfjqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2cSIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+Ezc/Cku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrdOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvGrf2UIUh4bD3wXklX6vpREnBmc4a+a
 hVfYnhDc9tAB6nhyuzhBgv/DSuNk5DbituDHJy+vB96AIm4kyR/3FouPD3oU1wi67VM6M0gd
 gsEp4Y5o2mHfVmGJ5VNaMmffadLFDrbFblDF+ySG6XZZ3vfUi94qLK3A==
X-IronPort-AV: E=Sophos;i="5.96,147,1665460800"; 
   d="scan'208";a="86924562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MweVAkJxvCI1HpmtH3Yasg4DSpc91DL8njAgduyLhnXl1aPX7OnbA+JfSpwqGy8+KZsCiigRS9c8JFfdCID5ALUUdlnzR0WJxp0N/uKi/btcLNYLFQaKo3tBX+pFG5SFRlEgrTO0nVb3/WXaVzv+CMF6vEIOJgxlEY1bTaORWLy7DwT3ESVN+jbwvDK6RQFR62xdW81TYtfFdSlKWjETkta3GTfvfG1fvHK9DSIF9Gf4efm74Eaa1ZEVa3KDmLQeWnJIcn3HQlmWRVTvsvBXSX57YawFXfbBCfOjIU+rJejtzjl1Sbom6kgyZLyERfTjLcvQGp4efuGRnHRMYRaSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJFdBjT8c7JFwxImwCDSmPg1YX4xF4xhzi5JAtkUwMA=;
 b=ajqgvZ3DjUdLVZ0xnrlFEcoTOqvxNJioraS8v4pJBy6BEDbDtCcb7LhF8NWDOfENjE813FMSxOIbNYo2kTnz5hgH9IM+A/v/0VOuxB2nMqvmu3mj9gcIjVr4z1FTge9IMi5HGT6oa5vSiNabpc8SqDENF0xbBMqGkY3PVWpPM/c805QaI8Wo3h5L4twgsmJ1aZT9AAvbhQvTMaYZfg9NP7UVq4IKcLAWvIKUKpAFXkakCGAFvcTsAanrpUXjXjLUd/+l2kdoxYZ6AjasriT1fThCoCTBi+Q2rJK3fq043P4ZvT30/qSaIj3reeTpIEEoZIAQZrs/OELlzc0wciZj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJFdBjT8c7JFwxImwCDSmPg1YX4xF4xhzi5JAtkUwMA=;
 b=n8AxMRLoHNK+ozHSKih8nzsXTz8bODa9a4z14aldjFmcsAacrzFF4SVf1Nn8Bmca0yJrbg4MpUdmzRRWZz/AAU9/Gof28h8mvUqEOtqGy6Am5sFYSSsCpxl+uzgyaC4AVgqzAqxi9MeE6uTT50R5ODNwx2pxYWzkq1E+2azcr7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	ray.huang@amd.com,
	Alexander.Deucher@amd.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if present
Date: Tue,  8 Nov 2022 14:55:16 +0100
Message-Id: <20221108135516.62775-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0601.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: dac79f0a-5c58-4e79-bd57-08dac190e7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9q4ccl8BBwxX/tRu0a/InyIQWFpQX5Yjg1HMUJx/Cwy7sRB+5rHjpq8ajWOFgTr+YVznHWAOJAUSsxubUPIV97yp0XsSATLC4i9cGkijob5afHz0ei/vWMjbOB99qCvhqgNk4kniNncVGuZMA4HpCAZHn3aF9X1YWSNJf+P+tbNc7OZRh4TVQyXfYTYeLzfMDmfyfMTzMDpN9ZXAJDaWXn1twkV2V6X+tiH6nTekvFUyKbocW1/LRbzAwuUwbuAgmwgha0oLOsgZT13D8nMT6lIgYbrmEIO8UxE1p5aF24KfLFAjKfDiAWgZ59qBrTPMlMgLz6nVSxrOnBjedcCThUkFAKwt9dAZPsr2/fyzbRDXXUcljYCw6twVFyVdRdQisTjOX7SUMNaG6JM5M0ZjoRoSiv+zFD/3Hv8PEwNXIuJ7Bye9pd6/vHwhSGIKsuhvE3p5RIxV3eoVdRRms/k4l2xN4ovs9JMNXXPYQkSeVP5mQfTeUwQ6yvq+lK3+9egZC6fQv2lkNj1TeRFcsGzReQZYKchpoaaMT8UfKfjBpHvmm5wHBXIqMIlMjlnEeUisswhv2IcKQ21R9D2VQtxxwZFpRMLfBlK24k5Rv91u7M5DWYhtw7rqwZPbJD+HnGccIifoNOofux23SNTb1ffNao5tGOf0hrdXoNVjZE7gf4TXd2FHO6Loo/M5r/yb27on+qQ05O7roNbAsBJcEePN/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(36756003)(82960400001)(478600001)(6486002)(83380400001)(52230400001)(86362001)(1076003)(186003)(6666004)(2906002)(6512007)(6506007)(38100700002)(8936002)(66946007)(6916009)(41300700001)(2616005)(8676002)(26005)(4326008)(66476007)(66556008)(316002)(54906003)(5660300002)(45080400002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um5vRGg1QS9XNGtRNTJKTmtxT1FoVmF0NitVZkcxYnVleUR5d1UvS3VtNjlN?=
 =?utf-8?B?L3I2dXdXMFZpT20rdVRIcWVIcmk1MnBUckVLU2N1TjZ5SzJZOTNoc2dXRWRn?=
 =?utf-8?B?Z1oza0pNTHhzVi84V3lRSkc4dWpUVTNWekZhWE1qK2hQcG5JVXI5MUZCMEZK?=
 =?utf-8?B?YW80eGViS2pVVlQxSW1Id3pTRVE4cDNWNGJ5eXg5M29rY2w2ZTloR3h0Zldo?=
 =?utf-8?B?MWlYSjZSQ2NNMDMyRGFpblluczZNYnRkUXRyRks5Z01xN2lrclVURE1yaFlQ?=
 =?utf-8?B?VU5LK1NEL3dkUFJtWmJLR2pTVmRhSFk1aGVhNUUzbUhBU25hS2VlL3RrSk9u?=
 =?utf-8?B?WENZclBLWENFMDQ0Vmd1NktQMmZmOUtoa0doYy9Ldm5aalpYdjBucmlFR1NV?=
 =?utf-8?B?R0k5TkdkS1lpVzlmUjZEdGZ1enBhSnJjQ3NQTlV6QWVYOHd5UkQ4NUpOZTdt?=
 =?utf-8?B?WTVIbFpUSXlGeWUzYWlwN05BYi8yWU9YenQwZmhGclFydWl3MVQzRFpBK2JF?=
 =?utf-8?B?MmJpNE9KbWttTGUzWElKZmdwNUJ1MHpTV1VidmRnY3dJMDNmdzI0ZDRJUGQ0?=
 =?utf-8?B?ZWtmRVlOcms2MWpTUjRCa0lsWlVqaENOUjA1dFRIK0ZBNndxUWtDNWszQXYr?=
 =?utf-8?B?bDNGc1JjdGxGNzRtL1BwVFdMR0N1Sit1Y2Qrd2dwcDhUeExkV1BlVFBUaW9x?=
 =?utf-8?B?TFJsNlZCaVRFeXl3bGJXTEZDU3RCQVByV01NcFVXQnpIMUZYcTQwdExqMG1r?=
 =?utf-8?B?Ui9WYXpBZ1FSOUduRnRyZUZPWUpIcEpQb3ErOFhPMEhFOTBGNER3VCtxY0VJ?=
 =?utf-8?B?dkxHekZwZGRQajc4SDk5dFZHODRjejVZUWVick80RzhMSHJjR3pwTHFYeGdS?=
 =?utf-8?B?eXNoK2d4ekR4NGtnZEJJV0dBNEowNnJ1NWtzYTVudHNnLzFHbUo1TyswcjVW?=
 =?utf-8?B?dlRCYmwwdGtCdWRoalhCQXg4cEJLRlZRV0N0ekVIMXNOMTFCVmJRS0pwSVM3?=
 =?utf-8?B?cngyUEhSd2JNYzBRUE5KMXpTUngyMHd1N0RDd0FvNG5YcUhiRmtXNlA1eUFi?=
 =?utf-8?B?NUptUFpzRjhvdTc4akJzUG9GWHJjTXlPK1VFSTJmYXVVZElkSjBjTmdVb2d4?=
 =?utf-8?B?N3QyZWFYS0tBa05ZdFo0bHB4UUloWFpQRlBSRWl2L0hxWklhUjcvWmEvcjIv?=
 =?utf-8?B?S1IwNE8vWmRpcFQycGJMR21RRk5DVHhlc3hCaHU5R1hLQ0pybnFrWVBUTTRM?=
 =?utf-8?B?YURNdWZ4TG9NY05ETkErUGY3NEZLbVJNZ0JmRGpuYkk2WjRwNmluOXZia0xZ?=
 =?utf-8?B?UjZiL1JONm1ORFBIamVFRTJNQWsvWnBiYXMzcE1YTEFwVGc3UVNXOHZmZ1du?=
 =?utf-8?B?OTY1MWhVcWE5R1F6Ly9zbEJrSzFmWjJiek9aQ0FkbmxnR1NHYjJZQ0hTNDh5?=
 =?utf-8?B?V0tVd2krRHpyRWRQMDZtOWVOcndPemx6b2NESm51My9XQlE1dGdYeHJjcUlx?=
 =?utf-8?B?LzYvdzcxaHBYYVp5WmR0WnBPcW5tVGxteExDUHdxY29MNVhBVnNRakxaSEtp?=
 =?utf-8?B?VGtRd3d0ZHRSSmpadWlwZ2JiNDQzZ3RjdjBqR3hVTVpSVFpyR3lROVpiajNi?=
 =?utf-8?B?bFNLZ2xBRFJtN1AvbnA5S3kyeThWVTFkb25zYzJnLzhtQmVFdm5TdmpnYlpl?=
 =?utf-8?B?NTVJaUtMeXhMMHAxQ2x5SEFkamNLb2lKNGUzMkpYVHVBWmVGWTlGc3VLbzhn?=
 =?utf-8?B?N3RUMUZZbEhaWFlQYWdBQVR5VEh6WUYrSy9MU1pVVWFFaTdvZklTM3NLVVI0?=
 =?utf-8?B?RGJ6RXhIY3ZISGpKVy85SUZjZ05xQnNPalYwVUwvN21jMVI1cG02Zjh3ZkFz?=
 =?utf-8?B?UTJPYnRsTGVIMzZjblNsRTU0YXFvVDI4a2wvMHdhZmVNL0ZPL20xZXNBR0Zv?=
 =?utf-8?B?dUZLSmZrYWp3Mk84MGE3QlF5MXBGMUtOd2dmTVRISkFjSkNtQ2tWTGEvcUk2?=
 =?utf-8?B?R092MTRma2FacEJXSlFWZzlSTS9KREd6dElIbGFlT0tlNE5DcS9RTjMwOEgr?=
 =?utf-8?B?UHc4VC9aQlhmMUhLMDRCNzl4SzlEekJrU1ptaDZuelpVT1hZVEU0R0hoSFpI?=
 =?utf-8?Q?yBoHBFeSRAnE2c8b342LDbmhC?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac79f0a-5c58-4e79-bd57-08dac190e7a5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:55:33.4709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VctGlTlBK0qw8JYlUldyD4xFza40B79P9KPGswRdjuFWW+e9KM9JxZd5Tq6/KmZMtU9kY3d1IZ0OCYp9drWKvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6039

The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
from the firmware instead of doing it on the PCI ROM on the physical
device.

As such, this needs to be available for PVH dom0 to access, or else
the GPU won't work.

Reported-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
This is a bugfix, but given PVH dom0 is still experimental I'm not
sure it would qualify for the release.  OTOH being experimental means
there are no guarantees it will work, so the change is unlikely to
make this any worse.
---
 xen/arch/x86/hvm/dom0_build.c | 1 +
 xen/include/acpi/actbl3.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 1864d048a1..307edc6a8c 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -924,6 +924,7 @@ static bool __init pvh_acpi_table_allowed(const char *sig,
         ACPI_SIG_DSDT, ACPI_SIG_FADT, ACPI_SIG_FACS, ACPI_SIG_PSDT,
         ACPI_SIG_SSDT, ACPI_SIG_SBST, ACPI_SIG_MCFG, ACPI_SIG_SLIC,
         ACPI_SIG_MSDM, ACPI_SIG_WDAT, ACPI_SIG_FPDT, ACPI_SIG_S3PT,
+        ACPI_SIG_VFCT,
     };
     unsigned int i;
 
diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
index 0a6778421f..6858d3e60f 100644
--- a/xen/include/acpi/actbl3.h
+++ b/xen/include/acpi/actbl3.h
@@ -79,6 +79,7 @@
 #define ACPI_SIG_MATR           "MATR"	/* Memory Address Translation Table */
 #define ACPI_SIG_MSDM           "MSDM"	/* Microsoft Data Management Table */
 #define ACPI_SIG_WPBT           "WPBT"	/* Windows Platform Binary Table */
+#define ACPI_SIG_VFCT           "VFCT"	/* AMD Video BIOS */
 
 /*
  * All tables must be byte-packed to match the ACPI specification, since
-- 
2.37.3


