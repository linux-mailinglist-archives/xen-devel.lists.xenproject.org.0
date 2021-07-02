Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2A3BA2D2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 17:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149202.275842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLCb-0001Ew-PL; Fri, 02 Jul 2021 15:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149202.275842; Fri, 02 Jul 2021 15:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLCb-0001CU-Lw; Fri, 02 Jul 2021 15:35:37 +0000
Received: by outflank-mailman (input) for mailman id 149202;
 Fri, 02 Jul 2021 15:35:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lzLCa-0001CM-5b
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 15:35:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d895ea47-b7af-43a3-9b5e-ec75117c23c0;
 Fri, 02 Jul 2021 15:35:34 +0000 (UTC)
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
X-Inumbo-ID: d895ea47-b7af-43a3-9b5e-ec75117c23c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625240134;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xdt+eIuEGaCpuykJfuYIIg+7Kj59yE98PXgv392ZAJ4=;
  b=MMM+nvbCw1QUlqwLL7AZVSO47YoTB7aWGrFo1QWuBXnx9Wy007CBa08f
   Zk+nk+Iutq7Fp4DrIfr2+ZPQY2HFRhzUDIZ43HRWNFI9FODwnla1V/f2S
   m99Zev3R4vhbD8qUFwqgdRFjEP/VuHTbeDxyMkYjowY5tEEEfh9oUE6CR
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1/29cVpA2oXfCqfhtd/WEHdvrfxhXutm1y+HlRoIXACK/EO2+3KcUcNdpPAms/wzbk2ug9d/J/
 n4yFqdpU3WPS/Oxyd9fi0yjPntSwQP5tSifzZfMyBX5qgg5GAdSt9GutOJ1U/9MLZWbHP6+Wfi
 Gq4i8cLgqHr8fHZht86ON5hmVzZreB+zUUBdqGv9uv6DTtRUPK/eMvtSMJY8r8LNGQS/L2BLfY
 WP7wQZMNAElKazjjBmTPqZyexYpCOwFO/abyAl0OA62YsCRD5J3b+E0n0NXm32y/ZQBdeR0ER/
 vtY=
X-SBRS: 5.1
X-MesageID: 47540000
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Z4Ksh6Ajwsk9XYDlHemF55DYdb4zR+YMi2TDgXoBMSC9Ffbo8/
 xG/c5rsCMd6l4qMk3I/OrsBEDuex/hHPJOjrX5Xo3SPjUO2lHJEGg41/qa/9SIIUSXndK1s5
 0PT0EUMqySMbEVt6fHCKbTKada/DEqmprY4ts3bh1WPGdXV50=
X-IronPort-AV: E=Sophos;i="5.83,317,1616472000"; 
   d="scan'208";a="47540000"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fO1w+OdEBMESOjluxe2el3EnkiK/tK7r+REyQiaMPDQMZGnRLn8C4fmTGlP8MGuZe2iQSEDBLidJgBuJCgivIYvY261rfaXoCXbBb2a4yh8uY2hzzwCq9LW5U4kI+FUz//PSqmq98ZUFTojAzfW4XEPm0H72QonXcMcsvU+u3I1qctiIbBvIvPoY9iQCt67IFRLTvaVaX1jw/TRu3heCtipt77qenW4z6xd85TTCGH+NY8iddmVT2AwgB4/MG/alX42UX1jpE28BNL2nZD/rz4Mi01q4edAoow6foL+egxzgYGcVIzlnMqgYBFQUn//3f5mr/YX06GqsocxobB0zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tpf0x1XJffsQgLTaKqZ/nNiSJRvmEJFmmAdpmrR+uYQ=;
 b=L5XeoRmSfYxio5XBrtX4aWFBnazWWcphZVtdtc7kSLsyghQZZoD5oCpjRoEDDCnsn0BaHNOxmSQ5/5KH9kHu66W9ro/TVMNtZxjtiGSKJvrJb2QxsfUXJyXay3mE6i8xR8habWStaL9S/egqepV8qMF9ZPlAaqCOzlGc9jW1Z+7K/ro1PWDDj5ByPvSqR4RYonML8JZuJpQ5nlhvl6ppEEuvZOPJ3CLVjgxL3wamtH21UnOEswxVXb7qGoK0Hsyd0OkK5gZy1tsULV3n/hcyOnFVcV5jJWc7VrxDLwC2WsDISQnjiDVQijSHYZoD7wmeib+ZdVLoiB05je1ioIes8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tpf0x1XJffsQgLTaKqZ/nNiSJRvmEJFmmAdpmrR+uYQ=;
 b=BXjP2bjCbLgUaGqjfIheUjLWLiTuoOFRyKLmH4glYmYco+GxjIOu4D+fWJuxIRwqB1gsVYz2J8iP+xej15t+8DPn89hp9u/DoL2pAMstGlRd9rQ5YoGFvt2Ye96OWp9O1YAXZYmkr2Pwpvs4R4aQ0vqnldghEH1jxsVBpNDH+LI=
