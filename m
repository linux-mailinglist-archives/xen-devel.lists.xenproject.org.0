Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4714B4909
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271368.465776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYUj-00063A-Si; Mon, 14 Feb 2022 10:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271368.465776; Mon, 14 Feb 2022 10:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYUj-0005zo-P6; Mon, 14 Feb 2022 10:22:09 +0000
Received: by outflank-mailman (input) for mailman id 271368;
 Mon, 14 Feb 2022 10:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJYUi-0005zi-CB
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:22:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f437d6b0-8d7f-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 11:22:05 +0100 (CET)
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
X-Inumbo-ID: f437d6b0-8d7f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644834125;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XjycwK1Z6bMv6+kfGGbscoOQqpz9whOwOdZSkYJQb8k=;
  b=ZMNacLiJBrZlFYuif2en8UQBRpcoO6L7t1gr6Vno+SqiIsOxDZk6E4OY
   1BYo1gX/Ua47gIQ1sRpQio6LMO38Ls22uXQyI00YFG/mMziM97PM456gK
   VCQq5fJPkL5mhtBTuIO3cQbq65zPUGRF0h9CCAsWSfzqStmkZKNyN2oNV
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ttEhlEvUaJhqZbkejddNakCGHHByZfkvBxlOvSRWv4RdF3mS/rCg5S0h8kAEQb2B9x+91+NGtW
 u9D2AUoNk2n6RfWd+2e3np6/+H+TusKdblCw/A0Yl8VjiurzLwbH3mQ8cC4f7JqbPU6uqueBnE
 /kW8YpleLjGX2yfkUIUmhRYLtfoxcRBfQyP6GhqnIFe6pNF1nKGADTscMQQOL11Wsvz8iNA3Lu
 f62pa4U41DoWS+K/CqmcNBL/TfvuywcNMKgQEZ6LnbZctUZI/8Ixp7q7UD6/zyqhpgjcVgJcgW
 tRdV2xgfESaiurRv13yxou41
X-SBRS: 5.1
X-MesageID: 64040987
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xSyB26OH4T3dj6nvrR1kkMFynXyQoLVcMsEvi/4bfWQNrUokhTIPy
 msYCmuDOv+LY2f8eYtwaIu18UwEvpbUmoI2QQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxeDou9s+
 s8Rjq6tGFkQM42WwuEPDBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmto2pgfTam2i
 8wxWDNIMgz9cRF1JnQ5V4sCgfj0pHTQbGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3Eru3FkD7/WYkSPKal7fMsi1qWrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4AQ/nGUU+vnAyaKvS/ahxM8AYBVAbI1vVTlJrXv3y6VAW0NTzhkYdMgtdMrSTFC6
 mJlj+8FFhQ07uTLFCv1GqO86GrrZHNLdTNqiTosEFNdi+QPtr3fmf4mojxLNKeuxuP4Fjjrq
 9xhhHhv3u5D5SLnOkjSwLwmv95OjsWTJuLWzl+ONo5A0u+eTNT7D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3u6raYG2B3AY2RMNJG9GRF5mLJ9443d2DDB0xbpZslcHBP
 Cc/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKDgWfqu8Uza6WbAoLFXv1Hg3PSa4hjmx+GBxwfBXE
 crKKq6EUCdFYZmLORLrHo/xJ5dwnXtgrY4SLLimpymaPU22OiLLF+dfbQfmgyJQxPrsnTg5O
 u13bqOi4x5eTPf/cm/Q94sSJkoNNn81Gdb9rMk/SwJJClMO9LgJB6CDzLU/VZZimqgJxO7E8
 mvkAh1TyUblhG2BIgKPMygxZLTqVJd5jHQ6IS1zYgr4hyl9Od6ivPUFap86Xbg77+g/n/R6e
 OYIJpebCfNVRzWZpzlENcvhrJZvfQiAjB6VO3b3eyA2epNtHlSb+tLtcgb12jMJCy676Zk3r
 7G6j1uJSpsfXQVySs3Rbav3nV+2uHEcnsN0XlfJfYYPKBm9rtAyJnWo3PEtIswKJRHS/Reg1
 l6bUUUCuO3Ag44p692V16qKmJikTrllFU1AEmiFsbvvbXvG/nCuyJNrWfqTeWyPT3v9/aiva
 LkHz/z4N/Fbzl9Gv5AlTuRuxKM6odDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/fqMNHPbipOd/+FA9DLQUoWe2PyPUIl2SA9v8yOkj7uHd68bfvvZ++5PVQZPix9IdIDb4=
