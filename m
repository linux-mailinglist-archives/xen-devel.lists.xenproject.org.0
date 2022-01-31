Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2E4A43AB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262993.455510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUmm-0001EV-0w; Mon, 31 Jan 2022 11:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262993.455510; Mon, 31 Jan 2022 11:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUml-0001C2-T6; Mon, 31 Jan 2022 11:23:51 +0000
Received: by outflank-mailman (input) for mailman id 262993;
 Mon, 31 Jan 2022 11:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KqZ=SP=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEUmj-0000cr-R9
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:23:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41463c2e-8288-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:23:48 +0100 (CET)
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
X-Inumbo-ID: 41463c2e-8288-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643628228;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=s2MjfjFAWyDKo5ssvjfuCw5fpGKNmOaql4YUezCmQgQ=;
  b=VmMIOAjJgd/jSNw2F23/AhBWCqT2dFDO7SeoCSQWuQxzfUa5LC9v14K+
   W0QpYjZZ7egtlN7bKzcbkLCDilg+BhJxkJY2CLUy3ncZKnXvsbcSWmPkD
   oxLmH8rbhTXdt9bbb3Ym65E0YV5+2tloZ1xYS3Pn3zZtak80l7UUf/DE/
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EIICFMSgJkg/tIyEZWgWh2Y7lNZum3DWrWBcfZg5vZO4VhN7kuKOWmMDnLDxWseDrOZgN8b+mb
 w+te4ybaru05W4ckqUUS7yTAjw4wjEduSxMUZpJp0vFeYnxGkCxiS3NDiA7eMKCNKpc/7SoCdA
 3SWBFIjAI5EhYo62dU30h1yvoSMILUL/+rahLaQJdsO2cia41UdbOkGCSGA+NztKV4dQo+793t
 Nhld9rnyXYzsHXRscDgG6GkM6CR71psdNaXI1S8Qt3ag4XvCcOvfKuBFTB88QSvk60OPFMQQQL
 1pWmcS7VRAxJ5e9MtwjsiN0i
X-SBRS: 5.2
X-MesageID: 63109655
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:k6W0l6LVM1K9oEwPFE+RPJIlxSXFcZb7ZxGr2PjKsXjdYENS3zYPm
 2ZKUGCAOKvbY2fwL9ElPYmzo05QvMKEyINnTVBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us4wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB23vI9A5
 YsVs6azFwx2EqnpqcIzdUNxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glr35gfQ6uDD
 yYfQSRoSzLaOSwIAAkoNo4Yxtysg3LFIwQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfQmQvrVYRUE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsgD1DavcOS+sA61+GlYbQxje/KE5eZ2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPuZJhKTysDA3CMqsyq7DFDFtW
 1Bfw6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wLvWEhfBc3Y5pVEdMMX
 KM1kVkLjHO0FCDyBZKbnqrrU5h6pUQePYmNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm35irUuOG8GT50n3gNK2OS/OIZ9YYQTmUwzMxP7eyOkj2
 4wBZ5LiJtQ2eLCWXxQ7BqZKcwhScyBnVM+nwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg5AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:kfXtD64G4bNtnW7hagPXwWyBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+863WBjB8bfYOCAghroEGgC1/qs/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpYdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwteOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 v4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv+/VXEO0aSSAWQR4Z
 7xSiQbToJOArTqDziISC7Wqk3dOfAVmiffIBGj8CDeSIfCNU0H4oJ69Pxkm13imhcdVZhHod
 J2NyjyjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1UwKp5KuZJIMvB0vFtLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZNyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR52Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFAgFCvsukaSRloeMNoYDABfzP2zGyfHQ0Mn3KverLs
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63109655"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnYaFlW+vSD5IVz+5oamv2LQAgz1sk8J3L8+ISkNh/HTe85JCpWmo9Y4fhurGwqzgZbSwQqX48/QYWWoSfwoXovQp++dUwTqtL/qYKGLLMt3mlx4TGmYGPHP6bHxXZZkOenuYC8u39yQJOe5ZFf9RHz8vYI7aYAmo7kFrgh9TxUsHIR6fu8KsD79RJY6i9czvHoNoNmAgx/zbMr9bny9nyma40P8t1lorK6P4hWJf9a3ovKcW6rZjrtdEVt58YYiO1QRPP39K4sQ/8OiAGO/5emLzjZHdffFAPdPAuuQ6iJaZDEzWyA/+9O+dNY1M1l5UEYmi7A1VNwv4Y8ZmrekhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2MjfjFAWyDKo5ssvjfuCw5fpGKNmOaql4YUezCmQgQ=;
 b=aKpV/0SS/Xl7nixM3itbkfcvyY6cGiVk42wbxcATWXIRn8dQ6COytbSQgjVs9EDxd2qzZHqnmpqjpWtM925amnrpdaI9rhqNsfU4CjCbdml89Tt6yAQ6ZIYYqVqu/RUwc7W8H9Eem/m/yR78ofWnIl6WAFHaNSczovEox88ROFAnpfma9IZGZR3pfGsdYT8HbjY9SZBY2VLJ+6fIyBiuT6ek4Xcdxy6I+P+YXkmtFQw0/z8lniiJfcwFYvEEXrZiuCc0Ui5IcOfG06DfuPIja9ZEe5+gltFSA2HplB9UoOW7lONkAL2ZGPY24/Od7F3O9EESnQWIdVK3q+1pKEj0Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2MjfjFAWyDKo5ssvjfuCw5fpGKNmOaql4YUezCmQgQ=;
 b=eNzfrhg72zpybfLEdee5TsxFqAF0QhtnkPb3S1A6Jk3Zj7MZYAR93qvOdFJEsdst2nrixWRe5aQAMvHpisgzj0YJ1FMSIcSUav7mhySjN06WbgJT0GQ9oAPD1hmSVvw4BR1JZPFhxw9OARlU4utIUQ8xTGY300FQnRlrdfxfeX0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/9] x86/spec-ctrl: Don't use
 spec_ctrl_{enter,exit}_idle() for S3