Subject: Re: [PATCH v20210701 05/40] tools: handle libxl__physmap_info.name
 properly in convert-legacy-stream
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-6-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c05bb29b-4a32-fc56-9493-62836f3dcd3d@citrix.com>
Date: Fri, 2 Jul 2021 16:35:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-6-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0319.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f41efe5a-6d21-4e95-7b55-08d93d6f06a6
X-MS-TrafficTypeDiagnostic: BY5PR03MB4998:
X-Microsoft-Antispam-PRVS: <BY5PR03MB49981702F8D00D5AC47EB78DBA1F9@BY5PR03MB4998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z71qIZGWFFJupdhXFnQrbT+gf5F4xmmck7OHjzPdLZBU2Yb8GR0jOBk39TKuTA+WtAhbwJhC0oSZnVM6duP76mpydoWSAKsk5GfxUMdy7+n3dU+/h1j14ifMMe1yRlQ6bvR2A8de/JLnp7z0w8nWLPR9/WSQaDsNahyPFwrRVvumWdA3accvuVg/Rts0fQ/OlCmEh8KLlX4CLZ/TkzG9zg9lBvM0hipGjeiO5iurmw+XXNCvjTFrcXVxSZpqUPq6aXhVfqJdQ/B/EDdpQass8HWmXaHZxWUMas2abdkgnFThPuEcxMbFkbbNsSZF4zUsfBdL7R+VvbJA0eVN1VphW3+r/GTc10IPzupvsFlaQZ1Y3k59rbdK+PUdLtCF2G8DwRH2GN+zEC+WaqojOxgKgGoJlFNhpfv3wc8S7WF5dbuGjJweQct0nM3M+VOn91hNqNhbPoHvYppB9sg2G30liP2pDe34RE2Z7FSd9qlxqfZX1Je5UWLu4FtyfHm0qeUn1gCKPXiTTf6C9VWmrjexYIb/jBpmtT2vVHv+k3qT82/eHokaR8OsH/Ux/eFi9UmUTN8HSJLCBg8lvI6yZhe6pGLAUpnJNyWY0q9Ot2wR7Um6d5qj798EjIz5YjE5sqpp2kcY+EH/4a+xtSCNzdxMK/uyyVTPaYH9NT0FaWfL82tchTzNUrt3jhJQFE+5aI93zzsQLp650uosqHZGwnJCDQGaRbwx+k1isc2Vc4MuIEx0lAJCsITeB1dfF72eojFaOdVC1BTz+PBV2+bI9jK2+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(8676002)(26005)(186003)(6486002)(16526019)(5660300002)(86362001)(53546011)(31686004)(36756003)(66556008)(956004)(31696002)(4326008)(2906002)(54906003)(66946007)(8936002)(2616005)(316002)(16576012)(478600001)(38100700002)(6666004)(66476007)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUhPdUVqMnNySzdsMkpPYWFELy9rMXZjMzVpZk1SS1puK3Y2bkp2a3Z5SWNr?=
 =?utf-8?B?NXRJbFBwaGJoWlRwb3ZJY3lIRG1KY09taTQxcUsyZHkxekMwalVyeGQwTnU0?=
 =?utf-8?B?MWd6c2ZGejBOUnpTT1l2aEttdHB4d2RFVDY1WUxOOVF1SngxWjBTZkkvTStL?=
 =?utf-8?B?V3Flak16K1ZrNUhWdmthS1VDRW11MEd3K1VMM1JJTUQxRklQVXg0ZW1HQ1BY?=
 =?utf-8?B?S1owSUd2QzRYU1hIV1ZEWUxTYXVOdGFiTEZ3eldCWVhMZ1JnVnBkMjBQYjNP?=
 =?utf-8?B?MjFRZ2VRUHQ3RE1wQ3grQ250WVMrVExqdGloZ3pMV1RoR0ZSVEMrOWN0N1BC?=
 =?utf-8?B?N2ZwNjZSN0REY283NkFMU01zdGNzWHBpSktRcVBSWWlFNEp3SVoxNWNOSmt6?=
 =?utf-8?B?dk5Ra0Z4QnNxT3lETEl0WUM3KzZrUFl5cGd3S09mYk1kYTFVc0VrT0dvTWY4?=
 =?utf-8?B?OHR6bE5ESzJzbmxJY2JadHFpMnFRVEVFd1pZTjd6cVB2RFhXOUVUV2NtdEVM?=
 =?utf-8?B?enhYcTRHNFVQSVkwRG91NkpYU2EvNUsyNlA0amd2THBGdkJIUHAwVktPVDlT?=
 =?utf-8?B?eC93dWl4cHZqYzdQMW5Dd0E3amZWVXBtT01kbHBmU01INjZhaEQzQmk0a0Nl?=
 =?utf-8?B?SmFQR1RWdWVjcEFFOWFpZGxNOUtvbXRCWVZNcXNQeVZOUVhsZ1lPbnFOdG1Q?=
 =?utf-8?B?WUVvMG9NLzBtZkFDZjl0aEVQam83QmlLblNLcDl2RUphQW02TjVwdXJwWnls?=
 =?utf-8?B?bmFPYUxYb0RDZzhuYWI1TCs4UEE5SW9ZVXlhK3BJZWxBNS9QVGtBcWt1cU1x?=
 =?utf-8?B?d3pISGF6SjMzWnl3TlVGZk9ON1lVTm9yalR0dUJCS1Nxd0VMaEE2TEFQNWtl?=
 =?utf-8?B?Wjd5Qm4yMVRYeU1rNW9sMzNUS0FLR2ROMU5YZCtpMWREdSs1eHlNSFJTNzVQ?=
 =?utf-8?B?Q1lFY0lOR0Q4SkNVNDVVTTVRbk5sOFk2M2NMMjBHRnY3OVI4UkVDRlBtYTVl?=
 =?utf-8?B?YVRnUXlkTzAvQjQya0JjQVNnLzNNd2daL2E0SUVvSGZodHk2bWs1a3FySG1a?=
 =?utf-8?B?MGhsNXhWd0FUNWYzeEpHV1ppcUMvV2JOMUFvREVna3ZEa0ZLdng1SnkwWVBR?=
 =?utf-8?B?a25ySlFNeFhkRW5USDJENURyQ21NZTNLSXhFWEFCNlN5cXFGcXY4OVFzTnVI?=
 =?utf-8?B?YzU3VTlrVnJxaGdjU0JOZWNFOSt3YUV5dXd5a1QvVytPZVYyTmhMQWllYkor?=
 =?utf-8?B?MmR6SjY2NCtXTmkrY1Vra0pacUtjb2J2blNsSnE2eGNMUHRGdlRMeC9xYU9u?=
 =?utf-8?B?b3IwOFlZY0VDeVF0My9PdlRjYUYrV0JCaUhaSzY4ZnppdXpuSytYZkQ2VDY5?=
 =?utf-8?B?dFJOVVlkeFdoS00wMVVNNkdqOVZMcFM5d054WlVPVGRQZkFOdUZTVVcycGRR?=
 =?utf-8?B?TWRWckRJdmRhUzg2L2l2MTFUNXM5MzFaNVdmUE5zWWpneCtwYUcyMnNNNGVS?=
 =?utf-8?B?RDhvNXFaSGpYQWZkZ3pMRFc1VWhseWJGdUliSFNCNkxFUWx4VGhDUE03MEJO?=
 =?utf-8?B?Nko0UlBXMG16L2wrYVpydW5JRzdZNU1hbHdnRU8vQ1AzbVNBOExjNmxkdnBz?=
 =?utf-8?B?aW1sR0JZZlBQOGpob3I1QVBpdXgxN0VPUG1lNTl5SGNKWVlvUXVzUm9CYzg2?=
 =?utf-8?B?T3p6cXBoVjN3b1YzNEVFektRNFNTNDB6MWh5RmtZbXI3VXo1Vm5xVkF1S3lL?=
 =?utf-8?Q?ZKWyJApmnRCrHqi0KfiNIGLXk7EP1Tr3gpZK2O9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f41efe5a-6d21-4e95-7b55-08d93d6f06a6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 15:35:31.4092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cn7BI7VlOyQ5YyUgCnDGlN6zSsjgMXRQ5WNmQ832ZjXvB3DCllUDT2KFoZqERwELST5hxCEpU2zVPDAZ8pCihD3uexyUZwfmjzR5ZgZc9Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4998
