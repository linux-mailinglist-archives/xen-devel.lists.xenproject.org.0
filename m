Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F274C8DFF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281554.479934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3ek-0000wi-IC; Tue, 01 Mar 2022 14:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281554.479934; Tue, 01 Mar 2022 14:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3ek-0000tp-F7; Tue, 01 Mar 2022 14:39:14 +0000
Received: by outflank-mailman (input) for mailman id 281554;
 Tue, 01 Mar 2022 14:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP3ei-0000tj-Gz
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:39:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ac5d9aa-996d-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:39:11 +0100 (CET)
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
X-Inumbo-ID: 5ac5d9aa-996d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646145551;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b3ie2UdnaGhAvEeedo3V4gsmdguE8rT330zB2Ok0ack=;
  b=Pd9SdvNWS4+IZLJU1Eji7R2MhQ3YhZU0Oi24WTungNGLJAEm/kWGbBO6
   KSrXtAqmODygQSek6UkRSUv9Ee/VXJcVcdRBz2OVNfWV3Ki87WZ6hcH40
   aZWxC3AjdoBo1b+DFhEzStlrQ7lsvvym8g/lvqhhoQ6g9v8P+k6egN0yi
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65630726
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qhmNxqLpf3TRDE6+FE+RzJUlxSXFcZb7ZxGr2PjKsXjdYENShTMDx
 2QaXW2FOv+CZDPxfdgnborn9hhT7JXUz4dkGQBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dYx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NZ3mbzpUjoxBK3dv9kXckdkTBBXY5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6uAP
 JJGM2QHgBLoeS0Vak4ILs8HzOai3XmlWCZciF3Luv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJ0WPK218LhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJTKcEasRqw0pDU8iGkDElacmFwQYIf4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJc8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBkxbZ1aJWawO
 R67VeZtCHl7ZiDCgUhfOd/ZNijX5fK4SYSNug78NLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOXGGodZOdglRdRDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcm1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:f5xLy67MDRuvAXIfvwPXwWaBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+873WBjB8bfYOCAghrnEGgC1/qv/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpcdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwseOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv6/VXEO0aOSAWQR4Z
 3xSiQbToNOArTqDyeISC7WqkzdOfAVmibfIBGj8CPeSIfCNU0H4oJ69Pxkm13imhAdVZhHod
 J2NyjyjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1VwKp5KuZIIMvB0vFuLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZMyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR+2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKwgFCvsukKSRloeMNoYDaxfzO2zGu/HQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65630726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY1goSWaN1VXKrBdtDqTdE36jKjl6aXxJcNELr9cLA61tiKcAslyEgkCJd8oE9U9O/AVMfM+/rZRbVwvNAJNa38gQpEuknnp7bwd3CjGbtvI79uDNJkuEA0aCTcXcMS3RLxGbrAAR46Z9ZKGNMNRjlDexc8Rkpmjy0YNh6IXnCY/MUNdMYSNKlvhdgiMB2wTR4acu148t5RuiX5ExG/Z/J8q9blDFzCymXn+96THJiLBmYs3MRWX7BONmo5hdrjfvrimY/gVJ3bd2S0T/AFi0BsXoO1614mLuVnq7kLbsX4ISOKHZ3JULhkIShSO069Lz26jJj0wGU1ZMLzzKGXzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3ie2UdnaGhAvEeedo3V4gsmdguE8rT330zB2Ok0ack=;
 b=Af0pHpeUYtQ8Esxow0JJJj9+RflSvSwr2bZ9YF0dj0syYH1gSCWvsEHW5LsaAJ8SwmkCzuuVSIu5DfJOS1KjK0dQGIaKt/qF9fEFeQbktmDEznzNNELA7AqnnLiLpHCJdu2sfQKpGXtYGXBk72hY7vvaE+Pz/L1I1dZpBjVFent4dCmEJVBJgANVIs65HLykxJZ5D0UHC9VOT5uz5rdn368I9101OYhuqNwg43lwrzWfhofbuJnOSaHX6hUIVagK6IU8zf3npi7kNTr4oiYRzX6QNAodIcktAS58Hxg+Pm6FhG0F4uWmBWAVV6uSbxQ+Z1hKdS0uQ+fFMZqu21vx3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3ie2UdnaGhAvEeedo3V4gsmdguE8rT330zB2Ok0ack=;
 b=Q76YW8dvEDJ8mmxvk8NZzmelJwwXKnYavWYUTGQuZ+UKvTWoAexMW7qLspuP2SLSUIvU8VOVWACOzdRAR39+VkyR1cVBGDfUPxy93HU44y7ikg/FGpjKCYumnXEaO+MgXc7cV7f5McdJiEUZqroJ+kFLtnlclHm+o3RJP3vz8oQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/time: use fake read_tsc()
