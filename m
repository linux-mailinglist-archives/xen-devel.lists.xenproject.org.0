Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA23586644
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378534.611745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQez-0002iV-0v; Mon, 01 Aug 2022 08:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378534.611745; Mon, 01 Aug 2022 08:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQey-0002fs-Tt; Mon, 01 Aug 2022 08:20:20 +0000
Received: by outflank-mailman (input) for mailman id 378534;
 Mon, 01 Aug 2022 08:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=omD9=YF=citrix.com=prvs=20515f1b2=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oIQex-0002fm-3g
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:20:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c16cd38e-1172-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 10:20:16 +0200 (CEST)
Received: from mail-bn1nam07lp2049.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 04:19:34 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by SA0PR03MB5465.namprd03.prod.outlook.com (2603:10b6:806:b5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 08:19:30 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409%5]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 08:19:30 +0000
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
X-Inumbo-ID: c16cd38e-1172-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659342016;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=m7x2nODdOm3CdFS1GyvfWSeVLkNnVh/e1Z4IEHA2XwM=;
  b=gDx7osBhOw/Gc3g+bZspWBiFa5cJ3Fchw6jf2leEO05XLqV2dAY8/Y9q
   1PkJmTU+hgvsgMQBqRua9eg2AXnYdMfq/PkRhp3iyV/5FwBiINwjw7VLb
   Hy/naDLKVSc8t6zxBcRCtXvKKH9FaWMnSxaVGoLDnsPvfftv6TO84ki1i
   A=;
X-IronPort-RemoteIP: 104.47.51.49
X-IronPort-MID: 76843499
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3qnzq6w7YjIjssJID9R6t+cpxyrEfRIJ4+MujC+fZmUNrF6WrkVSy
 mJNDG+BMvjcNjb2KdEibYi19E4CvZLVyIcySQI+rCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb90g25K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN0tNEckO4oi4txHWzxJ2
 6NCNA5dZwKM0rfeLLKTEoGAh+wFBeyzZsY1nCglyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCSmNWEJwL6WjfNfD2z7xwxr0aPxMdPTPNiLQ8lUkW6Tp
 37c/nS/CRYfXDCa4WXboi732r6e9c/9cNg3DZCS/L1Du2K03zNMKzoHcFyyuNDs3yZSXPoac
 ST44BEGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6VD3YJZiRMY9snsIkxXzNC/
 kCNt8PkA3poqrL9dJ6G3rKdrDf3My5MK2YHPXAAVVFdv4ilp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddj3NAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:6Y8Cb6nK/MiNgtuV8N6Od3oSo5TpDfOaimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WBjB8bZYOCGghrjEGgG1+ffKlLbakrDH4JmtJ
 uINpIOcOEYbmIKwPoSgjPIderIqePvmM/HuQ6d9QYVcegAUdAD0+4NMHf+LqQAfngiOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYp4LSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzSvBky/JlawkEuDzYJ7iJaIfy/gzdZ9vfrWrCpe
 O84yvI+f4Dr085MFvF5icFkDOQrQrGo0WStWNwx0GT7fARDQhKdfZplMZXdADU5FEnu8w52K
 VX33iBv54SFh/Ymj/hjuK4Hi2DBiKP0AUfeMMo/gtiuLElGclshJ1a+FkQHIYLHSr85oxiGO
 5yDNvE7PITdV+BdXjWsmRm3dTpBx0Ib1y7a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/e
 zLPqlhibkLRM4LaqB2AvsHXKKMeyTwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvY5AMxItaou
 W0bLqZjx9GR6vDM7z/4HQQyGG9fIyUZ0Wf9uhOo55kp7b7WL3ndSWeVVFGqbrTn8ki
