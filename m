Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9D46FEAF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 11:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243745.421750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvd4L-00058y-Bn; Fri, 10 Dec 2021 10:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243745.421750; Fri, 10 Dec 2021 10:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvd4L-000576-83; Fri, 10 Dec 2021 10:24:01 +0000
Received: by outflank-mailman (input) for mailman id 243745;
 Fri, 10 Dec 2021 10:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/FQ=Q3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvd4J-000570-VW
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 10:24:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 471d8575-59a3-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 11:23:57 +0100 (CET)
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
X-Inumbo-ID: 471d8575-59a3-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639131837;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Kd2HoYwBbziqNPpDhxPJEllmvWBaerBUGNRcTkyqyWs=;
  b=bo8VpEVw39wjFF92I5XGHBfPdpyspU71s7sX3u4MwiJbmGe0kgXWYmOj
   sWC/ps4tEZh97T/xDShvEdX8bczU168snYJKqgrYvKZuCzwt/fyAOX4TI
   kwdhsJom6hrnTcyjTDIGlr+17Bgr9V2kxfThvZAM4u6Ya9pYiqPY0/kYh
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HGusIPi4fDszCd31UddWivVt3nVGatmqjR26qwpTPsT5qFsMG6JSPUzAKsvHpOFuYh9jv0L4oi
 6tLib+QsYP00dQ4vnHPQ4tKzsEVDtaH/1wIsnlsKyxxFsY4JQkRAdNM+BWlCoMu10ay2L8PXcE
 mNZzVTgbTLiTwniFNCANDevIy4Afu3s8d8ErEjhFa9AqPjOUdTWxW9wtR5AfB01xBhv+l3hbsK
 9+bNjrwibPpjtdZbV53rr1K6K8dM7yUvCkW4XcxQV0pSHTVC+tW27DQ4nMBtl3sPsjOS/dxEk9
 MfVLkjTp0woVBHqI+0ZeArwo
X-SBRS: 5.1
X-MesageID: 59717066
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LZd/O6NJflQ24BHvrR17kMFynXyQoLVcMsEvi/4bfWQNrUp30mBWm
 2sXXT/SaPqDMGT0ctlwbN+z/ExSvsLVm9YyQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s7w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxOsncFui
 4lpiaC1eAAlOPfWm7UZDjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/ibuoYHhGlu7ixINc3eQ
 OwTeWFlVzvrMyFxBQZKBJcuxt790xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWehXyVoV1Af+ZsFtw95AfX0KmF51uwUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb00qXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj71hu+aTNT8D2BN1bQ9xawYRGp+ZgPe1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zoC/7It0MvmkveB8B3iM4ldnBO
 he7VeR5vsA7AZdXRfUvP9LZ5zoCk8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3a5HXlk4BCbKmOUE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVBCe0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:zQp+OqDG/OiAP1flHeg2sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.88,195,1635220800"; 
   d="scan'208";a="59717066"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3KdZCewbeq6LBW9kOZK5IQiAyhhNiLZUp/kEMZ7CQYqLUKzMMKj/cfsyuYwQKJO41g3QKtbRoprfckNEe4j/Pw/GLZTKyLgl+CaFfuCaLcGgxvTyimXbrTbLeAg9xi/Yk4fxct8FCNy2OyMtmMb8cdfqFD6BiJJlDsD7wwnKIi19a+u3tlo7XrpGfO0fYJb+1T7B2m0XwO3dxSldaPkJxDapdCLwrzzDymjZUOd9FDnUk/pUQ91PMdxdVrBCxWD+90iOWMQLJMsdC9ElZ2A7sX8Dky8IW2lFFG1WoYmbB6KW0H3U9EU7y2r5Ia1MYvNJmbOktnRh7vLzDhkVJeZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS/VCWen5cr9Gyvsjr2HYOhaDpbK9eM/3gDHjqR2rlM=;
 b=VFOBoZQ/lynjE4WMOlDTTs8q2xVVyprBeY8uLa7Xe2LA/m24CKFZ2kLywbORRd8AOJ6Ybwkfa3LT59A/ERpecBGJi8NrrTGDCc9+7jgs6elbYJ7JR3JczwvTpcvuvtr03irEOuGB0T4AagdzDd7/WDjy+7NZNOstE1V0fE/JToAlPz+Uw2+2zyHsQ96W7KaeO9JC80knkps7llpqy+YAzztQVGHgsFXjIYy/7LEt5+BFFGsb6lDjCinj87vagoh0KwqK/qCHI49UK5mmdRHET1++kOY6di6qCD8PZgTsfhbBsQICSsn14geLMhp50TTmtvkoRLW90A4CmGrVG3aPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS/VCWen5cr9Gyvsjr2HYOhaDpbK9eM/3gDHjqR2rlM=;
 b=bJ7a/qxoc70W4Fw7b1JVpwtGeMpXIXQcY53nTQTsc1RieJ1gRyQZCT/Eq1BxmRm/xUAuExYMiHIPXUfG5xZmfsG8MTjvSe5gpI78f7d+zEs5kCsT7rHNO3oo0zpGXIrniyI/GpDR7f3DCLy+VCfVz6YSzCZqVrD/hViQ16RQU+0=
