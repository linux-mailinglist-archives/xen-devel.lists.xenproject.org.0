Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40C6BCF07
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:09:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510538.788359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmPN-0003gv-LE; Thu, 16 Mar 2023 12:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510538.788359; Thu, 16 Mar 2023 12:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmPN-0003et-Gb; Thu, 16 Mar 2023 12:08:37 +0000
Received: by outflank-mailman (input) for mailman id 510538;
 Thu, 16 Mar 2023 12:08:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcmPL-0003eh-OC
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:08:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44935cac-c3f3-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:08:33 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 08:08:13 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5934.namprd03.prod.outlook.com (2603:10b6:a03:2d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 12:08:11 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 12:08:11 +0000
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
X-Inumbo-ID: 44935cac-c3f3-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678968512;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=uXDn8J+pv+h3ndV2YGMRknmZvG+soHTVmBxKhUzTOkg=;
  b=N3yIDf6iBlgsUbWINaFxRAOIBnLBwRq/iHEqHEW0UFLskfaI87+C0gIZ
   YjCQi+5m9k//qi96Du+z4Z6IKzoPVBbSIr38CmXtm7YVtNMmulyKAM2Lp
   22A3cei4vprWuEtlt20fIJt8bRlEc5RhJSDxo5XcSUg7nKpJBHUplkYRl
   I=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 101105483
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LKAjsaJ3dpc6PsLHFE+R0ZQlxSXFcZb7ZxGr2PjKsXjdYENShDcDm
 GEcUW+DMvePZmPwKIhwa4Sz/RkDvpeEzoJhGlRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVgPa4jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5SM11ns
 tVFFAwxVTayor+t64qyE8lF05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMkmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv037aXwH+rA+r+EpXizK5gngOc71AIDQIpeVS5++mwjV+xDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpbdUnsIo9QmUs3
 1rQxtfxX2Uw7vuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW2e97YRIjv0ljwW36vg==
IronPort-HdrOrdr: A9a23:+/A2s6ObrcGqYMBcT6r255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj5fZq8z+8N3WB1B9uftWbdyQ+Vxe1ZjbcKoAeQZhEWiNQtsp
 uIGpIWYLOQMbETt7eB3ODSKadE/DDoytHKuQ+IpE0dNj2CJpsQmDuQTW2gYzxLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ac/nfq8bNnJfGZwdDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWw4VKlMDnwt5jAtXJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 HxiiZlG/42x2Laf2mzrxeo8w780Aw243un7VODm3PsreHwWTp/UqN69MtkWyqcz3BlkMB30a
 pN0W7cn51LDSnYlCC4w9TTTRllmme9vHJnu+8OiH50V5cYddZq3Poi1XIQNK1FMDPx6YghHu
 UrJMbA5MxOeVffVHzdtnkH+q3fYl0DWjO9BmQSsM2c1DZb2FpjyVED+cAZlnAcsLogVpht/Y
 3/Q+tVvYALavVTQbN2Be8HT8fyIHfKWwjwPGWbJkmiPL0bOkjKt4X87NwOla2XkaQzvdoPca
 n6IRNlXTZYQTOsNSTO5uwHzvn1ehTyYdy3ofsupaSQudXHNcnW2GO4ORUTevCb0osi6/3gKo
 qO0a1tcoDexBPVaOB0Ni3FKuxvwColIbkok+d+fW6yieT2DaCvntDnUZ/oVcrQ+HAfKynCPk
 c=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101105483"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etos+XQzQgWUOeY7/OMz75nPSOix3sh+rWEARtU6kjRRxs1DQBfanEtSjXof1y7pcM/Tz6yF88/Ln9dWEKjgHlAPxVNENgLYWJlns6iHkXWXq2A1j1IQdHJUgwG1wqmz6Tzh8EiBi0063GXGywEEAeU8de5tqEMLrXWpVEyuzP8+FGLXH3C5NdHk41hwiSDhtpwebGlXpJ/wnwECNACbYjPYIhbQUvf4H19P1p4TslxWHjhFdBm0K8y4AqHWd1DH4K0rk4zVLYZKqerPjy376mASFCW26g6E12Ugxks11CiFs2BVaFsObWB3PvCmxOHAgSQ91owEQDcAoysuGYfDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vygrCmOAa37dNqvYZOTv23Q2I1fRsVZl6Nb7n0/H6p8=;
 b=ULzpUlfv/ePb2OkMOVQ1Mw8HVzAQ9Zu4Axj3q27LbqpwlRa+OakgJLHNUR1hom/tdbFfQh37CoyAaiaZ6owaKIK+irosC9v0r76Ucs8YH2wonJgbuV2CKUY8uKkO3YAbC86KwTn5Anoo9yiMrLM4zgrhVwktFA3le8JyK2TWkENdRmfhtU0fywofyfharqh3L8UciZ5MHt0VqZj59sy1uj21UqwyYLD7AGkeXfdtcPc+lFOlGCY2rmVIazDZDq2rXofNoG++irg/yroTvR83TF4PDa0TIOClPjC35C+rA6LaVDtbdDwoRGwDWn/GIICrMhEORTYnismKfo4/lvQRuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vygrCmOAa37dNqvYZOTv23Q2I1fRsVZl6Nb7n0/H6p8=;
 b=S+NG+EZ5qOKCpdfhtalO+POrlC7s7KQnnvwz54DgHIIqBUSTZj/Mo/zFadHgaIVHAFrZoI+I3M0ruPfw9CBmasCJe23exzihMX8FMSARutjoTDj1DljfVsXip1VKMYTxMTq/xRYQm2LwTdK3t3XzLqRZ3Wb4s88M8NlW1gmMprw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2] vpci/msix: handle accesses adjacent to the MSI-X table