IronPort-HdrOrdr: A9a23:+7iV9aAI+D14nDHlHegKsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+UossHFJo6HlBEEZKUmstKKdkrNhQotKOzOW+FdATbsSo7cKpgeAJ8SQzJ8k6U
 4NSdkdNDS0NykGsS+Y2nj6Lz9D+qj9zEnAv463pB0BLXAIV0gj1XYCNu/yKDwqeOAsP+tfKH
 Po3Ls/m9PWQwVwUi3UPAhhY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 r4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKvi/VXEO0aWSAWQR4Z
 /xSiQbTp1OArTqDzmISC7Wqk7dOfAVmiTfIBGj8CHeSIfCNUwH4oJ69PNkm13imhYdVZhHod
 F2NyjyjesmMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1TwKp5KuZKIMvB0vFsLA
 CuNrCq2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZOyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR42Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFQgFCvsurqSRloeMMYYDABfzPmzGyfHQ0cn3KverL8
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64040987"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdmnsArA5TvH5MivsPtoh0GNjRa/2ECRzogpbi0EHFmOeZeF+cWSIRTHU0SygwKjVKveLdVSOhk3lk1j05rZNGbj6KHvjdWyZ0SCbdFs9+voGCmLrtmObXByWnm2BT7kjBat0t4bTOdOH61AF2p2urkdWGyGWWICcCGYRculHO3+mVoiUU63Lh2J8jItPEpb9DgnpQ3e+RPWt7Q8F1ZwjYJOREn8k/zLUtj41FaXdUX39R7g+wJm5mzyVjTfjNSQwO7GZmURQZ0OpwWnWe9U946iUJVqRmDXC9nZaR8Xb/SVSimRpCYC3RW6SwRwJ0bNhvUxhC4yULrcgSR+V61E2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjycwK1Z6bMv6+kfGGbscoOQqpz9whOwOdZSkYJQb8k=;
 b=D+SoBdOV9KN64U/bl8nEEZHB28OGH36ztZBXvYTFkkyR/ry80zdYcQsw2bjv5Cq8wVf6NIQtB/DUxeHzttRQBvQIQIx+8QyU/4zADnLAl8eLVUplsik4xJTZL76prGIngxmoSx7DfvPCWtEpFCBZgihNe8HuK9J3KPWmTDNfyt/IwTfd+gMcUu1Z3l8S+8xX8u+qput7Gh8HH117bhN9dI2IfyI460ouk5zig2H34F3cyNnj1+DMSrFA8lRpMfO5SBr9ixFpBVn3ApDfIAyPFF2lJ6UsrEXwEOt95W4fdrLuaYBxrP4xQ/IXIPpCR0DL/U9xZvak6Nx45PTdcM1FGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjycwK1Z6bMv6+kfGGbscoOQqpz9whOwOdZSkYJQb8k=;
 b=hes9JJWidZOS9XIuHdkKFRpP3HDgjWFitqQWQUHnXAoNfnqm5/LKMK8lMBzUYjbia9Z+uBTjROGcpTrV4K5RxbmChGNbF9f4Nhp7fR65p37VV9P3Qx5XGeVNQj2Pmi0D/dNW0bNyzGYGO9MhFKEX4VxcIpZfGQpHVvaumHRgOwc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony Perard
	<anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: tools backports
