Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA126BCFAA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510571.788454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmtQ-0003gJ-39; Thu, 16 Mar 2023 12:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510571.788454; Thu, 16 Mar 2023 12:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmtP-0003da-Vr; Thu, 16 Mar 2023 12:39:39 +0000
Received: by outflank-mailman (input) for mailman id 510571;
 Thu, 16 Mar 2023 12:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcmtO-0003dU-Ke
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:39:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae81b22-c3f7-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:39:36 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 08:39:25 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SN7PR03MB7229.namprd03.prod.outlook.com (2603:10b6:806:2e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 12:39:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 12:39:23 +0000
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
X-Inumbo-ID: 9ae81b22-c3f7-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678970376;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pbo/Dpq6YAJQzE3v2Y4Qo4W9ktXOyHT05zR9u34HSB8=;
  b=d6nwpYPHDthjPYtQ+ToROVWy7RUKIZ6TqL7RYMGLezKwexb1P0BJBx/d
   0PTJ4uUZ7vNmYcKr7rvuwW+ebOvEOzZ+EeVhQGAsuGT0eZoAQ3ltkfZuI
   6ofsiVVaf++Jkb0yJheR4raG1Q8wkgBNxuZFl2v24ts0whhUc/inTOTfo
   A=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 100476728
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+3WaQqLzzN3qRLEvFE+R5JQlxSXFcZb7ZxGr2PjKsXjdYENSgzQBz
 2MaW2qBaPyDZzPxfYsgaNvjo0kBsMLQn4NjQABlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVgPa4jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HD1lH/
 79JMwsrZyChtvPx+vG2YORj05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03rOQw3yhCOr+EpW598VlplqMhVY0KwcRdGG6sKOnlWGHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8hS+zPAAFIGlEYjULJTbp+PHmqYA3yxjJHtBqFffsisWvQG+hh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7CJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:LYxipKNV7cJ2NsBcTsWjsMiBIKoaSvp037BL7TEJdfUxSKelfq
 +V7ZcmPHPP5gr5O0tQ/OxoWpPwI080nKQdieN8UotKNDOW3FdAR7sD0WKN+Vzd84CUzINgPS
 AKSdkZNDUlZmIK6vrH3A==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="100476728"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DimTUoZrpc+3jdPYXXHjQtIVnL/3DnsJGAvN87k9U8Q4DjqoQPtfO0wLexGDZV+iL/AmMRJCyF0S2mJniQtLQFJgZztqMDOICi67EEWfvHK3eKo5bXaqD/G4dO0QoKainZfw+orSUFHATOWz0RyTjMTG/mijvFarHcFN2NafVwnX/AUEisxaYPpG1Uj/emb/1Pw0eHm1dRVaVDlxCxMzyGbRKzSSHkAMhEPyAKEsrorcnHJa/8a34rswkV/WxZvhjdKdIq3ypSmh0n24XZlMuJqzhQzdPsUpwxjB0yXjriJqkTZ/KiZHQdshVWTg1E7pEXXdCppHNW7ctECLt6E5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqdocyZBZQTs74aYyOXTZCxOgCOIdtrsgbSB+BFolSI=;
 b=ReOuv+xouGJZmqfjDh5gv36o2Ue8J7+6cDbb2NiVq3tRoX0+t7QjXiFRLSUqkQSWt0F/nUMHXtLJ7uYxPhFqR0YxM/DjXs2xTYYs5Yh8aEOzviKBI2k9+mQ+oDOkIwQ8fUTMSq0I677ervYXEaj3hyEHcjKusjRQn1JbrjI2kDgjdiJnGeHbTXZF428rVWZ1KVyhN3LfR+Bei0mMT7vB2JmCINYxhkss5raic7h/5P+cfPGj+frHrI0fEu4vsnRC4rdxKVzDjm5RmPt1sCL+PS92e0Ec9eazYzGmp1iQDXpyYduYZbjH6t6Y5y8fpg/GJfcLCz10n3QFCCcI6r3VcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqdocyZBZQTs74aYyOXTZCxOgCOIdtrsgbSB+BFolSI=;
 b=h+vx4mzi3pKquQdCLX3ef0l0nYzfyNoGVO9P6AM3whb+36BNczpLlLRcPbzr9ia+RhsmlijTEjHNWv2b5Uo9K1FVMEpEjbciv1V6QTRQcsq6DGN73DUhB+gqDYZcl1deBfL5rfKCWD2065jd4oclPBqKOAsQAwvglZ1cob7K5oA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 13:39:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2 3/5] x86/paging: move update_paging_modes() hook