Date: Thu, 16 Mar 2023 13:07:10 +0100
Message-Id: <20230316120710.38817-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:408:ec::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd245ae-af48-463d-4489-08db26171cd5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xpZH2QWE7rFKZH4cBHsxq+U0C4CiW9/JlX7ZgF3r6RhUjYIL+NSyHKh3Wq7ZgYLTFKqEjNzA/Wij8Kfy+ArJ3/Ewp5F+aEl6U7fwK9ruFYD5N+Y/2y2bp4Q/HeQWvg58meVxntvm+Lme/kJ7DASHKF8jSRKbQDiMyyXVOIiMLwnDSfTfVlDkDCiwGMzqZbIF7PzH6ufi49LVu7wjnHOERv8ybRqTI50KdCsNAuKDAQZsTjgO9T4BN7SM3LLPtmW0jM65gNLE+df8nI9hxeOB7rP/mzDtvV9mDH/21RF2DknXoQ3Qzo4FcJKBuYH8D+HBLdCM/VpPfde1kh7sabAoCpJ6hoyWU6ClDhPcvgmc1+/oz9czI8ZDgdGMDUDndDKDwE4646M6ncxYlRsrWlKR8HeJKpp0uSSnPd5f6hv9vschmbyeTobvpTI4euGmorC215YFpT+7SOdJZOtGzReYDqyg6WhwDSOrJufy/rKWtVx/gKpfz9/ukvvVG5nDz5GrcrRSFhSfEDhb+iRa9CVygndMzCInCHk0oxeaUJ9U428FvDEZ2KLb6baCRIaY6TIHi15CbkK6kt5lyZbW5NgCXRdwxRJklaq0eDylD/js//t7TVGJGZOPNKF33qPmArtyx0rBWBKmu6z7Ub8VKebZxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199018)(86362001)(38100700002)(82960400001)(36756003)(2906002)(41300700001)(30864003)(8936002)(5660300002)(2616005)(6512007)(6506007)(1076003)(26005)(186003)(4326008)(83380400001)(316002)(107886003)(66476007)(8676002)(66556008)(6916009)(6486002)(478600001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnd3TXZoZTRIQ0JvZkk5OTBxQWNCQ0JGalNINkJjb1FxREpoQVhMWHNwTGlt?=
 =?utf-8?B?cmU0MzVRUFpNcXp3N2lpM2NpUGtwNmpaM24rTWQ4d3JHZ1RBMTZ5NkdYeUhp?=
 =?utf-8?B?azF6QU1WZUdIaWJ1UzA5QVF3bWhqTXlLSzBzdDFkQ1RQS2JhaUZEYU9EYlBs?=
 =?utf-8?B?bTB3TkQwSytjUFBqbEJVeU9ZSmZCWWVQQTFlR2hSTTR3YVUxRWtRSHVaQUtl?=
 =?utf-8?B?Y2xuMmxvK0gvcGlKY3ZUZFYrQ0k5S2tTdVdYYk02QXRSeDZ2b0ZtT01tbitt?=
 =?utf-8?B?OUhidDY3TVFseVNTZE5ZM1VDa1NMbDFneUZFSUNsT1lFNWg0RjhWWEo1dzFh?=
 =?utf-8?B?WFRWNlB5cjlucWtmV2REZFNiY0ZDSkYrSFErT2cxQkVIMitSZjQxK0NadGFK?=
 =?utf-8?B?TlhLcVFHVEdHZXYzdkdEZVpSM1hyL2VncmVBSFZIcTVTVjBMNWJzQ1l0dEd5?=
 =?utf-8?B?QzMrM0JnSHlzU2FJbjBJK3RSbGY3Y1JWVlVzNEVxM2UrVUpMamN6RW1SWUJ0?=
 =?utf-8?B?OGtlWmpkR0dmRHFZc00vYWtUWlJSeG04MlZRUlBMcWxwRmcwWHN4eEorN3Az?=
 =?utf-8?B?WXlDbGRLYk9XNE5lZjgwa0d4V09Bc2hWSlJ0QTR1TjIwQVdXcUhmbklTMDRB?=
 =?utf-8?B?N2dCY0tTejFyTEQ0aTBrNE44VTFqSmhic2JHZlJuS2VVYUxrMldNSXJhZG0r?=
 =?utf-8?B?cy9yK3ZmUTVpbnVSRkpoN2lZUlIvWFY4Z1pRL1JEa3VEMmpoQ3hZTEJGMmU0?=
 =?utf-8?B?WWJMOFVFQzNlQ1MwRnFRMUdqL09iNVE0dnVYV04vUi9XMTVNNG5FenFpR3o5?=
 =?utf-8?B?SlFVcnIvVHZMM281K1FwSXloMGNZZEMvWllDSUlENDhVV1FkTGZlamV6aWxi?=
 =?utf-8?B?UUFXRktJTlVEV3Z3MEpJZDhobHoyUFFyMFJZcUJqaURXRDEySDk4ZDdBMjA3?=
 =?utf-8?B?QllqWVRvayswTXFyRnVaREpwdU9ISjRZcW96SEQ2MDZJZ3BXdFdtZVdsc1RH?=
 =?utf-8?B?WUFWa1lkRGtlQy9WTU1WaU83Tjdld3NZNm5NQVV6VlFRRVhCQTlIb0lZK0dZ?=
 =?utf-8?B?UTllMUhPUHVTaHpwMk5nNlhSY3hnenZWZ2t3UkJNbW5ud3JmWCtmNzZNUXdi?=
 =?utf-8?B?VGY1MnB3M3lLdnVYZTIxalVKQmZ2LzZZSUJJdXRkTFh4ZHAvckJzWm1OUXkw?=
 =?utf-8?B?R2xORWtLTENpOVpFbjQ2VzR5VlE5dDdmWitKcTFtYmQ1eFlIUi92aWIwSDM1?=
 =?utf-8?B?d2haSUZ0UWg2SnRjbmloNHd3Yk1RdlRUV2lYb2hRY0JYbnJsMEp2RFhHYjRO?=
 =?utf-8?B?eG02aXdSazZucks1dGxQYStYZ2xieVFpY0F4cUpXM1F4Sk5CNHJ6VHFTNXYr?=
 =?utf-8?B?MVMyakhWUHlnUXNkU3EwUFF3YU5sdzBUSmFld09PUGJkS09DL1EyTU0wTlBn?=
 =?utf-8?B?MXZWZVBMMElkSTdBZmh2SVlNb1FmQXVBNHJ6MmwzbUlOeWVyZWxaMU9kM2lI?=
 =?utf-8?B?U0c4RTN3UENreGtxbWJaNk9nRnpGclFTVml6SVp3c25KQnpJbnY0aHBTRVVw?=
 =?utf-8?B?Qm1MSFN0eWh3MXU3TS9EREFxMmxVTnR0YzRDYUNxZEl4NDQ4TWNSRmVNejlS?=
 =?utf-8?B?VlRGbTU4R05VUmFaNmF6UnNNY0ZmMVdJUDBhcTdqWnRKcHRicjZCYXh1K1dW?=
 =?utf-8?B?STViOStmWEI0YXVrU1U5a3RyS2ZGbXhSRUxvN2xKOEV1QSttZS9BbHZUYUty?=
 =?utf-8?B?MTBlaUZlMHVvSnV0Zk9kR1l4RHhvZWQ4M2VYeW8wakdXR3hWeFpuRzViZ1RW?=
 =?utf-8?B?RlVVQlk0WDh0NTdZQjI4eUtFRkl6a0ppN0N5em1kbHpHaUlMM0YwMGlKYXUv?=
 =?utf-8?B?K0Roc0lBYXdTNGRCZ1hqcUU4U1IyS3dKdTZmT0M5anhkQk94QjhFZDdRMHA4?=
 =?utf-8?B?TXNjdldUWEdUSEV0Mm9LL0UwRGF0Qk1xNk1IWHhiZmErNGxrWDVqbE9Ha080?=
 =?utf-8?B?VHBhNk1hcFlZU0t5d0hmVTE1Z05ZK2QyOHlZMlB4TDZRaENmWk9XOTNuQ2Z6?=
 =?utf-8?B?WkNzRWpTRFFpUUdnMkdVcmJFWEQrSkNBYW1JTlJuUkt0MnBhSHNZSjllTklD?=
 =?utf-8?B?RG90NjloZjZNNjBwMkhmODNmb2hWcmVLQTN0SnhSdmdRM0RnU1dZcm5sanBT?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QnVmvmHO/CtblnBS8TJzi9ppjCUpNiYqnrTQjmNXhP5gJWvRx8ZxiX5T8oXc8O9K0lQd0eXnw2/7hmBML3Rner+NYckwCqboYwL4NOH1GdqnFVJqJaJOSMu48Oam0khe7VEAVfY6cp5qVGhfohK9TIPVR3bYnHleOy+xpGaPXiWaVzG1r4QMdB8eB9D2kD3dSIGRDj/RESfWf/wkQCnCpqRzoKpq31YtkhRLsDIGtXclnoSsFxws99SoEr6v87elbUUxIwDe9t7ruLqQwS10MhrdHmTLXJ9WOP2Oo/e9qPC6ywcJIE0AYbq2OlC1xdjWA50J+5s86PIbSQMJLS7l/zwlbzU7L344l6mQpj7zHn2AH0iDpQPLfHmBgVEdXxu8O5OD8HYJE4AMMdR+pzmpE+/t9S54yWe4H2xMYj43US4K9Ykyw641OykYeG/fVn3nYPwDOJbidm7bjoES8jCo35FroqhjxwEok+9F5t4OaKlLakUXAOrFj9oqyUlIYpoOzTFD2XZdw6Xa7Sue5TJI705fi9CrI8hVlZomz0xaUNMpWqmcP0oz4vcMUszygWFl6Ki+1wofQ7wigMkv1w3OTXUC61S2E3jvIyFkGy504GTok6Smo116KjJ7nZmdIPVe0+GmQhVXHEC5APUH6UxnaYciRkzjQP4CL8Fbot5vOd5+MdNLpFaAX7Y/kpfHwzF2JzMLcaAy1C+GvvCmH8AvsRLU6UhLESKMoGf42hp6zK7LnoHupfqIRewCK15kJTyZQ1Gj+csB63ndg+O5VWl3tw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd245ae-af48-463d-4489-08db26171cd5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 12:08:11.5568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaw4/+GGxQM4MGExcKBCMplQmezTyFWvTx63o525jyFdIQ/96TR8EmtzUWuQ+Ot3T9mShbmgUljE+wxBB9tfNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5934