Date: Fri, 10 Dec 2021 11:23:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 10/18] AMD/IOMMU: walk trees upon page fault
Message-ID: <YbMqr9jF6aUlTsV5@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <5d4a4cd8-ffb0-951a-c86d-98f659ab8d0b@suse.com>
 <YandfTCG9nkWoyrz@Air-de-Roger>
 <66539595-ded3-b60f-8892-dfb391621a1c@suse.com>
 <b429c9f9-83f4-57e1-010e-59181ec93ce8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b429c9f9-83f4-57e1-010e-59181ec93ce8@suse.com>
X-ClientProxiedBy: MRXP264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac50beae-89cf-4ddb-0d54-08d9bbc727e0
X-MS-TrafficTypeDiagnostic: DM4PR03MB6064:EE_
X-Microsoft-Antispam-PRVS: <DM4PR03MB606412E26201C9E46618B5DF8F719@DM4PR03MB6064.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqOxOLQJL/RmJZ+ATHjlKgxQMFSgfOafYUEvGT5vXS7NQR6lGxIIAQ+aAMLoxsSPCfLSev1ZiHchMhp7Yw4UrIpg0LbezEQr/je6zqZB1RkveyWdtLBGTD35Sb0z8DlYmlGCZMRQ0tZQYPgfuQMzoa4w+AOGZRQYpNV1rsKIeVWlnCRi3ouzJTBpUXUs+ujSS10mwb67K/M7th10SEB+zXKfCSLwPy2NJibaSltJSfl/vTpm1o1qZ8a9O3hIlAuOE1CLRLJygszsQEUOz3HF/wYvREUVTFzvpBgCbqNbyyJQa9IJgJRMaQ2sLRWva0zw4tt7EP/Z9sfjIttkfAvZNLrFg/1VMA1VQUlSkeApc4um5xrMfVQh+wZ0EAlQv/f7XGc3tUz7bdsoKhdJ32cVyz8esQCpN01xsD2rRuvqtae9w7iaSpMqr3TaaBiob0cCE5EFoAkXuTy7H4mTKOfdC6rmI1R0JwtydaCfIAVg9i9E993VcDMMmd8IVx+TYzjuGG2Lpr8HbM011Df7pqNt+G4HKlQyjFIsAquZRxy1NnbO9pIXpDlNjMvuR/zUJ1kJtVkvF9Ns1kpfyjSp8A4EHT4r+ctumzUyu2Tt9UDA86szMZwryUjgPKFA8v62GYtwUcSI0Bu24401wgKDorSJqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(2906002)(6496006)(38100700002)(6486002)(33716001)(6916009)(5660300002)(9686003)(53546011)(66946007)(86362001)(4326008)(66476007)(66556008)(8676002)(85182001)(316002)(83380400001)(26005)(508600001)(8936002)(186003)(82960400001)(54906003)(6666004)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0RpYXFsd1JkS2JYM2Z3Yy8rNFJUNCtaSGh3Wmk0VlUwRWViT1dGME84aGVM?=
 =?utf-8?B?bjlOdFlINXF6MDJTTFBQU2xTQm1EcVJNSXlyaTlCbFlFQU5BSVYzWFRVQm96?=
 =?utf-8?B?ck9wbTBWQUsvUmNjSlVtRWVPMjJHbDJMSnhQdnJOZkhTWnN0SUp5MXRCUjU5?=
 =?utf-8?B?ZjVKb1gySlpObzEzRU1LR2JvS2szZEhFZXlJTnl3blBwRmQxZGoyYzA1UFRp?=
 =?utf-8?B?SnYwY015Mk81TTVVL1graVNOcmEwNTZpYnRyTW5LMlpRUVg2akFxenBIU0Fa?=
 =?utf-8?B?cFFOUFU3dFVZSmYyWllCOTNrNHFiNmJ5REtaeTU3TGpjSHkvZnZqdXRkNTJy?=
 =?utf-8?B?QlhEK1BNeVJHRjUxaGs5Z3BQWjFDUXU3VUV3UXZURitsa2orZDBUcW5UYVoy?=
 =?utf-8?B?ZXZRLzlPQkdMZnd6RFVxT3YzY0t0TWRlZFJYL0hjTVdFelg5MTRtczRLeWJj?=
 =?utf-8?B?YmZFcUw0NG4zVXczTXVGYlFnb2QzSHVUZDBkaVhqS2hoOGRiYkt2T2hqUVZK?=
 =?utf-8?B?KzAzYkFnL09WQW1EZXZxcDVtcHZJc0FMNkQza2JNaXJzZDBwdllXR1V5UWlR?=
 =?utf-8?B?RzBUNDJkNTUwRU5YTWdqNUo4dG16bTFiMzdZS0RtSkk3Z1c2UEFLVHZ5Rk9j?=
 =?utf-8?B?TllIcnAvNDJmUWFnV2tQcTVQbzcvREY5M3VMZ0YrS2pwMjdjUWpHbS9PVHRO?=
 =?utf-8?B?SnA5VE82MVVnaEZrQ0tKa3U5SjZkclNRblBGa0dibWlyc0M1NSsxN01hamRF?=
 =?utf-8?B?eDRIYmFpZ3UybjBpZHJNemRqdE9TTlc4VXkvMjJWd2gzdEV0MHBnOC82dVQ0?=
 =?utf-8?B?VUR5aGJUVVp3S0laRnpUODVYdWxqaEdrUWNjemtZeVNycFpTK2xBTEtwOTlr?=
 =?utf-8?B?WUZKN1g5QzhIQTNTNGQvemFTY0VMZ1FKNjVOOCtJdVRKQ3llTE5YYVgzVVlV?=
 =?utf-8?B?QU5zWVg4S2gyMFlXNGxHS2Jia0l4VTUyeVl0bEpuTmhCT0loSDRGUWpYNkRO?=
 =?utf-8?B?cDlxMWErUXdENE5TTzVFSmRjZHFScldMcWRqb1RZWmx6Q0ZTSU5XTXgyZjk0?=
 =?utf-8?B?Zk5aeG5hazVJdnFDelhWSkhVcVpkUkxZNHVlRmt6NnpnRmhhWVpDWEt1dlNo?=
 =?utf-8?B?b2JDYWlIaWViNkpxWDZhSGtGUWtlSmJlencrcU5IZlhtc3EvSVFCak12azdG?=
 =?utf-8?B?REtla2J3dlNEZzdhbEJsS2xXNTUwT3pmTlpBY0c3L0VodHM4MkpXQmRkRTdi?=
 =?utf-8?B?MmhYV3dLZ2h6NFFib3NlQWZLK01aZ1Voam8xUVpwYzN4cWZBeERBOHM2bFE3?=
 =?utf-8?B?RXVLdklvQ2NMUXVucFJFWndUS25iMldxWTRSeTJaR2hvNjJrbFRaSVZMSnlL?=
 =?utf-8?B?TW8zSjNwNnVsdTRWVXBQU2kyNTk5Y2hOYnBCNmtlN3cyR1FRR3NuYlFTUG91?=
 =?utf-8?B?Q1hNMkpXTWRlWXJnOUJmT2cvT21pZnp4TDVPSkRBSjJxNmRuaElrL1U5UnBm?=
 =?utf-8?B?L1NNOFVDNlYrUWkyVmFQd2xGa0pucVAxWnJ2NU10U1hYQ1pyT2FPY3U5Qi9I?=
 =?utf-8?B?RUkxNGtJYldKUVBNY2s3WVA4TkUzb1V0QWtJU3hnNmYzN0wyaFlKV2pTd1NI?=
 =?utf-8?B?b1FZRGZIQk9IdEZBb0wxQ3hvcGwwMEpnZ2xvRE9TcDZCdlMra0wvNEZmVmtN?=
 =?utf-8?B?MkgvK256TWZvcDcxZzgxbG0vejdSemJHeXRxazkzWGZib01GV2svVUQ3NDlr?=
 =?utf-8?B?V1dVTjJXYi9vNGswd3FZODQ3aDFVRTc1bitXWkp2SXk2SHQyMkpyWDlPZUxj?=
 =?utf-8?B?TXRIdHhVcXJsVlhWRzlGZjJMRnUwZS9BNzRPZVJsREZvMDgwdUJpZk1mNEVF?=
 =?utf-8?B?cUZ1QmgzVWlMd0tWUHNwTmJXdGFSSmk4c010YW1tckQ3VFV0WWpNUlU3WmlT?=
 =?utf-8?B?Sm9Dbk9zNkRXSktuYkVRTDRVUGplaXh5RFY1dDc1MUw1UEhSV1dBK0VFNllT?=
 =?utf-8?B?UWFhNFlOU3gyZnJUNklGUzkzMlljS25GUWxXZ3UyaG5CbER5MFFzZGNtK2VR?=
 =?utf-8?B?MEM0aEVCMW55LzltNG8wb1JIdUpsbDRDRkVNcitqK3I3TjFjM2tpRlpYa083?=
 =?utf-8?B?eG5NVUtEdDh3R2JpeExNWDVzMUxkejIrTmJKR0QyemhTVGpjNlBuVE5Md01H?=
 =?utf-8?Q?n+V7IEn3j0cafCgJsviebI4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac50beae-89cf-4ddb-0d54-08d9bbc727e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 10:23:49.3259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gz62jFYnOZUvaLIUaua0cxwrWHfm7Z8oI4yviP7Z1mdbZJhiKUvy+t7tIs91jz8GrCc7MnEdL+QwQw1zSG2ACA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6064