X-IronPort-AV: E=Sophos;i="5.93,206,1654574400"; 
   d="scan'208,217";a="76843499"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rd0zZyWMq8l9qagkUsT1tsgJvWIvZkNGCnyZS8lVbu5lBRgrA5qqNx047x3pgWpRfF2ZlgpK74bSwu7hxLc3O6EKrKI0uO9L+aK0rpjvWs+ZbJpfWzyOGycEuda8zkquF2/3m5CVQbHAsj+SkUpxzH5w4K58qvmmXqSDjvlXYvg10EU+DmR59TkOZxiq6cQBbKHrJFR+6jgG+um6X1tffqbYZJMlCOgd5ovMffHVjyNSAroHxnh4mLI9cp7zupQAzDE31t7KOA8XS5IinMVQW8YWichA5BVpAn8oNANQfFiey/TnbIFLoUhttVDXiJ5Ks6M9VQkFgiicpP9rOZQ2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7x2nODdOm3CdFS1GyvfWSeVLkNnVh/e1Z4IEHA2XwM=;
 b=iMiOgHl4FyVaHtE5lhmBpMfs1CCONBOWU2O7b508yDV08fCQhAuRwzNpbN6FyZLJIu/IBmjFtTS76KtxDg/ThPghLOwXrZ0UFXY4WLYDDfwY1rm0XliCNhuwn875O4AvJ1I3KLzb5INkRG2/o0ynzfTKACBd9RWCBW+RTrAKd51GcHifd7zmkN84NeuZZ+/bzCE+5J6ftG5AxcM0ylikG3X0oSIPrC5wYu1OYr93wG4h901kGtyEwa+2cJPMa+PzjIKkK1bfvjn8M9qiv3aIVWdU7R6H1CoRXm3QksDIA6P+cva36B5nkiQ9fC8r0rWwOfweYPNqeernZkoX0BLpLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7x2nODdOm3CdFS1GyvfWSeVLkNnVh/e1Z4IEHA2XwM=;
 b=MaF1is868em3n/576kGCR/cM8K/AmMGf9FLXHU6saTgQuhLpiOIWr10dCwVeRyUkNEh4v2KsOIPsKn5MJ6BI3r1ATfeEOvajBE/qgdy55wZqFq/3x2PqogbRXfxoFuDIdc0eAfGgIHbYaZCKYD8NH7EC6BkMPRKiBPe7z5TDkqo=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Thread-Topic: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Thread-Index: AQHYo3Q1a3lv2Ot+eEGJLOlfGwWRqa2Zt+6A
Date: Mon, 1 Aug 2022 08:19:30 +0000
Message-ID: <C18DD0FD-E858-4D77-84B6-268D86794FA7@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
In-Reply-To:
 <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51a32fca-35fb-4f20-9d5e-08da73968e98