The handling of the MSI-X table accesses by Xen requires that any
pages part of the MSI-X related tables are not mapped into the domain
physmap.  As a result, any device registers in the same pages as the
start or the end of the MSIX or PBA tables is not currently
accessible, as the accesses are just dropped.

Note the spec forbids such placing of registers, as the MSIX and PBA
tables must be 4K isolated from any other registers:

"If a Base Address register that maps address space for the MSI-X
Table or MSI-X PBA also maps other usable address space that is not
associated with MSI-X structures, locations (e.g., for CSRs) used in
the other address space must not share any naturally aligned 4-KB
address range with one where either MSI-X structure resides."

Yet the 'Intel Wi-Fi 6 AX201' device on one of my boxes has registers
in the same page as the MSIX tables, and thus won't work on a PVH dom0
without this fix.

In order to cope with the behavior passthrough any accesses that fall
on the same page as the MSIX tables (but don't fall in between) it to
the underlying hardware.  Such forwarding also takes care of the PBA
accesses, so it allows to remove the code doing this handling in
msix_{read,write}.  Note that as a result accesses to the PBA array
are no longer limited to 4 and 8 byte sizes, there's no access size
restriction for PBA accesses documented in the specification.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Properly handle the PBA also.
 - Merge the handlers for adjacent writes into the existing MSIX table
   ones.
---
 xen/drivers/vpci/msix.c | 329 +++++++++++++++++++++++++++++-----------
 xen/drivers/vpci/vpci.c |   7 +-
 xen/include/xen/vpci.h  |   8 +-
 3 files changed, 255 insertions(+), 89 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index bea0cc7aed..060b74d62b 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -27,6 +27,11 @@
     ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
      (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
 
+#define VMSIX_ADDR_SAME_PAGE(addr, vpci, nr)                              \
+    (PFN_DOWN(addr) >= PFN_DOWN(vmsix_table_addr(vpci, nr)) &&            \
+     PFN_DOWN((addr)) < PFN_UP(vmsix_table_addr(vpci, nr) +               \
+                               vmsix_table_size(vpci, nr) - 1))
+
 static uint32_t cf_check control_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
@@ -149,7 +154,7 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
         for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
             if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
-                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
+                 VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
                 return msix;
     }
 
@@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
-static void __iomem *get_pba(struct vpci *vpci)
+static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
 {
     struct vpci_msix *msix = vpci->msix;
     /*
-     * PBA will only be unmapped when the device is deassigned, so access it
-     * without holding the vpci lock.
+     * Regions will only be unmapped when the device is deassigned, so access
+     * them without holding the vpci lock.
      */
-    void __iomem *pba = read_atomic(&msix->pba);
+    void __iomem *table = read_atomic(&msix->table[slot]);
+    paddr_t addr = 0;
 
-    if ( likely(pba) )
-        return pba;
+    if ( likely(table) )
+        return table;
 
-    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
-                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
-    if ( !pba )
-        return read_atomic(&msix->pba);
+    switch ( slot )
+    {
+    case VPCI_MSIX_TBL_TAIL:
+        addr = vmsix_table_size(vpci, VPCI_MSIX_TABLE);
+        fallthrough;
+    case VPCI_MSIX_TBL_HEAD:
+        addr += vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
+        break;
+
+    case VPCI_MSIX_PBA_TAIL:
+        addr = vmsix_table_size(vpci, VPCI_MSIX_PBA);
+        fallthrough;
+    case VPCI_MSIX_PBA_HEAD:
+        addr += vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        break;
+    }
+
+    table = ioremap(round_pgdown(addr), PAGE_SIZE);
+    if ( !table )
+        return read_atomic(&msix->table[slot]);
 
     spin_lock(&vpci->lock);
-    if ( !msix->pba )
+    if ( !msix->table[slot] )
     {
-        write_atomic(&msix->pba, pba);
+        write_atomic(&msix->table[slot], table);
         spin_unlock(&vpci->lock);
     }
     else
     {
         spin_unlock(&vpci->lock);
-        iounmap(pba);
+        iounmap(table);
     }
 
-    return read_atomic(&msix->pba);
+    return read_atomic(&msix->table[slot]);
 }
 
-static int cf_check msix_read(
-    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
+unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
-    const struct vpci_msix_entry *entry;
-    unsigned int offset;
+    unsigned long pfn = PFN_DOWN(addr);
 
-    *data = ~0ul;
+    /*
+     * The logic below relies on having the tables identity mapped to the guest
+     * address space, or for the `addr` parameter to be translated into its
+     * host physical memory address equivalent.
+     */
 
-    if ( !msix )
-        return X86EMUL_RETRY;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE)) )
+        return VPCI_MSIX_TBL_HEAD;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE) +
+                         vmsix_table_size(vpci, VPCI_MSIX_TABLE) - 1) )
+        return VPCI_MSIX_TBL_TAIL;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA)) )
+        return VPCI_MSIX_PBA_HEAD;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA) +
+                         vmsix_table_size(vpci, VPCI_MSIX_PBA) - 1) )
+        return VPCI_MSIX_PBA_TAIL;
+
+    ASSERT_UNREACHABLE();
+    return -1;
+}
 
