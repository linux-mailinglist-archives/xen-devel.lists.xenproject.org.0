Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1F6E9726
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 16:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524297.815130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppVKM-0005nb-4k; Thu, 20 Apr 2023 14:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524297.815130; Thu, 20 Apr 2023 14:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppVKM-0005l9-1X; Thu, 20 Apr 2023 14:32:02 +0000
Received: by outflank-mailman (input) for mailman id 524297;
 Thu, 20 Apr 2023 14:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtFG=AL=citrix.com=prvs=4670f3580=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ppVKK-0005l3-6g
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 14:32:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 185b9f80-df88-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 16:31:55 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2023 10:31:52 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6393.namprd03.prod.outlook.com (2603:10b6:303:120::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 14:31:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Thu, 20 Apr 2023
 14:31:49 +0000
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
X-Inumbo-ID: 185b9f80-df88-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682001115;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hu3N8RfGTnYimH5sNIanmVTJHPJnSeQh5LXMy1SqoKY=;
  b=XApEdXV2vew2TPpYG2Z2YcNwGtQ8gfUBUo5XSrz6iXrn3vrhw516LIDe
   aD22pWcdeH6XzLy1dtaZq8AMw+dbPnbdmhONqv8W/0XAkwi0yo7g5ZUnp
   BeWcd1d0nSNx8Nv45NAiP2f2h/wW4Z45OzXUdvMDEf90SH/U5mVPcPGoP
   s=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 106291836
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yNvRaKrFbXfnSFWCmJRe2quuxv1eBmIsZBIvgKrLsJaIsI4StFCzt
 garIBmHP/mOYjDyL95yPIuwoU8A7MXVn9QySApsq3o8Fi8R+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzSFNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGgOQU2C17+1+arhRblCn854PtG2OpxK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWLEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpMTuzhpqU06LGV7kdCWU0GTVSbnfywilXjccl4e
 1Y46BN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq17r6JqRuiNC5TKnUNDQcbSSMV7t+lp5s85i8jVf5mGa+xy9byQDf5x
 mnTqDBk3upNy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDEhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:LeS++6EKv1riyTrVpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: 9a23:fjv9KWxkAuZFrBaKHA9iBgVMGe94cy2Az07IeUDoJ39jE6+NFFmPrfY=
X-Talos-MUID: 9a23:p+oBZgR2dK57+e4pRXTH1WAyJN9nw5irAUAWzL8dnJmeGT5JbmI=
X-IronPort-AV: E=Sophos;i="5.99,212,1677560400"; 
   d="scan'208";a="106291836"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFZCBOyWAKCQRAmnXCgJh7g4Gbm/IzzV43EY/AojHazI8Ndg/RloOHvz1o3bzc6wNLxOGo/DD8aLxaGEjFiN95EKWlR/4lH9hzDJccZbpMXyYBf7eJBxj7CDHo/k1i5HbPvMfrH4/Ca2z/jNi511TiuGk9QMDSuZdUuLVohg4OJhEqLlqI34kMlmRul4SmUZaNZoYoC3P2DP0TqS4wIvQhVp06nTG3BFbSGmfunSQPa9TRluBMR8CtTqnpE6of32ooW/JwT9appt898kA3CsLu999gty/jx11P3EnyV8GlrKvTrquXl2bEQvoY/qYQ6vm3pzDdE0FNNoq/m2Fi8eKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/jlALJv5IVhVxP45HXkIvs+gsd3eb1cG16uDH6fbuc=;
 b=AAM4KMSsp/TvT9hYbLu0UBPQH3/d1/rS1zEhOQQBXVB2xgfvIVnai1gAVZosr7zDCaULOYciEjLtsiDNOKm7w0xfePMdGZzYlC3JQ+HkHF5O/DD0UNdU63qD3qm6Ry09ckcVyBIgi89+rnL58rVD537fkZhcg1dHik8GFPe4axPUzuTo4EAOj1z68I4f+Jtef/wpb2yPTuhzD2opIGtRnUcgogtuhnLIT6tZC7sUwf0G6rRiOplA+G6oG/esMXW6N2cdeZU/o0JMUac+emR1Ui6YhYj4nQ0uv5mpkRP5z4XjNuU4qaANghcUWyN218AY1+imSEqje7ASxWdqeVAnjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/jlALJv5IVhVxP45HXkIvs+gsd3eb1cG16uDH6fbuc=;
 b=ADzi/aHxiFtI0B8wpqB8J//i8m8akfr/oVTthvGm+nhpeH+oOE293ugSNDZWB7B/ArrVlZiMYyhU2UGtG2BCqpvhBkv4qGj4r/UxIFeqZz/uLJApO6bL7qMdC2XAzUUNB+Iw/1DImfS2ydlMruGUSKi/qa7iqpRn8a5VrBhEcKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Apr 2023 16:31:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZEFMzu8k5wlYt2aD@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
 <ZD6AejXJxQxAyrx1@Air-de-Roger>
 <c736271f-96ad-dfdb-48ae-b8e9cc002d9b@suse.com>
 <ZEAO8e9iTjmi86fr@Air-de-Roger>
 <7e3246c7-6de2-b3eb-477f-99ef9bd1b33b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e3246c7-6de2-b3eb-477f-99ef9bd1b33b@suse.com>
X-ClientProxiedBy: LO4P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: bad8d85c-1a78-41e3-9124-08db41abf99a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RJ7ptLSlItEpIlLifTBG7LGDjnhiz9xAMu0AFpFjiZ1AmHXUjUVR9LmMGsHOK23XmpKKoAXl/Ipfk8Olc5pDqM4qIOy7EEp1Kw5MoPQwL0i3bUmL0Onv0qgA5SRHUMc35lR1cVTy+CjIui60641oR8GCZlRhiFo4Mim9pKMLOWydHY4rnuSviTyyRQ7/BykVpPKgzIJ8cVNhANjP59hWDLW7cfOnGRmAHyyKzN54K4XfTsZFAzlW0Ued2kVyRxrwY/z6yKsTLGVzVm7G61X8NVi7vFCeg94alEhYpTu4futJTsJaOla6P4TmU+AWGk7r6nE2cLQGIEoSYOUqx0UGB4QmgcIr0/Jrnv77vuFTcGatxDI8D9cYHGuUR2l06NOQ4JuE994zuYR/VgxmFcUyuR0LESKqMqoFziK2v0qzL8NdN3HP4WYBrqj2jmFylNzpGBl+jfQgHEa7XtqoUMQNV33kctv0XlR+8cuipUNnrGWHjzHgSouSJqFOOwiz8g9hM3uQwcUOZpKDEerRKbgSpuP3jiHn5wfSEHrXVruLjjeLGeSSCFneRxC8rAhf2eBa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(33716001)(26005)(6512007)(6506007)(82960400001)(38100700002)(6486002)(478600001)(66946007)(66476007)(66556008)(6916009)(4326008)(54906003)(86362001)(85182001)(6666004)(41300700001)(316002)(83380400001)(9686003)(186003)(53546011)(8936002)(8676002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0RoR2psME9KcU5rLytIZXlyYXZnN0lVdnJBVmFYSmFZWms1d2tmc3B0UUcv?=
 =?utf-8?B?M3ZKZmkydTBxMHpLWVhkdmtGeGU0R09OZEhxeWVSSGl1RThyTjZFWEY1ajlS?=
 =?utf-8?B?NGY2V21FcDZnV0d2enJUNWFrQXZLZjdUM0VHNTFLdnBCM0tSMXIyS0RvV1J2?=
 =?utf-8?B?K05zSExjYS9Jb1I2TGJGVUxnaFFtbG12UlJnV0JlSjkzSWJuTjkrVDhTQkE4?=
 =?utf-8?B?TXZDblozM2lDTlRpc2VPeUlCdzh2LzY1STB4UGtHMXhucGU3WHZyWkNKT1gv?=
 =?utf-8?B?b2YyTENUcGdoc2ZqQ09XcFdNMCtET21MOVdVZ0M0bWVOUFcyMDNSMm81S01E?=
 =?utf-8?B?c3pranBiblpXTmVGcm4wUXY0NnZ1QWRqcldYSGxpTVpYTXUwQkZkT0xhZFY1?=
 =?utf-8?B?czcrRUh2VUsrMUpuQ1ZmeXVGRi9meVlEMFZ1dGwvbThsN2xFaStxNHQvOW1V?=
 =?utf-8?B?TjFMNlRjMUZObFFKVkJReXN6MGNNc2xUV215R0pLeG5wY1hXNEt6NXBtQ0xV?=
 =?utf-8?B?RHlJTXBPSzkzZlc4M2V2TmUwK1MvdXNWMHpUUm0waTZtWnhJKzY0TTlYcHU1?=
 =?utf-8?B?Sm1LT2J5TlpuRllubkNFS2M0ajk2RUZFOEgxSjZNT0NsOUs3bWs0SlA1TmRC?=
 =?utf-8?B?UXFhUFBsa1dCdjdrNXBub3MzRmZqaU1yTGRXRFVILzhYQVpQcStLNXNqWGk2?=
 =?utf-8?B?TFRGS01PV3hZOXlLRjZvcDh3dk9aRWJDUUhwdGYvb0FMZWo1YUJoMFZTZzdW?=
 =?utf-8?B?WGdYNytmM0NCZFljQ2hETW1iMlJoZ2R1UHhFWE1Qb3hQWUFNZmdXMzdFcERv?=
 =?utf-8?B?emw1L250VXZnd0ZDN3FVZTNwYzZjSXlmVGVSLzJON3pFQkNuTUJ6cTdXeTE0?=
 =?utf-8?B?WkhmNFFPb2dLR2ZlbUlSSXlZY3hkOU9JakJkZ0JHMFlUT2FLbnpVTnhodGNC?=
 =?utf-8?B?Y3JSQUlzQUo4QklkQWRPSGNoem9FcWRsaDk3ODdQNlZvMjM1Wk4xeXhwRzA0?=
 =?utf-8?B?VFRhYlYyR01kSkE0NVJ2WGJwUy9ibnpIK1NIY1d3Mmc1aUltMkwvQTZKUVEz?=
 =?utf-8?B?b0RhY2dzU1hBaCtlVStidkR2TjAxVTlNbFhSN3FTRVJCYjlQWFV4RzJTbEJz?=
 =?utf-8?B?RVF3NDJHMVdzRVVPV1BEUjhwbTRhQ1MzakkzekV5YzlhRERsemdDN21HakE4?=
 =?utf-8?B?Tm5jTWdvTzhzY3VYRlU2ZXVIc2hNZDRqazFialU0RlJhSXMwdWpRV1k0Rm13?=
 =?utf-8?B?SXR4K3cxM3BOVlNSbWwxOXdPdndkQVA4d3hseDdyenBGU1NyUDRQNklnRkxv?=
 =?utf-8?B?MnNzOVJkMXhZOVFpOFhpYjFydmRQclpTbGkwd1NrRkY4cStiSGZEeFliTWdQ?=
 =?utf-8?B?blBOVTRHd010d0g2RWFvNktsaVlHMWlCK2FMclB3emx2elp2Q1ZPM09wOGlj?=
 =?utf-8?B?TVdqMmF2ZU5PM1NJc29Bb2VpK3N5NHRXTmtEdXU4RW12VUZKelQvTW9wR3ZM?=
 =?utf-8?B?MGRGL2YvQy9pWUlnTGw5TnV5NysxQnF5eFJjcEVpRERQbTcyb2FFa01mNzBj?=
 =?utf-8?B?bGozRTZlMWNrN2VxYTBSN1daUnNreVVER0pmUUc2UTZVOStVY2NpS2lWQUlQ?=
 =?utf-8?B?Ni9hVXk2a280eWhFakpndm00UWRBTHJtbms5aWE0bndRMTMwbzNKUTRZTk80?=
 =?utf-8?B?K0ZNZUc2WE1aNU40Sm1SbVZBbVYvZ3h2ZGViNDdTUkE1VVFKSEd2ODE5bVBH?=
 =?utf-8?B?ckV4MW84M1RCU3lPeEVtTVRlS0tQUXdNcG9JVE5rUzQzKzlCTVJnVWNBK29a?=
 =?utf-8?B?ekZERlVCalpyeUEzaDVPZEdwZkRUUmYvUSt2N2VEczhoNmtGbytYaW01VkZU?=
 =?utf-8?B?T0hLQjFKODQ3Z2RJYUU4ODhqbnlVMkNnWFc3RjVxVjBMa2M0dG9ZelNGTTVt?=
 =?utf-8?B?TjJWamhTR09WM2tYZFhZd2oyN2hmWFZjU0V0aTJYaVVvNTkwRDRWSmdLbUxK?=
 =?utf-8?B?V254emJyQktUYTY2STNFemN0dTg1RlZqK210VmpQcmYza0xEejhUdHhwb0Vo?=
 =?utf-8?B?dFFxZXJPNDZXc3FsTGRJNWw4T093MXRQVzRFc2tVRkJOK2laRkJ2YXh0Zmhm?=
 =?utf-8?Q?foT+g4iCpEwPgOv9Ceee4fk0E?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/jnhhzZyvmN2taGJYX/tqcEFJNc9I3PbSv5CllKBE5KxswSLG3Ktwu5CmT20BLVKbKVJHEkF8OiJLJqStr0uTxm17lv/bgiWzqX0pgpAOyzRHIMYpvJcx5dbVYhr10Hqg6jXAqjzy2svDQO0fodV6vQjE/KRNvEZj030o+1cVxbeCVh8N74Zp1JfFAxa7PG+IEjwQjrxzP86dkU4Lg8QYFCgt13um7N/nzDv72OBuVQnrTT86loeo3Gi79zXHQal3aQTlcdzBzR6rL6coJ+B8xLhn3ELeSe4sOjCslTI1JEHWWek/ODCDNcrxQtd+k5N/jv2+kBVfg7x3/rfU7sTYydoWx5tHgv4H33g5MOTAm7Wg6S0/RlH+NKN3NyFsrODU3wAV0TiEMZzXDP/SaNO0LN3d3FYOSWjMWq/l/lQLsAE17NmGoG2cPV6PBMXL25yCAxhWWKqYFQyva0TSphhq/9l7ZIifJD0Drfnfooo1Sz8XHwKa4SyekXUi7Lnqa/zeXwjrpqopFOsEneflu0AdpxY71SObBChtu8rHTV9grJ1CCNvKO+5n/qVyYIOrH3vRmoMcd0Zb8lLMp0Lcr7GQgSxn9aSvlM/1tTBjPWIkIfTm0P5JOLiOw1eDNNHRRK9Wt3OMH6I/j/5HtpeVRgZT/pT4qOMmnTEZgeE6j6AJPYPizNGHrbhYdG9/zmAcsyWHFyqwHv8+F1BCOlVj5PYHojYC9CQgrClFRcfrPBgZQKcxWRoThPqVpWbnRH/gRQuRMav7zNpOS7kPmnCTSIGxmW7Hy8v93ugxs0N/qLih0dofOFrgnaXXc5kB5DyYOjW
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad8d85c-1a78-41e3-9124-08db41abf99a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 14:31:49.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHZXM2fMOMKRwN7OckFoyJ0rBUkQgAil7GAzSrbCMHAMolQ4oAwkPIOaZXq41eFySFv2lYqgAYDdx9zd2H6czQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6393

On Thu, Apr 20, 2023 at 10:31:08AM +0200, Jan Beulich wrote:
> On 19.04.2023 17:55, Roger Pau Monné wrote:
> > On Wed, Apr 19, 2023 at 03:58:10PM +0200, Jan Beulich wrote:
> >> @@ -1342,6 +1349,17 @@ unsigned int rtc_guest_read(unsigned int
> >>           * underlying hardware would permit doing so.
> >>           */
> >>          data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
> >> +
> >> +        /*
> >> +         * When there's (supposedly) no RTC/CMOS, we don't intercept the other
> >> +         * ports. While reading the index register isn't normally possible,
> >> +         * play safe and return back whatever can be read (just in case a value
> >> +         * written through an alias would be attempted to be read back here).
> >> +         */
> >> +        if ( port == RTC_PORT(0) &&
> >> +             (acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
> >> +             ioports_access_permitted(currd, port, port) )
> >> +            data = inb(port) & 0x7f;
> > 
> > Do we really need to mask the high bit here?  We don't allow setting
> > that bit in the first place.
> 
> I think it's more consistent to mask it off, specifically with the code
> visible in context right above the insertion. The doc isn't really clear
> about readability of that bit: On one hand in says R/W for port 0x70 in
> the NMI_EN section, yet otoh in the RTC section it says "Note that port
> 70h is not directly readable. The only way to read this register is
> through Alt Access mode." (I think the NMI_EN section is more trustworthy,
> but still.) Plus if we were to ever make use of the NMI disable, we
> wouldn't want Dom0 see the bit set.

I guess so, at the end Xen itself doesn't use the bit so far.  Maybe
at some point we would want to expose the value of the bit to dom0 if
Xen starts using it (most than anything for informative purposes if
NMIs are disabled).

Feel free to fold the diff to the existing patch and keep the RB.

I guess you will also add something to the commit message about the
special handling of the NMI enable bit even when the RTC/CMOS is not
present?

Thanks, Roger.