X-OriginatorOrg: citrix.com

On Fri, Dec 03, 2021 at 10:55:54AM +0100, Jan Beulich wrote:
> On 03.12.2021 10:49, Jan Beulich wrote:
> > On 03.12.2021 10:03, Roger Pau Monné wrote:
> >> On Fri, Sep 24, 2021 at 11:51:15AM +0200, Jan Beulich wrote:
> >>> This is to aid diagnosing issues and largely matches VT-d's behavior.
> >>> Since I'm adding permissions output here as well, take the opportunity
> >>> and also add their displaying to amd_dump_page_table_level().
> >>>
> >>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> --- a/xen/drivers/passthrough/amd/iommu.h
> >>> +++ b/xen/drivers/passthrough/amd/iommu.h
> >>> @@ -243,6 +243,8 @@ int __must_check amd_iommu_flush_iotlb_p
> >>>                                               unsigned long page_count,
> >>>                                               unsigned int flush_flags);
> >>>  int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
> >>> +void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
> >>> +                             dfn_t dfn);
> >>>  
> >>>  /* device table functions */
> >>>  int get_dma_requestor_id(uint16_t seg, uint16_t bdf);
> >>> --- a/xen/drivers/passthrough/amd/iommu_init.c
> >>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> >>> @@ -573,6 +573,9 @@ static void parse_event_log_entry(struct
> >>>                 (flags & 0x002) ? " NX" : "",
> >>>                 (flags & 0x001) ? " GN" : "");
> >>>  
> >>> +        if ( iommu_verbose )
> >>> +            amd_iommu_print_entries(iommu, device_id, daddr_to_dfn(addr));
> >>> +
> >>>          for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
> >>>              if ( get_dma_requestor_id(iommu->seg, bdf) == device_id )
> >>>                  pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
> >>> --- a/xen/drivers/passthrough/amd/iommu_map.c
> >>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> >>> @@ -363,6 +363,50 @@ int amd_iommu_unmap_page(struct domain *
> >>>      return 0;
> >>>  }
> >>>  
> >>> +void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
> >>> +                             dfn_t dfn)
> >>> +{
> >>> +    mfn_t pt_mfn;
> >>> +    unsigned int level;
> >>> +    const struct amd_iommu_dte *dt = iommu->dev_table.buffer;
> >>> +
> >>> +    if ( !dt[dev_id].tv )
> >>> +    {
> >>> +        printk("%pp: no root\n", &PCI_SBDF2(iommu->seg, dev_id));
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    pt_mfn = _mfn(dt[dev_id].pt_root);
> >>> +    level = dt[dev_id].paging_mode;
> >>> +    printk("%pp root @ %"PRI_mfn" (%u levels) dfn=%"PRI_dfn"\n",
> >>> +           &PCI_SBDF2(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x(dfn));
> >>> +
> >>> +    while ( level )
> >>> +    {
> >>> +        const union amd_iommu_pte *pt = map_domain_page(pt_mfn);
> >>> +        unsigned int idx = pfn_to_pde_idx(dfn_x(dfn), level);
> >>> +        union amd_iommu_pte pte = pt[idx];
> >>
> >> Don't you need to take a lock here (mapping_lock maybe?) in order to
> >> prevent changes to the IOMMU page tables while walking them?
> > 
> > Generally speaking - yes. But see the description saying "largely
> > matches VT-d's behavior". On VT-d both the IOMMU lock and the mapping
> > lock would need acquiring to be safe (the former could perhaps be
> > dropped early). Likewise here. If I wanted to do so here, I ought to
> > add a prereq patch adjusting the VT-d function. The main "excuse" not
> > to do so is/was probably the size of the series.
> 
> Which in turn would call for {amd,vtd}_dump_page_tables() to gain proper
> locking. Not sure where this would end; these further items are more and
> more unrelated to the actual purpose of this series (whereas I needed the
> patch here anyway for debugging purposes) ...

I think adding a comment regarding the lack of locking due to the
function only being used as a debug aide would help clarify this. I
don't think we support running with iommu debug or verbose modes.

Thanks, Roger.