X-OriginatorOrg: citrix.com

On 01/07/2021 10:56, Olaf Hering wrote:
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
> index 66ee3d2f5d..9003ac4f6d 100755
> --- a/tools/python/scripts/convert-legacy-stream
> +++ b/tools/python/scripts/convert-legacy-stream
> @@ -336,20 +336,21 @@ def read_libxl_toolstack(vm, data):
>          if len(data) < namelen:
>              raise StreamError("Remaining data too short for physmap name")
>  
> -        name = data[:namelen]
> +        c_string = data[:namelen]
>          data = data[namelen:]
>  
>          # Strip padding off the end of name
>          if twidth == 64:
> -            name = name[:-4]
> +            c_string = c_string[:-4]
>  
> -        if name[-1] != b'\x00':
> +        name, nil = unpack("={0}sB".format(len(c_string) - 1), c_string)

This is rather invasive.  How about simply:

diff --git a/tools/python/scripts/convert-legacy-stream
b/tools/python/scripts/convert-legacy-stream
index ca93a93848ec..d4ae94c02f21 100755
--- a/tools/python/scripts/convert-legacy-stream
+++ b/tools/python/scripts/convert-legacy-stream
@@ -342,7 +342,7 @@ def read_libxl_toolstack(vm, data):
         if twidth == 64:
             name = name[:-4]
 
-        if name[-1] != b'\x00':
+        if bytearray(name)[-1] != 0:
             raise StreamError("physmap name not NUL terminated")
 
         root = b"physmap/%x" % (phys, )

which is rather more contained, and looks to work from Py2.6 and later?

~Andrew

