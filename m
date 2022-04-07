Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E554F8253
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300856.513295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTck-0008MC-CY; Thu, 07 Apr 2022 15:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300856.513295; Thu, 07 Apr 2022 15:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTck-0008KP-8Y; Thu, 07 Apr 2022 15:00:38 +0000
Received: by outflank-mailman (input) for mailman id 300856;
 Thu, 07 Apr 2022 15:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hzW=UR=citrix.com=prvs=089009d52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ncTci-0008KF-AL
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:00:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 776a17a8-b683-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 17:00:34 +0200 (CEST)
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
X-Inumbo-ID: 776a17a8-b683-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649343634;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=W0SXZnqS7IACHqJsaqvS0txvblc45PE1ryirYDXysyY=;
  b=iCtCa0rcqebm6VTfeUm2CNmCABKqTL/0jYx0S9KUmX56eGTKEm0aq1bn
   TxqsZSwPa5YUwqO1iZs4g37pz0Qk3apNIqH/ddhBuBdKFVE2sPj6II8Pw
   ojbuzTIPfdjPEtJsvXH3KIsCMI41Km8Wc+dSWzafqWisCnWPNvuRkMLYz
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68681110
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NMgve6uMNYSf6A2ZYz8e5cE6+ufnVEReMUV32f8akzHdYApBsoF/q
 tZmKWGFb/iDYmb8KNt2Oorko0ME7Z/VnNVkGQRsrXxnRikS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/V5
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8IJIHTmt4aXiMBOBl4MKt4v5ruI1aW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQ/MkSZOkQXUrsRIIBm39/02lP/Ty9JtXDLhZgH+0XaxxMkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZ1hHWDy2pVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l67D4/ASjAWU+FxV5btEgiogTbD4E/
 wrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2rSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpTZX1qvHbQKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJW6zM
 BKO6VwOvcY70J6WgUlfOd/Z5yMCl/aIKDgYfqqMMoomjmZZKmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7cQhRfSdmX8ivwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6NtsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:sSX74qNWZhhnRMBcT2/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90DHpewKSyXcH2/hsAV7EZniphILIFvAv0WKG+VPd8kLFh5dgPM
 tbAstD4ZjLfCJHZKXBkUiF+rQbsaG6GcmT7I+0pRYMcegpUdAa0+4QMHfBLqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXYOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LPErXoBerR8bMRiA0HkAgMbzaFBOO
 gg5RPpi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4bkWUzxjIdLH47JlOz1GnnKp
 gbMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Tol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+83JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9NllVnQ6dvf22y6IJyIEUHoCbQhFrYGpe5vednw==
X-IronPort-AV: E=Sophos;i="5.90,242,1643691600"; 
   d="scan'208";a="68681110"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCaj/Be5ZGl5XeinTV95KAV4HKvX8d2ngoQm1uGyB/IjS2FGY+Zx/Cjz+/IvQmdG6tqMSNaS5Auc6K2ht3aHEjMYXXaFaTzj0BD39cmFjEYQs/07sG1aKOo38NJ9yYJMfDEhHQaae6oVaRFnWM/mVNTBX+O//J3WACsIroEB3bpneFpG7LtHI9HKpEdOAyB4jIaESn23s9fkit7C4q01VYgsexd+FP9ytdE9KdwJE76jSsWMUeacaT9nnrRHfcXD2XHGZJtJ9I7s1jSIN3vKUdHGxRRqzn5klcGx9ZaK2OUK7ubZFag5BAylyKHbO0siE3wcCukELXoTe878fdvSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0SXZnqS7IACHqJsaqvS0txvblc45PE1ryirYDXysyY=;
 b=HDTklbn2Qr1WQ5zJEYJSwII8bIWJJbP7ByqPMukADRDaScQUuX7L4kgddjQDaZZat1kEhZjaH+hinhBPnYCB25AFoLbZ5wcMhL/pSPHz9VPjI8RabgQEF97k6c2GjS0E0QrWGF1lzpycbu7FdDE5nYRd6wwdy1j31H5yNolEi6ZsLmC3fVz7RfaBdEoMoZEA/XSPEjRyf1y/FBOAdhw2WGn4oC+brbVhxzHeEV/Cfe18NZutR8b23ElAxP+D287yxD7Whe1sDiDSOFSVc67wA+xSIUmSdCD/VQE5B/EUIVYTgcJZsOoqEFpqLHEPDCLvoqW9DWAAmMSuQfzd7sG5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0SXZnqS7IACHqJsaqvS0txvblc45PE1ryirYDXysyY=;
 b=Xybg55dwooztcUe/2JTYGi1jI+oD/QtBfljy4vfH6iaMaD8OVO0XHo4XXIsOmT41B9/Au/LRINDDslCumTkUs2ohJRuIzVtYT4PDoNwJ0cmls20TigwohGNrTkn2+1TnUjiSK/CVm7FVOK4r7usYd2Fb0eDxDKXqXHiCDrHFvMo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cpuid: Clobber CPUID leaves 0x800000{1d..20}