Message-ID: <ZBMN9tPllK3Cqnqd@Air-de-Roger>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
 <032e81c2-ac86-638a-1611-43bc3bea6d0e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <032e81c2-ac86-638a-1611-43bc3bea6d0e@suse.com>
X-ClientProxiedBy: LO4P123CA0480.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SN7PR03MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8021ac-3ba6-4757-5ae5-08db261b78b0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n6u5ZrOIPZswhRZn8dgfDb6xZvHq1Oo6P4OcKv2AgLJTwmLevj1TSf93zlqKffK3bLRH5j0kQGZnEnWwUQ9uiXp+IDhjrUcb6FPTKjCkFf5nvEpwPOH34qMJPUTwp06fGcnF99WnoJ/zKRvV93xqsW5bhDUDY1PbWsx5SstYklbWwfs8m7w2nvgyoUjKVQETu+8bM7pBqYWB0L/SDSmuP5m5gkWLaTTujq5o6adrXjLQm7xtkowGOOPtWMYm0MQQt/tIFmYcUUzCyq4K1SxlzZWYqkm1lNZBDhhDR3t4QW0lUvZZ8Ae50CNi30vt2nOrJyuQdF7MZZ744hH3VDxgfIUsJFFHtlQ5NEl2noU14TaIbrBw37xi9V03AN24qNVP6ZUMAS9t0wCiRL0lGLpmtN7QIImAUL1Hu9Ny4FxC0E+N6VFIA+X4cHTMGE/no2RLgwh8Twksv3CbWwAXaGcMOgJCEdgAy/qblTVZy8xo6zC1mELr9av/xB6kYw5RrQkHyBxwBw/KwEuwIE0qh2uwLfkPukZ9t15Q1cN59yabAkrUQj2p15e8ysUmZQSNReF67jHJPZZ4JIaV6flHV0l9Zc41AOi/9R9LUmHwjoHQN3g5CkzDxAWUoMB6/lLBjaMwcmpGR0qys7Vnbf2dWlrdEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199018)(4744005)(186003)(66476007)(5660300002)(66556008)(66946007)(8676002)(6486002)(41300700001)(86362001)(478600001)(6916009)(54906003)(316002)(4326008)(8936002)(6666004)(6506007)(26005)(6512007)(9686003)(85182001)(2906002)(82960400001)(38100700002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFQ2My9xT0VaaU1wQzI5YWhPTXF1L0tSNndsVW1ybUxncGNjMzUyT1dnSTNF?=
 =?utf-8?B?Rjk5c3pXRytwM2kwb3FEaE91ZURHSlQzb3QvNTNKVFVwMS9vZkFmLzhJNFF6?=
 =?utf-8?B?dFpWNEZTUFNJc0U2R2M1aDhqWTZpY2JoNUd6aGJvdjNNakFhQUdhRm1RTjB6?=
 =?utf-8?B?aXFRNXFzaSthSUN3aGFKRFAxcER6aTRjd2lESllBNEJYcm5XQ0RpeFJDSFJh?=
 =?utf-8?B?R1hwbXB6dHVFVUFFSTFSRCt5NnYwUzR0ejdHbFEvYnlDNVE2dkVsaHp2NjZy?=
 =?utf-8?B?M2htMEFMcG8vYkZUS2daUHVjL0tJSUJmR3poZ0QzNE12Szl3KzdEUnRBeENy?=
 =?utf-8?B?WjRyZ3haN24wY1NyQXlEUEYwb2tPZUZtZ1hCMCtqNEFGVlJkMG9oRXFla1lw?=
 =?utf-8?B?MEdKcHRyeE5nNy96UTlOWXZPMVhUQ3Q5REFnbGtyZ3pqTXZRU3pneEhhREwv?=
 =?utf-8?B?blQydndINEg0NGU1UmZyVUh3ZW9tYnhtV21yRkxxTkluUzF6VDRMS3BQZ3Qz?=
 =?utf-8?B?NzNqTHltUkJkZEVxRm5BYVpmK0tNSno4YzBzZU9GUVQrR0dZQzg3QlErSjRK?=
 =?utf-8?B?NkVYRDU3UHBUL0lSL0pXS0Y0Q0ErdHJlZjRYa3NZTkRsZWNhV0tqUHY4Tm9D?=
 =?utf-8?B?UGM5VWV4bFI5YUdSa0hSVHNWcUx2bDJORE9pdmNXWElZVE5KTENFTzVpYWxx?=
 =?utf-8?B?QmUwTWo3RGtjZzJsT1Uvem9QZU5KUTNGdjd0VjFqb1ZDWFkwdVo5TzQrVHps?=
 =?utf-8?B?UzNDRWtQZU92T2g5WjRzOE1UcjArVmRYc2JMSWtJb2N4ck5sd3FQV01NRHBp?=
 =?utf-8?B?REJUb3p0VmFTcG4rdUR4NlVGbTN5SWdUZDdoMmhwSVdtdENobldzdGY1ZC95?=
 =?utf-8?B?TmRDOURGV3UxMWxQY2RjeTExbDdWNmZwOUd4a3htZW13RzExZ3FDWkQyUnVv?=
 =?utf-8?B?WDhlUVlPNVp3S3ZINHhURkpwWkJyN1hyZ3lZd0V5N3pualNaUkxFWjlZTDdl?=
 =?utf-8?B?MjY0TlV6azJhYTlkQ0w3Vyt5UzlqTG55Y1hRTk5ZVnN2Lzg0V0x1OWgyQ2E1?=
 =?utf-8?B?alRySXhhcXplNFozT3dDZGo2bnpad2tTS0FiYzdnOFJDamhyZyttcTAvQXRl?=
 =?utf-8?B?R2xHTEdPVi9EK3RLS2FiQVY5NkE3WTQ0eTJkQ3RPRHd4T0JJdzIrNXVrNUYx?=
 =?utf-8?B?elNpdnZ4b29CdnJZdndPbXIrc013Y3IwYjEzaDRkMnZXUzZFNUxVQUhlV3RT?=
 =?utf-8?B?eWZ2NURrUk5ZaFZyTWFJREg5ZHZjNDdYd2U2TG5kWCtQK2dRSG8rOHNkY1Rw?=
 =?utf-8?B?RS9hUXRuWTgyK3d6RUFFZ3N2NmNQZzYwcGFyNjdFYk9XbjhSMVorNloyNkt1?=
 =?utf-8?B?eWMyVHpZcVBQMTRLeUdxajAxZW4zV0t6bzdGRWM1UldBMjVtbm83ZWV5Rm5G?=
 =?utf-8?B?T0gwY3ZwZUtEYS8vcUFJMWh2djlGT1RZaXgxWjUxOFp1c01Rbyt3ait2N29v?=
 =?utf-8?B?Ujh1MmZHeW9WVjFnMjBZVHM4bUs1SytCcklYR3ZFc2VQWWErQk9aSXZlZzRj?=
 =?utf-8?B?UitqRXJmRktvUzZobzJSQ05XRmNYMlltb1FBUkEzRFVvdmdVRHQyQWdsSHpz?=
 =?utf-8?B?c000Sm41eHZHZExiYmR4a3RvVGtKWVovT2RlQkZtNGpDNmp0bnZpSmtKNjlx?=
 =?utf-8?B?c0JKcmRPZkxXOU1TZ1dSQ0M1aDEzYlJjbkNNTnQyZDhmN1JJUXV2ampENnBH?=
 =?utf-8?B?TzAzMkZ3VGpGY2xJbGNzK3BkTzBJNTlXQ2ZZZWRabHVSQy94RmRKdkp1cEsx?=
 =?utf-8?B?QVYrVURIM0QxTHRhRXlHdmlXN2VIcVN2YWNTampwMXZZRG1jZVIvMFcyd2FO?=
 =?utf-8?B?bkhVSmwreGcrdFRCZ1ZadnZWd1UyeGVGVHlnbmo4MTNMZHFsUytZTkd6T01W?=
 =?utf-8?B?RFhKNmkwdWIvQmt3UGhYZVplbEVkWUt4d2NUQTREZ3I3QXpJVVhCNHh6ZTRv?=
 =?utf-8?B?aXZBcGRFYWlyeWNMeTllTWpCNnNtUlBUcVNEbXlJZVVBb1R2bWllSjAxcUxK?=
 =?utf-8?B?ZThkMStGNHM5RE15VHJINWlSbzhKTTA0bVdOTXNxQkFGa29GeWZRVXhXS1JO?=
 =?utf-8?B?YmRURlZJMUJubFdSQzJSR2RWT0IxRndhcjFpTVVDOE9PREM5dnNSZVMxTUc3?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bMkqfKmpbXvazMwiL0z1wUkswyru6cAfGBURGF/RXMRnHymdFOqj5Q0gzPrwUbcXDdVm4OrC4DtItf8gsPjKFaooky/4Y7dxBV3/l8Y4wofl+6FTSwjwTqBkQtR4PmG7lx3Yo6HTLdYmnyvBEg1SVftuqznjPRfWdVj1Sya/ramOlKX/TJ9Ix/rNK/1jFeFdprrqjmUxwnmdBnJ8rL35UoNChPaSQVaPev20hDgoYoipo/GLADvWEN64Yyl57KQzm+1hspYQzMjy8PCdWES64riTYLpksnqLVsemhjuAqB+TEQ00hiiyV7MnAYSvLmTDDjogsETlTRTdt93yM8ZedIxlyoKOHYuNWsBAmxq61hQkY5Ir6pxkqHMxK4zyG7DRqMXOS8coPZ3vmXoM3g6LfOIzUCjaOcdhQSt7kMBWtbqfelciRgFQLWYQ1g//jm0zHKrJwp82YvToDWaMlvtLF20bP5ACoksEntSosXpbcQdB6cOmxED/wqOtYVp9s6GLfL5Mm1cmlArAV4dtmqFpgngFyU/JTjlNPnkTfCZuPAf5ddlrLJU8FyFDwQOPcaj698WVBjKlCcSY7Uh4A1BRn/jaX9lK4JS+dTrdUwEwr9tnhqxe2fjJdaGURILh4uVztsd/Vs4six8wu24vyn39qZdM/thcKgZLEQCv1ghF7xjv3hxoJCJpEh6jjT4TfktWFiHIET5yURFmBE9I/VW3G5H9h6Fk6J7zOLnCz17ght2fchIk5AXh/1yUqYHyYKJT2iM1twygYht6HzUIkRNDoP/GQMDsvs+nZN8BjMfIMdeHn0AE9tgJPOuBxYps9nLeVx02JcmA6gUOznjT+83D5A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8021ac-3ba6-4757-5ae5-08db261b78b0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 12:39:23.5102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaSoR4zw5mp9FjJsXrjPDct+QsRLPtWjzHS4WUPefvJe2afIHkOOqjotq28dsvNapJoq6uVKfmWOJ4iyVSM/hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7229

On Mon, Jan 09, 2023 at 02:40:50PM +0100, Jan Beulich wrote:
> The hook isn't mode dependent, hence it's misplaced in struct
> paging_mode. (Or alternatively I see no reason why the alloc_page() and
> free_page() hooks don't also live there.) Move it to struct
> paging_domain.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