-    if ( !access_allowed(msix->pdev, addr, len) )
-        return X86EMUL_OKAY;
+static bool adjacent_handle(const struct vpci_msix *msix, unsigned long addr)
+{
+    unsigned int i;
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
+        return true;
+
+    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
+        return false;
+
+    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
+        if ( VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
+            return true;
+
+    return false;
+}
+
+static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
+                         unsigned long addr, unsigned int len,
+                         unsigned long *data)
+{
+    const void __iomem *mem;
+    struct vpci *vpci = msix->pdev->vpci;
+    unsigned int slot;
+
+    *data = ~0ul;
+
+    if ( !adjacent_handle(msix, addr + len - 1) )
+        return X86EMUL_OKAY;
+
+    if ( addr & (len - 1) )
     {
-        struct vpci *vpci = msix->pdev->vpci;
-        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
-        const void __iomem *pba = get_pba(vpci);
+        unsigned int i;
+
+        gprintk(XENLOG_DEBUG, "%pp: unaligned read to MSI-X related page\n",
+                &msix->pdev->sbdf);
 
         /*
-         * Access to PBA.
+         * Split unaligned accesses into byte sized ones. Shouldn't happen in
+         * the first place, but devices shouldn't have registers in the same 4K
+         * page as the MSIX tables either.
          *
-         * TODO: note that this relies on having the PBA identity mapped to the
-         * guest address space. If this changes the address will need to be
-         * translated.
+         * It's unclear whether this could cause issues if a guest expects a
+         * registers to be accessed atomically, it better use an aligned access
+         * if it has such expectations.
          */
-        if ( !pba )
-        {
-            gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, report all pending\n",
-                    &msix->pdev->sbdf);
-            return X86EMUL_OKAY;
-        }
 
-        switch ( len )
+        for ( i = 0; i < len; i++ )
         {
-        case 4:
-            *data = readl(pba + idx);
-            break;
+            unsigned long partial = ~0ul;
+            int rc = adjacent_read(d, msix, addr + i, 1, &partial);
 
-        case 8:
-            *data = readq(pba + idx);
-            break;
+            if ( rc != X86EMUL_OKAY )
+                return rc;
 
-        default:
-            ASSERT_UNREACHABLE();
-            break;
+            *data &= ~(0xfful << (i * 8));
+            *data |= ((uint8_t)partial) << (i * 8);
         }
 
         return X86EMUL_OKAY;
     }
 