Thread-Topic: [PATCH 1/2] x86/time: use fake read_tsc()
Thread-Index: AQHYLVxVKor9YtEUbkuWag9T3yUcNqyqf+CAgAAS0gCAAAbHAA==
Date: Tue, 1 Mar 2022 14:39:05 +0000
Message-ID: <ea46555b-6ab3-620c-0937-401f6335b842@citrix.com>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <f4f0e92c-9586-e021-6ad5-718628f88fcd@suse.com>
 <d1c3822e-bec1-d8ca-8954-a4942f5bb23c@citrix.com>
 <2c3bb06d-e4f4-33d8-7972-71dc7d61c554@suse.com>
In-Reply-To: <2c3bb06d-e4f4-33d8-7972-71dc7d61c554@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8fbfac8-3e4b-4ca1-62de-08d9fb913ca4
x-ms-traffictypediagnostic: BN6PR03MB2467:EE_
x-microsoft-antispam-prvs: <BN6PR03MB2467DDF4C4A4581034D1A71DBA029@BN6PR03MB2467.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z+FW9xmntO6+Qgp+weOxqx4NEfgBPc2A0XeeTzinq1UuWD78Ru6pIN0frBTVrAIT2HQUjdcbq1PD3k7XJFtTzH1mqWizH4jO83t2MntcCfP80gaurjoOxGmaZkE10A/HZJPqmvSCjMrjbb35kxtv+NU0s3TdV+8TYvaFIbX9ODsUpxf+dpY8Utn80mop9V1ZHcVXNkgzKWjmDN/2+NwzQvKvz01WVB4bb+42fQmOqFi6xwubntwVRGorH/RVXdAIkFLo7XhXDBvUZZKJbVGk2Z2pZXapGtv7JXRyT5oI8Jo9c9W9nr2VAMYETBufyrkkY/kwwuZM8CTgO+pXn4zqszMjz8Ei+7VdPQNpL4AMYUBSgtuHkzmIQeXkQfHXybBBypsnSzOi6j/T+nFX2/Xf51diTr7ZMm6UvLd1dtr1LtROmM6nfRf0hHNvRCPfVodpvtgcSoilTUDdaL4T9h045KOAIW2gcKJNOtPBkP19tUtCFKJM8rSS84lgAlLgKmxiEkJM+SmYk6ft7KtWBAM1n7L76FnJjHtj9LsLCOz8AqNpIO2sNSOt3Ln1n+QkabGUjqukjXCLvvmG5epqvs7uX8hLL0hqcWpKpka4oNg2zrenli6m1v9dfum257TQPNzPBENBRMh04qMEsP40+aDd3QPsyw38Mm3v7nkA0v6a4AB+VMRdnaRCRhIkdapihdeOhcaOJYzLwHP8/vAqbslUupR/Smpgz6yZk7s5ws4OWW3lYQ+7XZSs1w4XpiMqP65rbgfreDH0MJp28dJ37Kb25w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(186003)(122000001)(26005)(38100700002)(38070700005)(36756003)(4744005)(6916009)(6512007)(31686004)(2906002)(66556008)(6486002)(66446008)(31696002)(8676002)(4326008)(64756008)(66946007)(53546011)(83380400001)(508600001)(91956017)(76116006)(2616005)(86362001)(54906003)(5660300002)(6506007)(71200400001)(316002)(8936002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUc1UVFtaHIxQTRZcC9BOXM1bWgrZWtCa3pDR0xIZlhZeDcwZkd4dHVJYXlO?=
 =?utf-8?B?WE9nalBERzNVRUFOMDZCVFkzUjNKQy9EY20vZnFPY0ZIYXIrT1pCVGtSMmNY?=
 =?utf-8?B?akNNbUNYRTZ4aUlFSzBGUGdORFgwQ0pWZlpJaTlPMk5NS3FWVlh2a3ZKSzV3?=
 =?utf-8?B?ZVZZNUxXOFNiZmgxS3lGVEh0Y2YyS29oYVB0Y0xKdXBHYjJidjlCWENWZGt6?=
 =?utf-8?B?dDZ3SWNFaGRSSkxiMVNwWGZnNFVmTklQY0QzVE9hQXZvMGJUcFdQb3JXc05o?=
 =?utf-8?B?aGx0cWhQR1EzSWVJSktMRGRKdUsrbVRmcTFaN3ZuUEl4akdIR212TUhzdUpr?=
 =?utf-8?B?NEJRWVF2RlBkVWtxMTU1KzZCUENtMjJDNnBPNjQ3WGhka3RnR2l5aW1WdmZ3?=
 =?utf-8?B?c0tWYldQdlRpSzE3TGt4QXBHYnJKeWRqc0h6ZzRpMlhFSTV5K3BwVjZxajV0?=
 =?utf-8?B?ZENhK0pVT2ppVDR0bWpKWm81WUtIM1Z6YVJWMGw1eHpjYmErY0FOWGRnVHV2?=
 =?utf-8?B?YWNqUVdiTGUzZW92ejF5VTJJemVMNmJrMDFZYXJHai9xcC91ZmZ4Zi9RY3h1?=
 =?utf-8?B?WER0SWF4V2I0NXlYZjBGbE1kbTJQNVpsMzNkNkJ6YnoxeVlGekxDM3hkajJH?=
 =?utf-8?B?MzlkSWNRYkZ0SVF6ZFNCbVRNbFpiMVNtVFhxREJEaEtRSC9yM0NQd3RmZzdn?=
 =?utf-8?B?eW5xb1cvd0xIeTBZQWc0Qm9zY3k1NkdLa0t3anZlVjc5L1h3Q3ByTHJEV3B0?=
 =?utf-8?B?bFgvb2NhU3lWblc2bHhWZHJiV0NaZFFGeUlMZ1hTUFFFeVk3QkxOZ0JzckRX?=
 =?utf-8?B?YWJPa0pHRWltNXdkdWZuNm95cjc4NzAzRk0zRHV2K204clVYNzhubVRPV1FR?=
 =?utf-8?B?dVp6QXJYdkxNdjB6TVd2YjZIZDJOYStKUDBUSG5oMmkzOGpvRk9lYmFhODV0?=
 =?utf-8?B?Y3M5UnN6UW1ZTHI0bWtJOFJaMXJvYjc2cFFUcnhWeFk1azRyU2lNTG5wL2J6?=
 =?utf-8?B?UjZRY1lPU0Uybk5rR0hlODNHNFpkSkVwdzZGOXZSMTBFUDJDSlduUFE3Z0du?=
 =?utf-8?B?b0xoaTZ0MlBRdUIyUTMyS0d6V2VnMmoxckpoR3pRc09Pc1p1UEVuNlJHN2lB?=
 =?utf-8?B?RWhUdWpVeFN6cEd5UmtRclh1NVBDZGpaL3hQaXVtZVBmdjhranBCTlBIb2ZM?=
 =?utf-8?B?dU5VSk9Md0t5cENyUEFhekxUamJrMHVjcERKb09QR2ZJSlJHMzM4Ti83ZnhC?=
 =?utf-8?B?UmZSQ3pDMklWSXFsUkc3SjdXdWVlTFY3aUcrSEVyUkJJNWFmUmtpalFydnJJ?=
 =?utf-8?B?cElVSWlTdHdVUUxRODZJNEJidzR5QXJVeExCYy9WQWVlMUhKY0kxOG1SVXNT?=
 =?utf-8?B?Sy9qWlExM3g4dWR3RmtGQ3pRRFY2VmlWQ2V4VG5TUnNMQ2dFRTFjYW9GOGc0?=
 =?utf-8?B?RFVTSXZvbTBOdWFSSFlQbkxSQUlVMEtzekFEdkIzUEk4NXI5OGljVWRFc0xX?=
 =?utf-8?B?YnRYTlNkWjY0ZG1kSkdPT3llK1d4cnk1bllRekJpM2VLZWhYL0swL2E0dVVX?=
 =?utf-8?B?UTh4N2FGaTZ0UFp3NEdCc0RTaU1BTHEyWVR5dkFsSnFhbWRVUHF3eXVEbVow?=
 =?utf-8?B?YXRuOWkrRXlGcU9WeHUzcUVPVnlGVjNEeEFSYjdhMFg3N2lBanBNeklpK3o5?=
 =?utf-8?B?UWg0ZXQvZVJydjZJYnBjS3ZseldBR2NTREFXNnhWc3h2VFlGK0VJa3lBT3pr?=
 =?utf-8?B?SUhOcGorZTlRSmxqaEVFNTArRzR0Z24zSHdLSEkxajlRZkpiKzlxMDQ4QllQ?=
 =?utf-8?B?QURTV0pjMDFyRTRLSzVGVEFkVmk0WlBVRlp5aFhsNGkxZnY0dElzWllDK0Fk?=
 =?utf-8?B?bWF6cjE2MzBoeVhkeGlxZ1pGemIvejA3cEM3VGMxaU83TGRnb3VrN2c5SSt6?=
 =?utf-8?B?ZWozaVBab3M2VHEvV2h5cGVBR2NVN1JqKzV3ZVNobmVRa1VMU2hoeDJVbmNh?=
 =?utf-8?B?WWVweDdHT29ZODZNSlVLMzlvblRZNDFlcmZLMnBKZUZDN0FDVmJodDZ0YXB0?=
 =?utf-8?B?bGw3NEd3K3p3dXEvVlA0V1lMZUVjUmhJQWlta0p6USttRjFuaVB5ZWprRUhF?=
 =?utf-8?B?dUlCRDZjVHdVdmNYK0JCZ2dDSW5vU3hwNFdNajJkVUZqSW1WSDVMbmxVKy9r?=
 =?utf-8?B?blpoTmdweVBZVC8rK3g5N0hlenU0c3F6OTR3M3JVTHRjNkhuWFNyRWZNazlM?=
 =?utf-8?B?SE41NUpybDljbW9DQjg3K2t6RmRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D2398779606C241A6E866C697B2D6E0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fbfac8-3e4b-4ca1-62de-08d9fb913ca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 14:39:05.4934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rFrlNSiqOK5yr0xZJoPeu/VAJ7KqKZ4GuEjTQgWCKo1FevH2zIkT0ibfG+wRZaqC7s7bNszx1zQ09Ks/sXJL+o22tA4lbBuuh3VPL1m3Hu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2467
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxNDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjAzLjIwMjIg
MTQ6MDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwMS8wMy8yMDIyIDExOjA1LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+IFRoYXQgc2FpZC4uLiB3aGF0J3Mgd3JvbmcgYSBwbGFpbiBOVUxM
P8KgIEkgY2FuJ3Qgc2VlIGFueSBuZWVkIGZvciBhDQo+PiBtYWdpYyBjb25zdGFudCBoZXJlLg0K
PiBBcmUgeW91IGZhbmN5aW5nIGFuIFhTQSBmb3IgYSBjYWxsIHRocm91Z2ggTlVMTCBpbiBQViBn
dWVzdCBjb250ZXh0Pw0KDQpXaHkgZG8geW91IHRoaW5rIHRoYXQgYSByaXNrP8KgIE9ubHkgbm9u
LU5VTEwgZnVuY3Rpb24gcG9pbnRlcnMgYXJlDQpmb2xsb3dlZCwgYW5kIGFsdGNhbGwgcmVzb2x2
ZXMgc2FmZWx5IGlmIHRoZSBwb2ludGVyIGlzIHN0aWxsIE5VTEwuDQoNCkFuZCBvbiB0aGF0IHN1
YmplY3QsIGRvbid0IHdlIG5vdCBoaXQgdGhlIGFsdGNhbGwncyBCVUdfT04oKSBmb3INCmV4Y2Vl
ZGluZyBkaXNwMzI/DQoNCn5BbmRyZXcNCg==

