Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C76A0697
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500209.771478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9BR-0003HQ-Fi; Thu, 23 Feb 2023 10:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500209.771478; Thu, 23 Feb 2023 10:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9BR-0003FZ-Cb; Thu, 23 Feb 2023 10:50:41 +0000
Received: by outflank-mailman (input) for mailman id 500209;
 Thu, 23 Feb 2023 10:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pV9BP-0003FT-Fr
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:50:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7b188b2-b367-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 11:50:38 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2023 05:50:28 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5639.namprd03.prod.outlook.com (2603:10b6:5:2c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 10:50:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 10:50:26 +0000
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
X-Inumbo-ID: e7b188b2-b367-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677149438;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TjLloH/KNTkgRE0ZBRqwjS44bh0g4V2xC78Tb/zFma0=;
  b=W9ApNW2PLD1I5pi9jZiT7tI9hRmto6/kdk9oWoVwda+GE2/cZxCgcYaX
   ivxt2ODFqsThs/MX0ochfqUfSTV40XZq00OJ9W52yb8oZ7AF3TkXQ+fVW
   9Us7Ld6AfXwbi6jIBQs6Td0PTNTM7d0sbKXwbcWzjG3GoPyl3zrJNO1Vu
   s=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 97585219
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pZ5px6IZUiJw09sYFE+R6ZQlxSXFcZb7ZxGr2PjKsXjdYENS1mZSy
 DEZD2+PaKqKYWP9fdp0atm180gDvMXUztAxTAdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5lHnNW5
 KI4Mgk/Yy+/2+627LCCSfZj05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSJpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eewn6rBdhLRdVU8NZw0EzCxFUxJiEIXEmSoPeD0HCFQdRmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmH17DG6gKeCm8bRxZObdUnsIk9QjlC/
 kCNt8PkA3poqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWdi9T0HXT13
 GqMpS1n3bEL15ZXjeO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:nGTKqq6qgJFh83dwqAPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.97,320,1669093200"; 
   d="scan'208";a="97585219"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4LEjw001EVVkS7dwbHifxF63iTgQ7gOcI+I+x10TZI4sWpPjBjtGakw6Y3rXfa1/s3xpaLyK3ABa1LiQluxFx3Fo3S2ft5WrLIE9ZDjcWHp8ykPcVVeNuNmLEkanIsWWrpkpSjonpPvcy8oV3bSel4zvCQVCc20aiu/SM7QiCzNMD+d9ECI80UOQoqU9dXRweXSWSw+FXqxBe8IYf8cokVHmxmyt270Rsga5nAtMEdZn959ABHv4hwWzdC6L34vSpOanVqfVJa4wwzC/rBYkUrBKIzCmbPgh1DNJJhL/I+bSVvk3xy4uhygzoLIQrxHkUw8opZjIEYnlOG9lG2rBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/tXN2Q8taSMsAcMfz02T+xeXvn5gf+arlcTs2lVIKs=;
 b=bkNysSqFEsuEbGktq8Fys5CTxkSJlcROv/xpQHT7Ij8bYe7emU5mN7A8oeG1BTS/QSs0upNn0b/tkb8eBHiFO/Rrb8IybkN0hOx8xi8NTvKDjMY1RENThB5N98hCOopQ2F/zshytJ2z+H0qc0mSOFiKlWf+01KZEijWDbRewoKZrsYy9HSjjzuWOBr7DFyjCC2YpyU86SK/ub6jg1iCRnKcyI406Wap5b0u7z+zDrpiQYyZQAuxlMItvG9dpB5N09jN1m7IXp2L5A1t4msTtv7sPTB+zSIhS7Ika9uNRaRyrtJDH8q18d3Hd3sFWftYlarSMw4SnQgoXTgobE/bjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/tXN2Q8taSMsAcMfz02T+xeXvn5gf+arlcTs2lVIKs=;
 b=iWuJOkmsrLWRvTWLIRbWlvXiy2L8eNDQuhmjOShviG+oqdoYhfu178ztV1QKPgNFcZEUptgvv+d6d7qjk9LWV3l29xL/fcnyDrxw8h2bIwK2IcZQZTjdTUM1K6ZYZtsbl9qTtjFxnSmAWg+y+2XqdUDDqfsqslgTrMbIjgD+Gbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fddfa8d2-fa32-83a6-0781-08999dea31d7@citrix.com>
Date: Thu, 23 Feb 2023 10:50:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/9] x86/svm: remove unused forward declaration of
 struct vcpu from svm.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-2-burzalodowa@gmail.com>
 <d3d892a5-c641-c945-0f07-9bf0e8cf5e80@suse.com>