x-ms-traffictypediagnostic: SA0PR03MB5465:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OIfBd16iqYCUCnRY8yJtgZeeTclXaHTjH9a+/0ujl+deNhtApTdh6LWkXrNoaT7xsMiicxujXL5vVHaZQRqCYoenWU+4wEIBKOkTxxmJ1VhBfnazjkLo0XIzJqXXjDKFu3lCDCJcAvxUhI6V90fjWsajo0HbNSeByzoxHsC9u/qMLCX5rorkr9+jUOcf8/D9rFqMvXlA2c/M7VoZcKmisqaYHHCJoPqSBBHMaP0a/TOfrxrQACQpe2d1e3WpUHT/H6Y+JdpGs11NLU/1CTPEPuLqvTYoBdVp9UM35Y+OihrfXW5cS2f58fR0akb51JiPqMUZ8yUhQh26iXmZkRc9qT7nb0pJuX6ed60pq3DF4CjcMzlhEZqv4XHSAFnD7G9piCaNNTmB5LyoYAR9OA9onCdGyu1jh0mumqUTwimlZ8tCmvtliDDumqQIicvt/ilQN9ewwY5RkYWy0UIh0Qwlj3AJb13sV0fFGbuxKGsXo1ne/InkTDvUyPNkI/7adGxPhnM0MXfswoXJjQ++5nrOgyn2ZEadvL7R6nfFfhHK/pAfvdRdmatUMU7k152mWKMa77ZM8FcwQThY4Z+3+YU9/4SYxzztT+J/aUbLzGNXBL66I+2Cmou1qFRrvdzoJylVLwDgFGqz3Q7aAh5eu0OyCbjemSFbRVYnq1Zyj7oKGn0cHGAI6qnSKZFX2Rcf6rWkF9wKPEaqqRZvQV1dW5/AwBUfx1dOw7QyoyGnwdjxv8yg0eJFrzcriyWxwbgMnLHgpYKuFq2t4MuSnF4+raMf4d6jKub8s4W/hcPHg6UMhzUDtBSU4V6HJhj/QnIiX4wXUivUehSwUTebkLTkyjxmYw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(82960400001)(66446008)(38070700005)(64756008)(66556008)(66476007)(76116006)(66946007)(478600001)(8676002)(4326008)(107886003)(2906002)(91956017)(558084003)(6486002)(41300700001)(6862004)(71200400001)(5660300002)(8936002)(33656002)(38100700002)(122000001)(86362001)(37006003)(6636002)(54906003)(44832011)(53546011)(6506007)(6512007)(26005)(186003)(36756003)(2616005)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnJQeXZVUitsQlU4VnJHeFUyTVZTVVRIVnpQcHMyNGpEdW1KMUQySWZWUlY3?=
 =?utf-8?B?UDloS0IrSElzK2M5M0NDaFl0NnJyM0RjVCtFYVpBblFSd0ZqblJsMmgzcjU4?=
 =?utf-8?B?ZTlxdCtVSndEQTRwK1BCc2hVcHhtcHUvVC9RTS9oeUFhOStqQWhXZE5FZDNF?=
 =?utf-8?B?Y09VR2NRekQwdWFsRHovZmtSRkNBdG10eDRHM1Y0eDF6aFFXTC9lRjlRRVo0?=
 =?utf-8?B?MlRidUlVdnUrNHdvT3h6Y09hQkdmWkozOVpqNWp0cW5iem9wZEZKQ1VrZGZz?=
 =?utf-8?B?eFJ5NjNsK0dYN29NNUNwZ1VBSmxrclVyS0pYaFRaZU1PYWtMUndqZDBHNnVX?=
 =?utf-8?B?RHRNYW44QlpnQktTa2dIUDNCeWppUjJTL05kRHoxNnphVXZEUlB1Q1NWQWk3?=
 =?utf-8?B?K2ZsU0FyeUZFRzh5Tm80WnBDUTFkVGJpcEwzTzNCbjNPSkVhQVViUDMrRitI?=
 =?utf-8?B?b2MxZVdOczVtMkxlMkNnakMxSGMrVWZxcUZjdE9sL013TkxuOUdDYXZvZVNm?=
 =?utf-8?B?Q1FRcmQ1eVM2ZWJjTDNRcGxFYjlJVFNsbC8zMFVXcisyZWl4MHhwWjNkTzZJ?=
 =?utf-8?B?dU5PL1kwaUl5MENqSllpQ1VkOWorb1dQYVhHcU4rMm1uSTR6c3RlaVNzbCtj?=
 =?utf-8?B?YlU3WFo4Y0RaN2ZkU0ZFVk1BVkUvNGNPNVhsTTh5NmNmejcrZWFnK2N6YkNl?=
 =?utf-8?B?WUFjVlpZVnVqLzcvWUdhOW5zUkdDNXh4cGZqaEtuc0lBVHpPTDZwRlN5a0Fv?=
 =?utf-8?B?SFI1cVAxRUJ1L255YmFVUXZyQTFKM3p6UkhCTGVHWU1PZWw1QWhGcExzWlZN?=
 =?utf-8?B?ZWUvYXljdGUvNjd6bEd6ZTN2ZzVvV0VvcW02ZS9EaGpuSzdhZGxVaTQ1eWRI?=
 =?utf-8?B?a013clh5MDZITEcvYThhTE5YUXFGbkRVOVkxTzIxelNNczFoSlpnZURGZzVE?=
 =?utf-8?B?VTU1ZkZJaFZuTFMxcUJLMjVMZDdMZkhvaEFpTTBtMU5MSkNrR1U3ejBpZFgy?=
 =?utf-8?B?NVJlbUtEMmREeVdRRjYxYUZOWUhia2cwRU1vZWFyQjhEaVY0aDF1Y2FCb1Rk?=
 =?utf-8?B?K2FFZnNFdFNPNkFGdUtOUWd5RFNrYzVUR3JhZ1Zva0grOUVzNEVUdFJLQjN3?=
 =?utf-8?B?UGpWa3orcGc2ODlpcGxqZGJJTVh3WGd2M3NpOWVIM0J5UWdoWEZyNEZZc3ho?=
 =?utf-8?B?emRuYWJSYVBRU0FOa1p5V0xZaUZhb0xMM3JBMVhueWlzZzZTOG9pbW1TOGFv?=
 =?utf-8?B?TFJoTXJhaDNVaVAxU25Vcm5COUl4UWtRMmFVaHBVMHZJbW1tc2tidm1GRk1J?=
 =?utf-8?B?by8ramxPOEl2ekhjYzdrQUovcExoU0xWQ2Q5SVdIbWlxVmN3cFdnVzF3Vk9s?=
 =?utf-8?B?TlEwOE90VTlkLzQrMnEvSndVcVlKQnJwaGlCWUh0RlNBb3B1TzZhdTRQcXFz?=
 =?utf-8?B?N2dheFF6TUxjWmdvWlNYZkxWK24waTNEQVVScnJxTVd5OTB5NGhlWHQ0dGlV?=
 =?utf-8?B?bGZkMHR0ZldkNHFhV0p1c2h4MTNqYjZMajQ3NExoRDFzb2R2eno2WWZKcjJZ?=
 =?utf-8?B?eEdFaUxzbCs5ZDlTdUpKSU1jKzdWK043WWZpWHBqOEdZZ3BVdUlwWFozRW5V?=
 =?utf-8?B?R3h0allXMjA1VzM1N25iZndic1FEUXh6M0laRTd5TVgwTnFvTm5GTWZkZmxK?=
 =?utf-8?B?R1N6djJXVHYyZW1JZVhzYUovTmhlTkpabnpacFBwa3pDV05kSmQ0QzVTMVNB?=
 =?utf-8?B?R3BRaU0vVExBUllFbUpnZDdnWHJtV1dwSmY0YVN2MTd1VWpUbENva0hSSk5n?=
 =?utf-8?B?NWZva1llR21GWFFIOUNkalBUU1lXcnRaelF4NWgzUWptSER1aUI4TzZMZnlu?=
 =?utf-8?B?blZaSG5JUWd4OXZHcWtoVkJvRHlTRVhpRzFyeC9jT2JxVUxMaHNXN0Q3Mlgy?=
 =?utf-8?B?MFdhYTdYeVBVTk1oUXcvYWJ1anNFaENtMUVid1ZRNFBTanB4YWZ5amFBL1pB?=
 =?utf-8?B?R2lHK0Z0dWlzcUZ1UVA1K1BDWDYzc3BkMXlqTnZkTGd1R0FhYTA2MU5OaEFG?=
 =?utf-8?B?bW8wMmN6Q1J5YmdycnN2aTVwRFlsMzZvNFRqYmF6ZndVdjQ0UHMrMG1RVnAv?=
 =?utf-8?B?N0czOC8wNExvazJUM2w2bVM4RktSbitrU3dXQkY5N01jaGx6YzZNV202ME5h?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_C18DD0FDE8584D7784B6268D86794FA7citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a32fca-35fb-4f20-9d5e-08da73968e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 08:19:30.0689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VmcBoHxEtJxFf4Sx2n4aHUa/xIfUCY2ZIrWQfpF1pQNtAxxQX/zZRZVuNnWGIypnD7VWp4ipRjrkWoqz1LWntJeo6ycdsUA92A1iQiom/zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5465