+    slot = get_slot(vpci, addr);
+    if ( slot >= ARRAY_SIZE(msix->table) )
+        return X86EMUL_OKAY;
+
+    mem = get_table(vpci, slot);
+    if ( !mem )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pp: unable to map MSI-X page, returning all bits set\n",
+                &msix->pdev->sbdf);
+        return X86EMUL_OKAY;
+    }
+
+    switch ( len )
+    {
+    case 1:
+        *data = readb(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 2:
+        *data = readw(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 4:
+        *data = readl(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 8:
+        *data = readq(mem + PAGE_OFFSET(addr));
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return X86EMUL_OKAY;
+}
+
+static int cf_check msix_read(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = msix_find(d, addr);
+    const struct vpci_msix_entry *entry;
+    struct vpci *vpci;
+    unsigned int offset;
+
+    *data = ~0ul;
+
+    if ( !msix )
+        return X86EMUL_RETRY;
+
+    if ( adjacent_handle(msix, addr) )
+        return adjacent_read(d, msix, addr, len, data);
+
+    vpci = msix->pdev->vpci;
+    if ( !access_allowed(msix->pdev, addr, len) )
+        return X86EMUL_OKAY;
+
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
@@ -303,57 +416,103 @@ static int cf_check msix_read(
     return X86EMUL_OKAY;
 }
 
-static int cf_check msix_write(
-    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
+static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
+                          unsigned long addr, unsigned int len,
+                          unsigned long data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
-    struct vpci_msix_entry *entry;
-    unsigned int offset;
+    void __iomem *mem;
+    struct vpci *vpci = msix->pdev->vpci;
+    unsigned int slot;
 
-    if ( !msix )
-        return X86EMUL_RETRY;
+    if ( !adjacent_handle(msix, addr + len - 1) )
+        return X86EMUL_OKAY;
 
-    if ( !access_allowed(msix->pdev, addr, len) )
+    /*
+     * Only check start and end of the access because the size of the PBA is
+     * assumed to be equal or bigger (8 bytes) than the length of any access
+     * handled here.
+     */
+    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
+          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
+         !is_hardware_domain(d) )
+        /* Ignore writes to PBA for DomUs, it's undefined behavior. */
         return X86EMUL_OKAY;
 
-    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
+    if ( addr & (len - 1) )
     {
-        struct vpci *vpci = msix->pdev->vpci;
-        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
-        const void __iomem *pba = get_pba(vpci);
+        unsigned int i;
 
-        if ( !is_hardware_domain(d) )
-            /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
-            return X86EMUL_OKAY;
+        gprintk(XENLOG_DEBUG, "%pp: unaligned write to MSI-X related page\n",
+                &msix->pdev->sbdf);
 
-        if ( !pba )
+        for ( i = 0; i < len; i++ )
         {
-            /* Unable to map the PBA, ignore write. */
-            gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, write ignored\n",
-                    &msix->pdev->sbdf);
-            return X86EMUL_OKAY;
-        }
+            int rc = adjacent_write(d, msix, addr + i, 1, data >> (i * 8));
 
-        switch ( len )
-        {
-        case 4:
-            writel(data, pba + idx);
-            break;
+            if ( rc != X86EMUL_OKAY )
+                return rc;
+        }
 
-        case 8:
-            writeq(data, pba + idx);
-            break;
+        return X86EMUL_OKAY;
+    }
 
-        default:
-            ASSERT_UNREACHABLE();
-            break;
-        }
+    slot = get_slot(vpci, addr);
+    if ( slot >= ARRAY_SIZE(msix->table) )
+        return X86EMUL_OKAY;
 
+    mem = get_table(vpci, slot);
+    if ( !mem )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pp: unable to map MSI-X page, dropping write\n",
+                &msix->pdev->sbdf);
         return X86EMUL_OKAY;
     }
 