Thread-Topic: [PATCH v2 4/9] x86/spec-ctrl: Don't use
 spec_ctrl_{enter,exit}_idle() for S3
Thread-Index: AQHYFEslNylcZ92lUUmGXdMcKHF6zqx87mCAgAATCgA=
Date: Mon, 31 Jan 2022 11:23:42 +0000
Message-ID: <daf19c30-7602-a689-c39d-35e477d9874f@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-5-andrew.cooper3@citrix.com>
 <23ac2bed-9ab4-8b4b-2861-3362434dea61@suse.com>
In-Reply-To: <23ac2bed-9ab4-8b4b-2861-3362434dea61@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97d213f3-e4be-4671-3c0b-08d9e4ac2360
x-ms-traffictypediagnostic: BN9PR03MB6060:EE_
x-microsoft-antispam-prvs: <BN9PR03MB606065CF4ECCEC52D0AAB523BA259@BN9PR03MB6060.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WM4KHxjL83sqPvsp8/I2Th/cjxXtyD+hRyS1QVyZykpPqrSB8trMGdJn6ipnx5Vniv1ksqRucdMmOZKNhtZIywKIAIei6tDesL++0gg3b8eFMi0gpRwwMefQGtGuE8peSOv/ZICSJDH8+oxdXDh5rwXc48OLrbVWeG/15TSBIkAhnrvyGa2VbFOOSBwt8hCSqfQhF4QxHtAMrdrtcZhFXrbwdaabk/J7eW9ODZ82oKNgzZ8a1FUPaamvQzTRRYSmVcyOMcH5JZaVwYb+ldhd1xt8Du/0e4DSWQvS8m4XMcImkcXGH/IatSK8W7uaGf900idwH2NN4N+b291WEw2ZSlbBh+FLH8tYbRs2FtAkGdEMCaCXB5LiwtSrY1G+RxELBJbA0wGksca/yNu/LEo3MibwO3nX3PYmKaAq98CKC4KyW3BFuzQPCU9gQ/7L8iKG6Q7jsmZdQ2qi2JCZ1w0j0OQde1TsbYb+UoGz7ZudwzV3m6k9FMEfa/gXw6HXeS1Q3IvSKVDUzK58QB0HUzmsSqLUjP/cPeOnBVr8H8U0GKOmz/bTgf2hoXoO3uizigSDAOttzMbGHR5iHJwsfS66jQDt7cgr3qhJP1YKmqxj33NPY3gSHhI/YjiIuvAEIzfUbFqkeSPf+xaa05DPC2oNtcp7A13mYZ637XA35GOPz1yxvwJWwVkg+sHqfiVNGqp4Xc1UjYaFysuKza0sQ71rOWitoIfQ3KAW+bOgkewJR5NbtlfwzeETxJdWgo6U6CnkTaKvhcl10QwgZyf6hhQ19A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(66946007)(66556008)(64756008)(4326008)(186003)(66446008)(66476007)(76116006)(38070700005)(8936002)(8676002)(91956017)(6506007)(6512007)(36756003)(31686004)(53546011)(38100700002)(122000001)(316002)(2616005)(71200400001)(6916009)(31696002)(54906003)(86362001)(508600001)(82960400001)(5660300002)(6486002)(2906002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWVRVGdIblFvbWtDaHVHUWR0NXpidzlXMG1xOU5WQkkxYmxlODJDRGRXNWd4?=
 =?utf-8?B?U1o5UHNSc2RzdmlTVTJUUzFBaURrU1VjRVdNcktuRXVuVGMwdksyVmhEMFo1?=
 =?utf-8?B?M0J0R3F3UUFVOGVsZVdnNmtFVG44dk4zRkg3UEVEWHJtK1JmZFpQeXUyT24x?=
 =?utf-8?B?MFk5STVDUm15OEJlcUNJTXkxQTl1SkNhSFYwWm9pbGVCNjZXL3Uyc285OXV4?=
 =?utf-8?B?UGFKU2VNaWxyd3VOTlBUMDNFUWdzRXBWTkd3bWh6SEFLcGtnMVg5Z2lkYTNH?=
 =?utf-8?B?dlg2OVdUeE5MSEJMdVdjamdXNXg1N2c2NzU3c285T2IwWG9iZmxkc1F1YU8w?=
 =?utf-8?B?UU5ObXR0YWtSNXFCSUxNU25rc0F5ODdCeVJYbHRHcnliWHJqV1ovdmdlTS81?=
 =?utf-8?B?aFBuUEtYNlhqNG1wd3l3a3h6ZFI3ZW13Yk1Yb0ZBQ0syc3lsZXRETndYbGJX?=
 =?utf-8?B?cXRxS3hVL3pKZWJINEJsNzkxUkgyUDNPMGZvbE90T1hNOEFlTHpKaWZIdHpP?=
 =?utf-8?B?Mlp5VHZiREluQ2FiNTA5N0VQcjZjSERGc3pSZC9ScU5uNDNsY2RhYVlOTmtw?=
 =?utf-8?B?bS9CU1h0YlJBUGpwQ2JjeGYwRG9naGowNTdvdFN2T0pBUjRUcDdodnBBN01B?=
 =?utf-8?B?eloyam5Jend5Q3Q2YWkwaTAwSnhKQ0RjbVQ4d1FnZlFQSmNFVGc5b0IyelFO?=
 =?utf-8?B?ZTh2Z01oNElwcDF0YjNnMTl0SzFFRkZVOGk1Q2ZqeExxTEFkbmZGeHRwT1Ur?=
 =?utf-8?B?TVZybUI4dS9mM1FQUlVWbnAzY2tJTmdGTHFUT0J5T1NFWUtmdWRCSDlucmxB?=
 =?utf-8?B?ZFY5TUN1VkJCTm1LOUNZdTBGYUJnZm5YMFIrZDJZcmFtaUJsMEN5RzI0Z2Np?=
 =?utf-8?B?ajVoUjkxUjRGakpPSVJoUVpRTUtQSlVXelRWV2h1cXYzZzZoSWdwcEpyY1pC?=
 =?utf-8?B?ZmNOeU5ZNVZlVmtUWVlkS3dSbDBqUXBuTkFPNjYyZmdTdWpZMTFoNlo2bENB?=
 =?utf-8?B?dWtHeWsyRXRxeC93citaZHpBeG5lNFplbUQ4Zlkxb3N6c25PaDRra0k5MkFL?=
 =?utf-8?B?aUdWNnZIeHl0NWpzVm54Z0lSQkJidTFoVGNQa1pKOGg0eTJLWitENVUrUWh6?=
 =?utf-8?B?ZERRaTJyNWg0SUEzMVdqM1dpTERNcmo3NDU0THk2eERWNVZxeUtWekJkKzVa?=
 =?utf-8?B?OHdBajZodnk1ZjM0K0Z4OVZXdlZMcFRnSlZ3Tk8rYS8rREZLVG9sUENKTENo?=
 =?utf-8?B?K2dvNVdJSnV6dHpjdEpSczRHZmZEUmFIWTRVTXRZRmxIRTJ0NXplcHg1YlhB?=
 =?utf-8?B?d0NDcDlLVXNjOXl4V1pOVlE3UUtjaGJMVW16QjVhS2QyS1p2RXBHQVY5TmR0?=
 =?utf-8?B?TXdTRlVkUTdDMWtvaEdFVlJCVWpFcGZVNGZBdFdRYk9hd1hUdExMMXFJdURv?=
 =?utf-8?B?OFppQXBGV3gyZ3ZsUXpzWTBwQnYwSXQwUG1wZUV2Y2I5WTZ1T3BVWUZQWmY0?=
 =?utf-8?B?Mk9OTzNhTGNkcDBSVi85aEZNbVBlVVYxYWNIb3pIc21FY2IzRzdRMG5jdTg0?=
 =?utf-8?B?RHVoOWpmeTJCdmgxbkkrNU4wR00xWXBrcXBXaGJwUDFyNkxXN3IrUDFrMjM2?=
 =?utf-8?B?cFJvRjkwY3VLUEtoTVJOUDZ6RXRnakhqb3VhbHUrL0traGxZVmgrWDc0NTdM?=
 =?utf-8?B?dFRYUlM3d0V5UkFRUjMraG0zMDczY1NsY2ZpZEllQ2piaHhoWW5vS2MxU0I0?=
 =?utf-8?B?SitUNkZHK3hLOE80UHFoSG1XSUJLRUU1c043Rzc3MUluNEJVbG5lcG1hSWIr?=
 =?utf-8?B?QnF5S2xnWkFzN3RDVTVabmhzNjJydlVQM2lVU3M3aDl4V0FvSUl6YklrdktD?=
 =?utf-8?B?S2E4VEpHd04xek5rQWVMWXVNQzhtUWFVNzUyOWV1RlRWVGZ6Si9oN1E4Tnh5?=
 =?utf-8?B?SHViMnlYZ05WR2dGalg5eHRsbVZaUG1nKzgwUFRkb1pKVUZBdnBNQUlJNEJj?=
 =?utf-8?B?dWZzTk8vbzV5aWVRVjcxajFjKzgrd2lkcXplNXNTUm1NQ0lSTW1TaDdwbzdG?=
 =?utf-8?B?OWszaHIzcEFIWVlhWG5YbzlHa2wrbDJtcXg2aDJtNHVieVpHdkhmZCtCRXFz?=
 =?utf-8?B?alJabU5GRkN0bzl3Ukg0YzhIQjlLM0UxdHd6bzNKeXVmMnRlYUE0WVVvNVA1?=
 =?utf-8?B?TGRXMWNCZnlIdGk4RkVYMmp0RU9Yakk2VzRDZ0JiQnl3Z0RhMDMwK1UvcVF4?=
 =?utf-8?B?YXZpQVd5WjZLcTREeFZKQjhwWFB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBF8EE6E8F9AA248A501F842AA830CC2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d213f3-e4be-4671-3c0b-08d9e4ac2360
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 11:23:42.7871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbPG8UyFRuq4TVcgu1GQdgzBk0Aw0ah7OnTrO38HxyNHGBYnusmU7daKiCpJZsWWsER8aFRcZFf1U4ZVHUAxRgkvUC5pYWCbPi70mBcvJdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6060
X-OriginatorOrg: citrix.com

T24gMzEvMDEvMjAyMiAxMDoxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjAxLjIwMjIg
MTQ6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAnaWRsZScgaGVyZSByZWZlcnMgdG8gaGx0
L213YWl0LiAgVGhlIFMzIHBhdGggaXNuJ3QgYW4gaWRsZSBwYXRoIC0gaXQgaXMgYQ0KPj4gcGxh
dGZvcm0gcmVzZXQuDQo+Pg0KPj4gQ29uZGl0aW9uYWxseSBjbGVhcmluZyBJQlJTIGFuZCBmbHVz
aGluZyB0aGUgc3RvcmUgYnVmZmVycyBvbiB0aGUgd2F5IGRvd24gaXMNCj4+IGEgd2FzdGUgb2Yg
dGltZS4NCj4gSSBjYW4gYnV5IHRoaXMgZm9yIHRoZSBmbHVzaGluZyBhc3BlY3Q7IEknbSBsZXNz
IGNlcnRhaW4gYWJvdXQgdGhlIGNsZWFyaW5nDQo+IG9mIElCUlM6IFdoZXRoZXIgdGhlIGFjdCBv
ZiBjbGVhcmluZyBpcyBzbG93ZXIgdGhhbiB0aGUgcGVyZm9ybWFuY2UgcHJpY2UNCj4gb2YgcnVu
bmluZyB3aXRoIGl0IGVuYWJsZWQgaXMgdW5rbm93biwgSSBzdXBwb3NlPw0KDQpUaGVyZSBhcmUg
YSBoYW5kZnVsIG9mIGluc3RydWN0aW9ucyBmcm9tIG5vdyB1bnRpbCB0aGUgY29yZSBpcyBwb3dl
cmVkDQpkb3duLsKgIFRoZSBjb3N0IG9mIHRoZSBXUk1TUiBpcyBnb2luZyB0byBkb21pbmF0ZSBl
dmVyeXRoaW5nIGVsc2UsIGJ1dA0Kd2UncmUgc3RpbGwgb25seSB0YWxraW5nIG1pY3Jvc2Vjb25k
cy4NCg0KQnV0IGhvbmVzdGx5LCB0aGUgcGVyZiBhc3BlY3QgaXNuJ3QgcmVsZXZhbnQuwqAgSXQn
cyB3cm9uZyB0byB1c2UgdGhlDQplbnRlci9leGl0IGlkbGUgaGVscGVycyBoZXJlLg0KDQo+PiBG
dXJ0aGVybW9yZSwgd2Ugd2FudCB0byBsb2FkIGRlZmF1bHRfeGVuX21jdV9vcHRfY3RybCB1bmls
YXRlcmFsbHkgb24gdGhlIHdheQ0KPj4gYmFjayB1cC4gIEN1cnJlbnRseSBpdCBoYXBwZW5zIGFz
IGEgc2lkZSBlZmZlY3Qgb2YgWDg2X0ZFQVRVUkVfU0NfTVNSX0lETEUgb3INCj4+IHRoZSBuZXh0
IHJldHVybi10by1ndWVzdCwgYnV0IHRoYXQncyBmcmFnaWxlIGJlaGF2aW91ci4NCj4gSSdsbCBh
c3N1bWUgZnJvbSB5b3VyIHJlcGx5IHRoYXQgeW91J3ZlIGFkanVzdGVkIHRoZSBkZXNjcmlwdGlv
biBhcyB3ZWxsLg0KDQpJIGhhdmUsIHllcy4NCg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gUHJlZmVyYWJseSB3aXRoIHRo
ZSBzdGF0ZW1lbnQgYWJvdmUgc29mdGVuZWQgYSBsaXR0bGU6DQo+IFJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoYW5rcy4NCg0KfkFuZHJldw0K