Thread-Topic: [PATCH] x86/cpuid: Clobber CPUID leaves 0x800000{1d..20}
Thread-Index: AQHYShse3pTPowzhzUqzya5673XmyazkguyAgAAJR4A=
Date: Thu, 7 Apr 2022 15:00:23 +0000
Message-ID: <a8a54dd4-4e55-d833-dc09-92e0122c9969@citrix.com>
References: <20220407010121.11301-1-andrew.cooper3@citrix.com>
 <4206733c-c4be-2e8d-7ea2-d145d3599e48@suse.com>
In-Reply-To: <4206733c-c4be-2e8d-7ea2-d145d3599e48@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 600a6049-5165-43ae-530c-08da18a757b2
x-ms-traffictypediagnostic: DM6PR03MB4298:EE_
x-microsoft-antispam-prvs: <DM6PR03MB4298CE247651467B16F02B48BAE69@DM6PR03MB4298.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1G8bIQeXOhaXDyTZCM5fIqqz5eS1ajreKBPsO9IlTxTal9vwxUAodogLkpGt9K/mUGI41lw1Eox50yQnJRw5Uau8JEq43lrx+al5GnZsYQTRBKsGnV03Q1uuzuxnpUDvPnB4a4wO7x2dDvJFWIkPjJmcZREhHwvPka549BRFtAPhXrtg0dAQvgrvlSeALBpZq5d2qt4X+/J8UEqPAEbuy5n+D02cEwEGu0gyc5TIfTk+yZzN0HBpteeVMGFwfoTV/Yo9rJORWOG/VH7Opv12U57LZ+/2P7qEJiLa0EPDaifwdkoNZrMRc4VcNjPbmloiK2p1ycfg8Xza9f8xxIxLgJAJgq2CvbvSPBymV3MSGTKVuO4KYA8LptVYD4GyZcv2kiegXM7ynduNxUbB9TK+yQ72hrWWgb5tFNrZk/XXwR83+aby9BJbSVW2qv9MZsD1+wfWwJg6aoGNKEoGUTo2vbpBmTVh6O1fXs3S/fkTUFEl96WRZHiv4duabSUeN8SxdThSbPzWGvaf7aOBqh3GNv0kMLuEsPsznxfa5vwXk28aOOoCBeGkeTGXoWQUpAjxCYSckLMGwa+uyY1lqncuzIfPxOSC4izF9QQnGzQAIEzPuJCIGNW57B5CWGomd1u4j8phwI223BMaCUovphf7VL4bndoS14M/QA3qz/0CLBFZ7IR+y/x264mH5HA1kUiYUjznx8ZO5l734ba5nAZ2tjSRYYXTzicC48s+fNT6jaP1zrevXI7LB3YPy5o5Lj7leEYrht5BsHIQxU8paXw45S11kuMxmTzQkC0zSD4lWLrxvOR5FqRkfq36lm0TS0IQCqJDiyFdaSqk4XdSwZIZ7kV3OMR7zQRhKab7XKum0t0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(2616005)(36756003)(6506007)(31696002)(38100700002)(83380400001)(53546011)(31686004)(186003)(26005)(66446008)(4326008)(71200400001)(76116006)(38070700005)(86362001)(2906002)(6486002)(508600001)(8676002)(64756008)(66476007)(54906003)(122000001)(6916009)(66556008)(66946007)(316002)(5660300002)(82960400001)(91956017)(8936002)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K05mK3NYbDlBZXl5YktOSkxDWjdpSlZhVk5HbmdVVTFkN2taTWlWUEJIUDFE?=
 =?utf-8?B?bVFMTDlFZHVQNnVjYldjNkViWUE0TGhidHJhcVl1NWg1Q1dQSjRLbXVuSDBk?=
 =?utf-8?B?TENkTHRXcmFiOVdldWJsanFiTEtWL2dZS1MzdHZCeFdnOFpTb2pkMmxDenFq?=
 =?utf-8?B?NGs3ZCtwYzBiRWplYUoxNkVqa25vK05aSi9jNHBXZzh0S1dRL2tLWmtWMHg1?=
 =?utf-8?B?ZlVuUktTNzR6Qy9DanJwK1ZsdHBXOVM2OTA3VGlpcGR5SndqNXJBeEhFNktO?=
 =?utf-8?B?cGppVE13cUtmbzFPc056VmU3UGtQNExENlY0bFhaNmxNN0VTL2RQZGYwU0Za?=
 =?utf-8?B?cldrdFZGaUtvdGxoTGlKQXM1Z3MzcmNFdU0vOXFZTU9raUlBTWNjaXkrNHhG?=
 =?utf-8?B?RWx3enl3UXhTNGdMZ1owQ1lkMjZ5RnNGZjIzSS9jS2J3d1d4aGdhVDAwVmxT?=
 =?utf-8?B?TlA3TTBWTjgyTCtIOW5YTVNPMlJaZEcwQmdzTE4yS1g4YWo3eXRFRGg5M1E5?=
 =?utf-8?B?MExYRXJ3TVlBU2x5aU45SjlqNW4rSUNCSFd1NHJORlE0REppU1NMeXhGQnFB?=
 =?utf-8?B?a3hqNnorRzRYYlZJdFdXbzZlNzVZVndBbjNOeDJGL1dxOUR1NmxHc2ZQN1NS?=
 =?utf-8?B?cFdmVHcraDZyRFVLaml2RTBpQVllbHVTdWJhZm9tTzVsWEM2Z3ZtZTVyZlV6?=
 =?utf-8?B?eFJuN0JaLzEvK1QrMWx5SUVYSkdCRloxV21MUDF5MkNxSFRHZTdRSzBLOXQx?=
 =?utf-8?B?dEROUDBscTVrd0xmRTRuN1YzcW5TSWxZOUp4RkJXbkpZVUt1QVE5LzF3Tlc2?=
 =?utf-8?B?QXcxb21CUmhUckZEU2QvSVZOd2VmbDZzSGF0cDF0ME5aaUhFZTF5TGxXZVRC?=
 =?utf-8?B?c3RudTVaMVZ4YTAyaTdiY2dtRWF6SmhWTFJGNEZoQzlBZnBscE15YnEvN1BM?=
 =?utf-8?B?dWxOc09NTEluU1BNb2hTMFE3eGlxanVhd1ZPYzM0d2p5TldycnV2YnQvYk1Q?=
 =?utf-8?B?aEU0L0ErdU4zYmxSdEsydmpKM3l1YUlORVdaUlZhWEJRVUJ5dzJiRXM2MUxG?=
 =?utf-8?B?aHFNYXlMcE5qc3ErZnA5TENoanRUUS9rQzdyWXVKTHN2ZzI1dHg1SkVWV3Zt?=
 =?utf-8?B?WFZVaExwMzYreUlLdU1INEJLT2c4SjRJa2U4RDRpNXB1TkFnN0RNT0NFeXNk?=
 =?utf-8?B?OG9rOVBpMzVwcEhMaW10WTZNd1UrMjU5NFBBeHgvU0VUQ2dyUUZDSnZ3Ylhp?=
 =?utf-8?B?TGRWMitNVURlWnljU2hBdmJ1TWtnMTk5TVA1SHM1NTI5cERYNVBPWFpRZk9r?=
 =?utf-8?B?TGlnMTFyN1lqbkN1WmFxOWpCcTRMSktUSU5kNGVVMHBaU3VDdWJDSmdoSTBB?=
 =?utf-8?B?Qkw5WHlEZWtXSzlqbk1tSVpCRnJxY0o3QlpXMkE0ZlpQeXZCZzFybnM3YVR1?=
 =?utf-8?B?d2laT1VvWk9WMTczNWFCNnhOMmV6VVFhYXBWN2dITG9CMXpWVTA2Y3JRTmgv?=
 =?utf-8?B?d2hPUGFwM3kyWmJHekRLV0JkMmpxNXhCZnBVaEpoRjdKakE2aHliM0tMTWJo?=
 =?utf-8?B?cmROWEQrQUQ5UmlTaUFjTTUydFZuM1c1Q0FrWkRJQm1hV0podFZpeVovaDVi?=
 =?utf-8?B?akFBWHBLVjhlREhKdEtOekhLQXR1ejBNeU9rdnJjMHBmeUhjaC9FYUd6QXFW?=
 =?utf-8?B?V0RtL2VxQjFOa3FKa291V0lKNUxoQkkzVW9EWXZ3QkMrZ0xXeEhMUisyejdH?=
 =?utf-8?B?dXFMeDgvaFl3blJmcEp4aUlpUkk4SENmSEJML2pYSUgvZ3NrZnJsVE5hT0pT?=
 =?utf-8?B?ZHgzRWpvRGh5ZFR3QjE4TDhKV0VPOURzYit6Wk1DSlNCRkluWkVoMXY5Y0NQ?=
 =?utf-8?B?T25LMlA1OHFoZ2h2WERJZW1ZTTVYMHJEczdYME5XUklsREdGN3VkcGRiejhH?=
 =?utf-8?B?VU1QNVVVZmJueUJUK1E5eVd5b2FwMmo4dW5Zc2Q1U2ZwVmYrV3JncmR4Y2Ju?=
 =?utf-8?B?d0tCOWo1WEVZN3ltQ0RPQ1Znd1BHTWxUejBpdXl1ZXhRNjZxeEZ3ZHozTy8x?=
 =?utf-8?B?Qi9hWWNGKzlYOEIzSDNjN2NBekZtZERhT0VvdnhFOHBVczJmc3NPUi8xaU5Z?=
 =?utf-8?B?aHppaHVvSzFDYTZ4Q2x5UVpVRHEwNnhjQy8waFIyQUgzcXlUajh5Vm5lUHNo?=
 =?utf-8?B?SUhrZXo3R2ZFUkhEMERxQnZyNkI3cjVRSmJwZEdYVGNDNWpTanIyUjVlVStM?=
 =?utf-8?B?VHZnU1lZazFxMXZ6eGFXdjhNUHF4Zlp3d2VGakxSL3lPL2lxVUlSMkIzTEM1?=
 =?utf-8?B?YVlHejRHUzdCQjFiQXpVNHc5R0NoZnRoSUVuNzA1VFhja0IzZDRqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7954C7AC1D4CA949BBB32CD60B95C30B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600a6049-5165-43ae-530c-08da18a757b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 15:00:23.5318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKyerdM72pvjMKz8x1IE6oiad3XgYxoeROFFpY7o82nyLsOPnV4aX6FCuQD+x2R9VEzc2W01pUQ7OByY9k6y5ZDaZjDJPAoryy5ABQcBkJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