--_000_C18DD0FDE8584D7784B6268D86794FA7citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDI5IEp1bCAyMDIyLCBhdCAxODo1MywgRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbTxtYWlsdG86ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4+IHdyb3RlOg0KDQpUcnlp
bmcgdG8gaW5jbHVkZSAub2NhbWxkZXAubWFrZSB3aWxsIGNhdXNlIGl0IHRvIGJlIGdlbmVyYXRl
ZCBpZiBpdA0KZG9lc24ndCBleGlzdC4NCldlIGRvIG5vdCB3YW50IHRoaXMgZHVyaW5nIG1ha2Ug
Y2xlYW46IHdlIHdvdWxkIHJlbW92ZSBpdCBhbnl3YXkuDQoNClNwZWVkcyB1cCBtYWtlIGNsZWFu
Lg0KDQpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXgu
Y29tPG1haWx0bzpjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+Pg0KDQo=

--_000_C18DD0FDE8584D7784B6268D86794FA7citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <56E3B5BD677C5B46A954F3D04C18DF0E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDI5IEp1bCAyMDIyLCBhdCAxODo1MywgRWR3aW4gVMO2csO2ayAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmVkdmluLnRvcm9rQGNpdHJpeC5jb20iIGNsYXNzPSIiPmVkdmluLnRvcm9rQGNpdHJpeC5jb208
L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJjaGFuZ2UtbmV3bGlu
ZSI+DQo8ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDAp
OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5v
cm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVy
LXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRl
eHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBw
eDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7
IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPlRyeWlu
Zw0KIHRvIGluY2x1ZGUgLm9jYW1sZGVwLm1ha2Ugd2lsbCBjYXVzZSBpdCB0byBiZSBnZW5lcmF0
ZWQgaWYgaXQ8L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250
LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsg
Zm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNp
bmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJh
bnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdl
YmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFz
cz0iIj4NCjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWls
eTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12
YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5v
cm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3Jt
OiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10
ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25l
OyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPmRvZXNuJ3QNCiBleGlzdC48
L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTog
SGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJp
YW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1h
bDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBu
b25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0
LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxz
cGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0
aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNh
cHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4
dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3
aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9r
ZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5
OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPldlDQogZG8gbm90IHdhbnQgdGhpcyBkdXJp
bmcgbWFrZSBjbGVhbjogd2Ugd291bGQgcmVtb3ZlIGl0IGFueXdheS48L3NwYW4+PGJyIHN0eWxl
PSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250
LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1h
bDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjog
c3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFj
ZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDog
MHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxiciBzdHlsZT0iY2FyZXQt
Y29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAx
MnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQt
d2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0
ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1h
bDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4
dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0iY2FyZXQtY29sb3I6
IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBm
b250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0
OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWlu
ZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29y
ZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNv
cmF0aW9uOiBub25lOyBmbG9hdDogbm9uZTsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IiBj
bGFzcz0iIj5TcGVlZHMNCiB1cCBtYWtlIGNsZWFuLjwvc3Bhbj48L2Rpdj4NCjwvYmxvY2txdW90
ZT4NCjwvZGl2Pg0KPGJyIGNsYXNzPSIiPg0KPGRpdiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+
QWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgJmx0OzxhIGhyZWY9Im1haWx0bzpjaHJpc3RpYW4u
bGluZGlnQGNpdHJpeC5jb20iIGNsYXNzPSIiPmNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbTwv
YT4mZ3Q7PC9kaXY+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9kaXY+
DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_C18DD0FDE8584D7784B6268D86794FA7citrixcom_--