Thread-Topic: tools backports
Thread-Index: AQHYIYxOf3hnmEAHzECVq7GqiCZgPKyS1kwA
Date: Mon, 14 Feb 2022 10:21:59 +0000
Message-ID: <6f3157af-6ab7-ae67-0080-48754d41c19f@citrix.com>
References: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
In-Reply-To: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7495f29c-2920-4220-83eb-08d9efa3d5d3
x-ms-traffictypediagnostic: CY4PR03MB3158:EE_
x-microsoft-antispam-prvs: <CY4PR03MB3158A54C087C87F02AADECF0BA339@CY4PR03MB3158.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tdu9dEo/WfcKbDYTqWgpA+lbkuphCX6jelsE5EwtQXsR4iikDmMDU/Saw/B3E1C/5uvrx4hedWD/MBjoja/KyKlhN98gVE5tmgvY2s7T/j/EV+rpf8cxPHIFJu/aIUUcm/ra1Y67dCJuGcw7NPdlrjdmilAiYjKohe+QLD/pr0g5MevIZkz0eLwhTzfAsqwL7lUmEz18ep0HPSFt5OI9vO0sT9lTVQvJzJQ2q6EhavasKWKxl/0tfhnyznvuQvqmgEuCBU5HbgsB8qYtq+2c4DsFsR6bvc6HdG768yoTMBus/PZiFGzXJFdWtB25ojd3vpBx5sFe4a/zxhpeF5JKyN5Vfc3hYFCspwY+xFBH+EIgJoQxluiItNgUMrIT676VYWEkDleZ2RJZTnrD0icQqDh4u7qmkTzDBWO+zQM1dBDiWEq+UWMeaNw+ICl8tmpz7C9rFc+fLD0pEvAAdH4oXKuzHwCal5v5AOuLleAaCGzMIg8tFHk+QTB0s3VQmf1DhXu1B6jo2FlDLatwbZu7HAYsCQD4hhLdLDeg7AgrymlZKQGNVfLSroZskzItQ4/62MUb+Dg+aOwfxQbKhH/Bd0IPn/nc1DLUA6LVUdIIXs39UUZ9LCwAeLg7K3p9OFBGru6KVX/wPUYML78eMnyEfsczR0ckaC/DTf0CId3/LnXay+iho6Dz/RKEJgSBTYNayfuiIkkTzkStqtuLkhgfa9xfYUdpPnxxQvlk80YjALgHoNVAtDSEmAtN1/SXoklMFqqILbKrSqvnsdZLpfD0jQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(53546011)(26005)(6506007)(7116003)(4326008)(38100700002)(5660300002)(36756003)(186003)(6512007)(31696002)(86362001)(8676002)(2906002)(82960400001)(38070700005)(8936002)(4744005)(6486002)(3480700007)(31686004)(508600001)(316002)(2616005)(91956017)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(71200400001)(110136005)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjNzTzI0bUxTMmZER1lLSkJpOFFqZ2NxNzNPU044NFZlOTZIYi83bUZTMlU0?=
 =?utf-8?B?SmVCdE1TQUZtYmtlTVRjdmhXajI0N3FlYjBqVGYxT1ZkSmFza2lnTEpkUngy?=
 =?utf-8?B?VU5JN0FIQ0t6aGtoQVZMRlhTQmhMQ3IwSk5nK3VQQ1ZVZTY0TVJxdXA4N0t4?=
 =?utf-8?B?NVVabEdPQjBsL3gycGYvZTljQnlodWVYLzZhRXFmTG9OcURKRnNqSXVPNktx?=
 =?utf-8?B?YTZsa09xeWZucWZML0V3T2UvYXUvcjVWNUxFSzdtL0tYbXF6T1RuSWlXeTRk?=
 =?utf-8?B?WUg4Z2U4WUN1OENNamQ2LzY3ZnIzUjR0S2toeXlMRTBGUXJHS1o2dHl2QXNZ?=
 =?utf-8?B?Q1FSbU9Yc3JlZFZlcXFOTXA1dEUvM3RCUFhad2hEN1oyR1BqWVJucVd5eWww?=
 =?utf-8?B?T3JtZ3VjZjFMRSt4VFRySzdKbWhjS1hyY2xFaVZxWkMvNmw1OHpPbk9Kc2VP?=
 =?utf-8?B?aStVZlRGOXBNVDAweHFZVWFTaUJkUlhwZjJKdUF0SjFNLzIyZHNwRVFpSlZv?=
 =?utf-8?B?My9NS2hNL1dXUDdZSHZ1bGJQODJ3eXZzcXhJUTQrbStLenB3SDZnMngvcDNt?=
 =?utf-8?B?K3RGcHhuZUcyaTBNVmxMSFhGRTRNV3pveU04am5ZeTdvU3FtTHFVb1Z3cGlz?=
 =?utf-8?B?dWdlc2lOdlY0ZG50eXlKOCtHa2MwS2FFTitJdkVUUy81VThRV1diTkZwbEhm?=
 =?utf-8?B?bUppSHdUTGp1OHhsNmdCTGZyRUlZcXNQWFNXMG5DaFRyRUJrT3ZUNSs5RlE3?=
 =?utf-8?B?OUQwNE14dEk2R0IxWktUaW00cnVSRURQcXlGN3E0YkFxVGZNa2ZXbHFIVXJK?=
 =?utf-8?B?b3E5UmJlNU5ucHh3c2cyZmxOS01XektvS2dyeXlCcGRCZGJTb0JLeXUzcUp3?=
 =?utf-8?B?YVYrNUtmeUE5bGk4WXlGZHpSVk9EbEFZWTdabGJDK3ZoaUdYNkR4LzhBZUpF?=
 =?utf-8?B?K1ZJWmVoRGF4M0VkOW5FVHJHalpVdHlGVER3eWFqam9sVjZUY3ZxRUZMbE9G?=
 =?utf-8?B?QzdwWk0zSGgxdysvMmEzTUdwMWp2RjdIaUdNcEtrSm5DV0tma3U5RS9LN1Bp?=
 =?utf-8?B?eVZObDNGcEw5R1dzL0tmRmNwRDhYa0xRd1g2TEtqbTF0anpTMnA2YVlmbndS?=
 =?utf-8?B?cjZRemw3T2wrYm5RVDBVdE1kc3h6NWV5YXA5dDcvclBDbkkxVGwrVWZxbmdk?=
 =?utf-8?B?SmIvVTdJeFBrVDd4OWEzU0l6UVFwc1Q2azFVWk00aW1FeVJYL3FpR25Hdk9w?=
 =?utf-8?B?NGh2Q2lBT1Q0MTdpbUxrTG4vaU1STXNsMlVwemVCS054emQ2Mmkxb2IxaGlB?=
 =?utf-8?B?YWQ4OW1BZmEwWVZmRGgwdk9BODREbVFWamdPMHl1SkwvZmFBQWMzcC9qbm02?=
 =?utf-8?B?dHRaT3grYnFNWG5OTW9NRWFOSm16NVV6b3V5Zm5qVjYxclV0RUtFTlZxTll4?=
 =?utf-8?B?d09kNDlicjUwb3I4bkhaRGdiTE1ZazU3aS9xZXJvUmRGazZzQWxMMTRHcFg4?=
 =?utf-8?B?RTBrY2NURDEzQ1F1aDh5czB3a242TWszdDByMG81aUtoa2tmTXplUjN6clZW?=
 =?utf-8?B?UklJSW0vZ2tyR0gwcGVZWG9DN3ZzRHdObmpZampDakpmbTNERWZKSEtUMXFo?=
 =?utf-8?B?cWJidTc5L0ZranRNdG5mTTg0TGdqU2NIbHduOXdPWmpOSlBaV2ZlbldRMUx0?=
 =?utf-8?B?UjNNRDBvc3VsVW8ySGwyZTA1NTJWczJhT1YrcUJSdy81enFTcUtFRnlZUGUx?=
 =?utf-8?B?Z2JqcDB0dUdZSnFaRGFsb2JjSXNSZDZxSnV2ZWV6aU5YL1BQcW9OZU5EZCta?=
 =?utf-8?B?b1l6YS8wWEhVTGVJRGFGck41cG5DV003SXZFRHAvaHJyek5BWU4zeldPNE9h?=
 =?utf-8?B?NGxTZHZnYUROU0x6ZVhnWTExUVVjOS8xNzVaeWE1VW5SQzl6YlgrWUlVM0ZL?=
 =?utf-8?B?LzlmU0tKaHhiQU9pWUozM082UFVhQk1kY0E1dm5GL3ZBdytneUFubTlUMVFq?=
 =?utf-8?B?MmJzUUk2b0E4Z3AwUzZOMldqK3JWK0t2Z0pFU3lyby9XWlpwWXlacldCbzB5?=
 =?utf-8?B?S1lYZDZOVEVYVG8rTTQ2WFRJb0VlYjBLcC8vNDZCazZDSWlLUG5rdzJ2YUNV?=
 =?utf-8?B?dlZzQ08zUUhNemdHUlhMbGZPK0VvMWxzeEo1S21KUjlPRU1oWEtDV01DYWth?=
 =?utf-8?B?Ym1YdE5LZEozVVRRdXNNTXZvVHZXQ0wyL2NxTDQxTjhCUFYvTmhPbmtYT0ho?=
 =?utf-8?B?YmNxUDhmUll4QTFhTXBlZ1RaL3dRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7AB11E4406FBA4EAB1BD6579BA56043@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7495f29c-2920-4220-83eb-08d9efa3d5d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 10:21:59.4971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+AJP085rIlIOQ0ZIP1WrveGNUvHucJnKUByyvPKQpXUZYk41OYpTJtM4nuNwZra71w8yUr4Vj4KLjEwNa8MCptvcpZ3A/a8eiJ9K1q3FHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3158
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFudGhvbnksDQo+DQo+
IEkgaGF2ZSBhIGNvdXBsZSBvZiBzaW1wbGUgdG9vbCBzdGFjayBiYWNrcG9ydHMgcXVldWVkLCB3
aGljaCAtIHdpdGggeW91cg0KPiBhZ3JlZW1lbnQgLSBJIHdvdWxkIHdhbnQgdG8gcHV0IG9udG8g
dGhlIHN0YWJsZSB0cmVlIHdoZW5ldmVyIEkgZ2V0DQo+IGFyb3VuZCB0byBhcHBseWluZyB0aGUg
bmV4dCBiYXRjaCBvZiBiYWNrcG9ydHM6DQo+DQo+IGQ5ZDM0OTZlODE3YSB0b29scy9saWJzL2xp
Z2h0OiBkb24ndCB0b3VjaCBucl92Y3B1c19vdXQgaWYgbGlzdGluZyB2Y3B1cyBhbmQgcmV0dXJu
aW5nIE5VTEwNCj4gZTYyY2MyOWY5YjZjIHRvb2xzL2xpYnM6IEZpeCBidWlsZCBkZXBlbmRlbmNp
ZXMNCj4NCj4gRm9yIDQuMTUgYWRkaXRpb25hbGx5DQo+DQo+IGRkNmMwNjJhN2E0YSB0b29scy9s
aWJ4bDogQ29ycmVjdGx5IGFsaWduIHRoZSBBQ1BJIHRhYmxlcw0KDQpjNzZjZmFkYTFjZmFkMCAi
dG9vbHMvbGliYWNwaTogVXNlIDY0LWJ5dGUgYWxpZ25tZW50IGZvciBGQUNTIiB0b28sDQp3aGlj
aCB3YXMgdGhlIHVuZGVybHlpbmcgYnVnLg0KDQp+QW5kcmV3DQo=