T24gMDcvMDQvMjAyMiAxNToyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA0LjIwMjIg
MDM6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBjL3MgMWE5MTQyNTZkY2E1IGluY3JlYXNl
ZCB0aGUgQU1EIG1heCBsZWFmIGZyb20gMHg4MDAwMDAxYyB0byAweDgwMDAwMDIxLCBidXQNCj4+
IGRpZCBub3QgYWRqdXN0IGFueXRoaW5nIGluIHRoZSBjYWxjdWxhdGVfKl9wb2xpY3koKSBjaGFp
bi4gIEFzIGEgcmVzdWx0LCBvbg0KPj4gaGFyZHdhcmUgc3VwcG9ydGluZyB0aGVzZSBsZWF2ZXMs
IHdlIHJlYWQgdGhlIHJlYWwgaGFyZHdhcmUgdmFsdWVzIGludG8gdGhlDQo+PiByYXcgcG9saWN5
LCB0aGVuIGNvcHkgaW50byBob3N0LCBhbmQgYWxsIHRoZSB3YXkgaW50byB0aGUgUFYvSFZNIGRl
ZmF1bHQNCj4+IHBvbGljaWVzLg0KPj4NCj4+IEFsbCA0IG9mIHRoZXNlIGxlYXZlcyBoYXZlIGVu
YWJsZSBiaXRzIChmaXJzdCB0d28gYnkgVG9wb0V4dCwgbmV4dCBieSBTRVYsDQo+PiBuZXh0IGJ5
IFBRT1MpLCBzbyBhbnkgc29mdHdhcmUgZm9sbG93aW5nIHRoZSBydWxlcyBpcyBmaW5lIGFuZCB3
aWxsIGxlYXZlIHRoZW0NCj4+IGFsb25lLiAgSG93ZXZlciwgbGVhZiAweDgwMDAwMDFkIHRha2Vz
IGEgc3VibGVhZiBpbnB1dCBhbmQgYXQgbGVhc3QgdHdvDQo+PiB1c2Vyc3BhY2UgdXRpbGl0aWVz
IGhhdmUgYmVlbiBvYnNlcnZlZCB0byBsb29wIGluZGVmaW5pdGVseSB1bmRlciBYZW4gKGNsZWFy
bHkNCj4+IHdhaXRpbmcgZm9yIGVheCB0byByZXBvcnQgIm5vIG1vcmUgY2FjaGUgbGV2ZWxzIiku
DQo+Pg0KPj4gU3VjaCB1c2Vyc3BhY2UgaXMgYnVnZ3ksIGJ1dCBYZW4ncyBiZWhhdmlvdXIgaXNu
J3QgZ3JlYXQgZWl0aGVyLg0KPiBKdXN0IGFub3RoZXIgcmVtYXJrLCBzaW5jZSBJIHN0dW1ibGVk
IGFjcm9zcyB0aGlzIGFnYWluIHdoaWxlIHByZXBhcmluZw0KPiB0aGUgYmFja3BvcnRzOiBJJ20g
bm90IGNvbnZpbmNlZCBzdWNoIHVzZXIgc3BhY2UgaXMgdG8gYmUgY2FsbGVkIGJ1Z2d5Lg0KPiBH
ZW5lcmljIENQVUlEIGR1bXBpbmcgdG9vbHMgd29uJ3Qgbm9ybWFsbHkgbG9vayBmb3IgcGFydGlj
dWxhciBmZWF0dXJlcy4NCj4gVGhlaXIga25vd2xlZGdlIGlzIHVzdWFsbHkgbGltaXRlZCB0byBr
bm93aW5nIHdoZXJlIHN1Yi1sZWF2ZXMgZXhpc3QgYW5kDQo+IGhvdyB0byBkZXRlcm1pbmUgaG93
IG1hbnkgb2YgdGhlbSB0aGVyZSBhcmUuIEFueXRoaW5nIGJleW9uZCB0aGF0IHdvdWxkDQo+IG1h
a2UgYSBzdXBwb3NlZGx5IHNpbXBsZSB0b29sIGNvbXBsaWNhdGVkLg0KDQpJdCdzIGJhc2ljIGlu
cHV0IHNhbml0aXNhdGlvbi4NCg0KSWYgeW91IGhhdmUgZWxlY3RlZCB0byBpZ25vcmUgdGhlIHJ1
bGVzIEFNRCBzZXRzIG91dCB0byBjb3JyZWN0bHkNCmludGVycHJldCB0aGUgZGF0YSwgdGhlbiB5
b3UgZ2V0IHRvIGtlZXAgYWxsIHRoZSBwaWVjZXMgd2hlbiB3cml0aW5nIGFuDQp1bmJvdW5kZWQN
Cg0KZG8gew0KwqDCoMKgIHggPSByZWFkX3VudHJ1c3RlZF9pbnB1dCgpOw0KfSB3aGlsZSAoIHgg
IT0gMCApOw0KDQpsb29wLsKgIFRoZSBvbmx5IHJlYXNvbiB6ZXJvaW5nIHRoZSBkYXRhIGhlcmUg
dW5icmVha3MgdXNlcnNwYWNlIGlzDQpiZWNhdXNlIGl0IGFsaWFzZXMgdGhlIGxvb3AgZXhpdCBj
b25kaXRpb24uDQoNCn5BbmRyZXcNCg==