In-Reply-To: <d3d892a5-c641-c945-0f07-9bf0e8cf5e80@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0318.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8d881f-abc7-4f19-0c85-08db158bc543
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OOsAKy7oSkRNEV0otw2l5047jsT8HIE66/TptKZGFAqiE7wxkq7dIQaVr5EQ8zYhMTT+y+Z8EZQ3B/kPEWa5MEt+hfBcKQWS0m+YOf5bgjs7B2CLGWUJFv1+E6CwQB5S3CNBdjaHL0FdvioDsSPR/HwiDfhCD78FhGHaWe+ApFodlqCszLRwEScKIKRHHZQFJ9DpG35mpIBHPr0rvRCDDyQfHFxbOPlrQvdZ+wdoeltv0ZYrKudLma5zUpb9vrWLMJQRYhaPF+yBmOvR+HS1nUsitmP/0t39oH1Jy2g/hTXZfJF4/PGX0UxosGfIz4w1hsC1jIXFTanqgkEKEondyvG/tfoEVE2QqzNQSjuuiU1Bje00YXjM5gzzkojd5ANkG4O6sXiVq8UV2Dqxofl3W/KBWrwH9pUoiYpNR/okkEK3XNGGKU4MMkmAxWIvgwwKwG6GP5OhGmkiNkjOtx6UOflaTtb0nlp649+sVxy9bRwVXjvbrKOOuLy6CmxNINjAo6tOjoL4q3O9tAY8e6FGDIqzcabxzVMdOcQlV+4cmV4FG0+GvaU/YL7UNdoKvAHUkfc1nANuSbXbzCvUAPdBTMB5de9TWbLnpU/fddFp811sDtI2Q5gQ5GavMsY7NN6tKW5pvTE8IQrUir1E1jn+d4G7+waRxlSY7IZLKsg78dU9Dj3HGc18hlBQ6ENvkDs/w8wib5Vm/pBgGy+KqnA3/9d0Lot/jhluvHHJaeC03t0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199018)(478600001)(31696002)(82960400001)(38100700002)(86362001)(2906002)(316002)(110136005)(54906003)(41300700001)(8936002)(4326008)(8676002)(66946007)(66556008)(66476007)(83380400001)(6666004)(31686004)(6512007)(6486002)(26005)(186003)(5660300002)(53546011)(36756003)(2616005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW5IN3RUWWtkUXY1dnl5UGN5NjE1TmM1ZHVNUEw2RDVZRnNzYkt2RmRKOTRt?=
 =?utf-8?B?WHkwVmNsUFZBOGFpNkhBYkV2U1FKZHhpcU0yTUdGazBkRmNVK1p6b012UG53?=
 =?utf-8?B?U1lnWXhQeEJuQ0xpcENhdEhFTjd6TFEyRzRrNERiRDgvVUd4OTd5WTVvRXdl?=
 =?utf-8?B?RG8ySVBIUVdIRlh2enpJYXJiMXVseVlYOGY1SFNIczNkbTRsQWdTaWNoN200?=
 =?utf-8?B?MVhLNGR4bU4rcHlXb1dwa0JCaGlXQ1Y2aVdLOGhpTHpXeE4wL1gwMkVSMUJO?=
 =?utf-8?B?TkNiK3dsTnJaNWZEZ0dQcUU2cGFPMy9heG1GN1hobDF4TjJ4WmQ3cHhtV2Fw?=
 =?utf-8?B?ZEpidEQzbnZ0cDltQ2ozVGVySU1WbTdta0dQSDlaWHVGZXNTcmFXS21kcU9X?=
 =?utf-8?B?ZERNU3RkZzJWM0s3ZTM0NHFMK1d5c2ROWlNEdUZVNVV4OVZnV2Y2QmNreUgw?=
 =?utf-8?B?UEhUYWorenAram1zdWJpYTVmWDlHamVJNkFhMEFIbDFXM01janVEZ3VHL3dL?=
 =?utf-8?B?bjRIVlNmMENVdGwxT2o3TzBRYTNSVW1xVVNFcUFoVW5zMzdQNTdub1NRUzlP?=
 =?utf-8?B?czN0aWdYb0ZibnhxN1ZBakhsNnF6aE9uNzdQMnp2RHdHUldGNUM3amp4Qmo2?=
 =?utf-8?B?ZUdFMkJoc3pzMncyaHlxU0luUXhobzN1Z1JKclZaOWZsM2c3WGVSK1paYk5l?=
 =?utf-8?B?ZXVlTEp5eEs2dXZMbkRQMnpKeS9WY2s1TGJVWnlQbGVjVmdUZXBuWUN4ODBH?=
 =?utf-8?B?eEhEQnJoZlBuMFhDSVV3c2FoKzZiWE1uMzVNUERyKzU0ZTFQdkptbzZFQjR6?=
 =?utf-8?B?aU9lMWVVL1R3b3g2SUtReFVjVDM1TkJRR2JlUTZJN0cyeHdyZkdWV3AydzFF?=
 =?utf-8?B?THdBRVM3QS9RVFhYSFc0TTNEQm1ZVkZ0am5nVjl5dHUwUlZDblM5c2NTTGN4?=
 =?utf-8?B?cWxCNk9TU0hZdjEwTkh3RS8rWHhpbG85dFpqekRGV1lUM3B6OW5iSEluUzNL?=
 =?utf-8?B?c0tJckxyYUQybGRYL3JrL3NNZVlTWjRGOU1rblIvVm9rSnVXUGFWZndwOVhC?=
 =?utf-8?B?S2N4anhLTkVUOWR6U0IvWk1UUlRjWHpmZkxMTlZqKzJOdWI3UHNRM0pPTGh5?=
 =?utf-8?B?d3NkSGgrQjVYT0xydVdqckI2RHF3eGNYbFR4UlU1T2lyWTdUY1NwUjNYNnNV?=
 =?utf-8?B?eStZRXRpdHFleHliSlplL25hTmJTaEJxOG96RXVrem5kVU53QXNyeFhJcjg2?=
 =?utf-8?B?VmZHVnd3R1N6OHRkR2NYYklQWHZadFg4OUtZK3dwQ3AyZ1hpN1NHK29LRlpy?=
 =?utf-8?B?VHhta1F1bUM1UXhncjZBeVNBMzk4R3FQeUM2Sk1yb1V6amorWi9veVJFakhR?=
 =?utf-8?B?REl6cUtneVBmV0FRNEJ5b3JYbjJsQ1Bpc0huSDk0Ui8rdFNFOVdEZ0dTTEQw?=
 =?utf-8?B?UHh2SHFDTGhMTVdnb3JQTnZHeTRGaDdubFkvWkFIQjEvc0ZvemI4UEtQZ1o2?=
 =?utf-8?B?eGpSbzhhTzVnOVR0MEpFc29xdU9MRG1rMnNpNWtaR3ZqUWI2M2tYbFdOL1VM?=
 =?utf-8?B?dDA0TnBSV1dEWWVPYzNOVnVkNFlRSDBQM0t3ekFiSlFMLzNHV25GVGFBeW4v?=
 =?utf-8?B?Zjdpa1pnaVU4Z043WldmY251OUMxamZLbzBJQXB2d1UyVG1mZThiUWd4U2JM?=
 =?utf-8?B?T2ZUNXZFUGNvZmpVWWpIUmR1QjFoRU5qR2pBelg5MzZPN0wyS09qbFh3dEFx?=
 =?utf-8?B?MWlURzRkQ3NEOSt2cWtkemNqTGFtTXdVQmdRQ2xzQ2RtL0RIWVBPK2dlWThB?=
 =?utf-8?B?cnA5TlhWb2wrUEc1SEtNWlJneGQ4SVd0aE9CYWJRRUFYdVJRMWlubkpOTDho?=
 =?utf-8?B?bEdBTFVHRU9jWWtaSnVsYlA4MG9FSHlEcmtDYXNTNUxWaUs1UWhrUm5wbnNO?=
 =?utf-8?B?SnlBcEJPbGRCcGlVOXY2dVluNmRyREhCaEwzZVBjbGNwc1kyUXNud0JYcEsr?=
 =?utf-8?B?dnljQlgvWWJCZllXbjdLeXNHZmM3T2RIajI5bjdFTlQ4U1hFSGtiM1E4VVBa?=
 =?utf-8?B?UEgyNU1iTmxPQUV5aUV1VmlVWmlIcUZFbmdVVDZGTS9sYmFORTV0dmlxdWNH?=
 =?utf-8?B?S2h3SUVjZmFibGdRTWR0N3Y2TU9oaUllT2lNa3E1RFMxU25ZQVZLdjBoeDBy?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hih88SpRaqC4bHEqaU7Rguhi1sGSlCbOqytrwRh+cOMPkrItD1H5dkwQqcgwpupxrAA4RD1t+/gUgR0LphhhEwhBcrEdTlKwTrRVBpHaalXJblPuw1hXFRfeir9n6DQWt18Goq6f/18zTy8s2ifJLRddCvTauMp70DAUEk6h89LwLQvnCr0qk2i6NLhVjQufmPC9YeCd3qb6dhkfVdYIBHcskN0YWGiM1uqOE0abBM3RVZCcIjmFZpfs6b6IyT+vo36c4UQVFQmrM7wJqc+W6NuQTL8rdXXpNrmz7sSF2/+o+rtaP+hz8cJ+ugW9reECG7TNviGc7kvgpqrrURa04zBF9DHEeE4Zi4pSCxS/vgqNF6/RsMFS1diZDB9+iGb1KCUHBdBWK3Cj7wYZSPThhc0FhqkcSOQmXB0W2XEH93Ps1OZvMnW+/b2BSfEmPEqc/usvsp9qmzgsqNnjR1UqC+HiK6BJjia3+NsJ+X125OzRXOZv++pcHn1N3l3kvlW3kQaHZGcRGKinTBNTPK+gb5HMeDihH8X8wAOGbdEfcQzw+sOFrOxayeH/AOehB7jp3Ol3V/ihH1EPVIodsP3ZaeYAxJg5kwY7rMSQwdR69P6pMg669cAPlavbspqiyFfQACf9mjQocmTAMBoMNkbufyTrrXCm64/uuWol4q1lU025/U/mdUASH15dh7JqGJLtROjGRBvuiUN0L0PCQ0qUwRmsLG/WiP7e5MLCu1WbSDz9Max8DF0HGHNPIiOdiga0nGqMPMvbgBmrFe3a3hSw7XoxxREVI19HQEOKLBy+ocdmZvhaDtFtu2lLgMGGiQrETpTAMJTYo3APSqKrfRZq53dlmMJuE9+XV8jZmffTsSc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8d881f-abc7-4f19-0c85-08db158bc543
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:50:26.8449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vm5uv8aKjFS+YM2qT1nfgCcpPbAQR+f82fo7Gm6EMZfXrLE2P/ZrxkhWFmTNLWS0HTt/f78jYNCg4o3HQrb0ZeRZo0WemiAIyxx0hEtQIIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5639

On 22/02/2023 12:59 pm, Jan Beulich wrote:
> On 22.02.2023 13:00, Xenia Ragiadakou wrote:
>> Remove forward declaration of struct vcpu, that is a leftover since
>> the removal of svm_update_guest_cr()'s declaration from svm.h.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
>> Fixes: b158e72abe30 ("x86/hvm: CFI hardening for hvm_funcs")
> I'm a little puzzled by this (a stray forward decl of a struct isn't
> really a bug imo), but ...
>> ---
>>
>> Changes in v2:
>>   - leave the forward declaration of struct cpu_user_regs in place,
>>     suggested by Andrew
>>   - add a fixes tag based on Andrew's comment
> ... I realize you were asked to add it. (As a minor remark, more
> commonly the Fixes: tag would come ahead of the S-o-b: one, I think.)

I didn't intend my reply to mean "put in a fixes tag".  I was just
trying to make an observation.  But it doesn't hurt either.

But I do agree that a Fixes tag ought to be ahead of a SoB tag.  Where
possible, we put tags in chronological order.

I can fix that on commit.

~Andrew