+    switch ( len )
+    {
+    case 1:
+        writeb(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 2:
+        writew(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 4:
+        writel(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 8:
+        writeq(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return X86EMUL_OKAY;
+}
+
+static int cf_check msix_write(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = msix_find(d, addr);
+    struct vpci_msix_entry *entry;
+    struct vpci *vpci;
+    unsigned int offset;
+
+    if ( !msix )
+        return X86EMUL_RETRY;
+
+    if ( adjacent_handle(msix, addr) )
+        return adjacent_write(d, msix, addr, len, data);
+
+    vpci = msix->pdev->vpci;
+    if ( !access_allowed(msix->pdev, addr, len) )
+        return X86EMUL_OKAY;
+
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6d48d496bb..652807a4a4 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -54,9 +54,12 @@ void vpci_remove_device(struct pci_dev *pdev)
     spin_unlock(&pdev->vpci->lock);
     if ( pdev->vpci->msix )
     {
+        unsigned int i;
+
         list_del(&pdev->vpci->msix->next);
-        if ( pdev->vpci->msix->pba )
-            iounmap(pdev->vpci->msix->pba);
+        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
+            if ( pdev->vpci->msix->table[i] )
+                iounmap(pdev->vpci->msix->table[i]);
     }
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d8acfeba8a..0b8a2a3c74 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -133,8 +133,12 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
-        /* PBA map */
-        void __iomem *pba;
+        /* Partial table map. */
+#define VPCI_MSIX_TBL_HEAD 0
+#define VPCI_MSIX_TBL_TAIL 1
+#define VPCI_MSIX_PBA_HEAD 2
+#define VPCI_MSIX_PBA_TAIL 3
+        void __iomem *table[4];
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.39.0


