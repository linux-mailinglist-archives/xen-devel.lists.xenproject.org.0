Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367924DC58A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 13:08:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291530.494854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUouv-0000QO-5W; Thu, 17 Mar 2022 12:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291530.494854; Thu, 17 Mar 2022 12:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUouv-0000OZ-2V; Thu, 17 Mar 2022 12:07:45 +0000
Received: by outflank-mailman (input) for mailman id 291530;
 Thu, 17 Mar 2022 12:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAZZ=T4=citrix.com=prvs=068f51ced=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUout-0000OQ-4z
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 12:07:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e5c9fc-a5ea-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 13:07:41 +0100 (CET)
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
X-Inumbo-ID: d6e5c9fc-a5ea-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647518860;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EXv4usRYqcaqAZxKX8YAvDHrpqxWLQOIIfxnj2uQt9k=;
  b=EuUkb/a1afHfXdjM1yDOFBcnJYGWhFS4Ogcqb6D2tUPdjH2ft+m6DQ2P
   H6uDFjzhQrluJkDDMOPVPYaoJSkHT2Wb2r2xci+KhUaEWEPRRbopikSB4
   GTENz44bVjCeLglXnAcWrDjQSYOThE6lRl57Oukim4cclY8UUesQrXJg4
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66489135
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iA7l5KzcWo/zquqpvcR6t+f+xirEfRIJ4+MujC+fZmUNrF6WrkUHn
 WRLWj3Ta/nbZ2GnfN93Ptji9UxXsZLRyddgSQU4pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplvLC0Sh4YeaHwxOkZDEZfEy5TNr1DweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ZZJOGM0MXwsZTVgGmU2JrMwgN6xpVbEfx4Jq1+Mj/Y4tj27IAtZj+G2bYu9lsaxbcBWg26Ro
 2vU+GK/DhxyHNmHzjqB+3mvrubKlDH8XsQeGdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xCm8JRDNFQNUjvd0xQ3om2
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqbAMAThI0pNXf/Iw30U3ITtlOG76wt4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVd0IiN2dDB0wWirhRdMPS
 BWP0e+2zMUPVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgz+xzRd1y/9nZ
 srznSOQ4ZAyU/gPIN2eHbt17FPW7npmmTO7qW7TknxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Di9vmra8WnOnO/2ddKdTgidCFnbbir+50/XrPSeWJORTB+Y8I9NJt8IuSJaYwOzbyWl
 px8M2cFoGfCaYrvclzbNCo8NOuxAf6SbxsTZEQRALph4FB6Ca6H56YDbZonO74h8e1o1/lvS
 PcZPc6HB5xypv7vpFzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:/8qNeq4rPRYwP1rRtQPXwWiBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJE3Jmbi7Sc29qeu1z+863WBjB8bcYOCAghroEGgC1/qs/9SEIUzDH4FmpN
 9dmsRFeb/N5B1B/LvHCWqDYpYdKbu8gduVbI7lph8HJ2wLGsJdBkVCe3ym+yVNNVN77PECZf
 2hD7981kOdkAMsH6KG7xc+Lo3+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10DDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/gzd4dvfrWrCou
 O85CvIDP4DrU85uVvF+CcF7jOQlArGLUWSkWNwz0GT+vARDwhKdfapzbgpAycxrXBQ4e2UmZ
 g7rF5w/fBsfGP9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQlo+bo7bWrHAbocYa
 JT5QDnlYFrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd4AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlayXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wl9iif3ekOhlTRfsufDcTYciFdryKJmYRqPvHm
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66489135"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+Ww4V5+22+yXyoeRsmBflqH8u7mrhfu7bIQTAMGzHpFfxgkBY9TJcOXWDtSxCBSfqtrxL5cGpQN+xhLmn2pdTxr8vDzwTm/q0uev92brjW2iIiptuCzhtn0oCwW5aCKFhzKnk8Nb4nrr2SFs6vPVxSFKCqvOkMUmTO4W2c7aaJVkg1rIPctMwPISp2RdWArxi7ucJEhd18no4jc9J97/BgQcHPu/Wa/TPdg/gKCcZUYoSPCM1ahlBepz9qr4N3peZLqE47bxaDmf4S9LF3mLvOcN5RN0jCbb0BPBW882D94JfG/STFUekzNCqkG++PJK8yUniXA+5haKwz234rFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXv4usRYqcaqAZxKX8YAvDHrpqxWLQOIIfxnj2uQt9k=;
 b=n+UcPUI3X6IQv9PnlHNYdocg9uk2hrsdUGHBl59rH667kNvF3m7bgteNU9CucrpMel8tAa0efCnQyu3xo1nIEzqQaXozemdhKaK8dF9gVW/51mWlOH3ft717eHd2Gj+FQpDnxTUfL5UQdGd8Y9vJ9QhfASllr6s6OhbSDZSO/Fn2yV54tK/URQAZBSepzTl/7IpYTtD1nzZHY3QIGLyPCQ0h/D6NWMMvb02LZ5n8QuUytEU77wvCCvOQFvjIWIqx9YnGr+TwOP28w9dH5gDlHHXIk3Tiui7J5PN1dZxq/148+h9E/mvAIB5Pxd6qUhe+mMxgcGH7Qk8Pc7QTE4Q9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXv4usRYqcaqAZxKX8YAvDHrpqxWLQOIIfxnj2uQt9k=;
 b=Xo0XxjpV/XWagX9yxuixMknjY/VqPl2hyAQdFiOwPC5Gv2ldjLF9h3iPRkosWycy08drAXIpiTVdv5xxkJL8YzVTq/2P9G3UBc7DSr1SqKU9JPPXGYZcer+vRenLRl6dS/e+r28DG/qnGsRV66uYdSsIZ5MW9poz1dPiWTFiIR8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Bjoern
 Doebel" <doebel@amazon.de>, Michael Kurth <mku@amazon.de>, Martin Pohlack
	<mpohlack@amazon.de>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Topic: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Index: AQHYOeYhM19FRsX4fEqZ0g9opW1q5KzDY8oAgAAXkYA=
Date: Thu, 17 Mar 2022 12:07:31 +0000
Message-ID: <9555a8ef-6b44-9a39-78ca-f6bb4fc4528a@citrix.com>
References: <20220317100204.16391-1-andrew.cooper3@citrix.com>
 <db1e9af9-5441-c035-1998-33be07f6e908@suse.com>
In-Reply-To: <db1e9af9-5441-c035-1998-33be07f6e908@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54591821-401d-4758-5cb1-08da080eb6e7
x-ms-traffictypediagnostic: BN3PR03MB2195:EE_
x-microsoft-antispam-prvs: <BN3PR03MB2195779BC5265337B3F863F8BA129@BN3PR03MB2195.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K+6WbMgQQBlumpTVLeW8AJNMtUcj94nZJDqlFnYUmIcT+OMwj9RkNsfiF2QXHwvtWa9PQKsAs1845SYlF9lfPN6LeRZAA1zlZHTOd1ZDUvGSX/W9I3OeCsbOtjFmyx97Kv9nAxuhf6uDNoN0zwKUum4aqXHLTXnRrmxCKl1QZH/vPRT7aZfyFsOD4cql514EL55LFuFsvx0UzUDzVvZoW8L3AqZaKHSdRT3vNLfGNXkFPqOODwhxjIImvWOmv+BJTKu0RORVJl8l7Ad2vEtF+ddzMTpvw2tnYH7F5tZBvAP04eudSZ9RplD52zqB1kEdhoBWz149uKtdJkWvtWdv+jSNrZdThQHBCpwqJoDqa45UwSlSEy01NBhJIN2t2kfMBDw9C8giBUzT+jjJ0sMUI4C7h7BIiPdqJUgtc/P9Gf1H0ttTUL/K7pM1yOyUBH5o+BD/tkxCPjFqeGd0xZ1Jx7jVHcmUzyeMeatPn/P08JmWGWnnqHeDV8lMdBBVu8vNd5boB78Zn384nTKCxTtgIjpG1o3z3/qdyIA1OCL7YsovX00dRd5u9zRb/WH5+XBC+eJVkcox+50MqfaSkENX+ssaZVXo/YHZVBv1/1z0lUnrFbQZuAKGYnrto1LzVVFQoKI+Nf4YUP8BQ+KtCYBLWoMqaLuV6WASoPxS3wQRV3g8doAcJE4n7xiabLxsfasKJUY6gL0wuyt2bJqopwKxY3EaLBFFQ1nhC3xz69TF5MLSiLe+3s9ELkl9xacX/m7Ty8ITpXEArbArBh3FKhzdRjL/sGjPeWHlXZkvyMiwC92KgprXMMQsR0/DPxbzHqbxtcreI9u53/5aQ5prBeuVfCGZWuSiJCELaIHLdvC2uZs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(122000001)(6506007)(82960400001)(53546011)(31696002)(38070700005)(91956017)(4326008)(8676002)(64756008)(76116006)(66446008)(66476007)(66556008)(66946007)(83380400001)(38100700002)(6916009)(54906003)(6512007)(316002)(26005)(186003)(966005)(2906002)(6486002)(508600001)(71200400001)(2616005)(8936002)(36756003)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejZCTTllNzdPaDFlNldTNlBmN05iVXFPVDkzdGpMUHRndm1pakVMSzdnZzNQ?=
 =?utf-8?B?blFwSGs4L3h1cndmc0hTNjNOSDN0dEQ4enFSYW83b2FPVXdlSUN3MERyaURn?=
 =?utf-8?B?aGNiNWZ6bUlBK085Tng1SlNZc0x3REt0Z2JLeHI2ZnJ3c0poRkQ3Z3JweDZD?=
 =?utf-8?B?WndyQlM0RnB4R1FFc25BUitET0JxS09PYWhBVnJZTi93Zm41NGpMTUtzVDdt?=
 =?utf-8?B?VEREZFB4RURvcDRUbEw3RTUzbjdsaFRtaHBWa1VvWStyS2RoYnIvZkZBWmZL?=
 =?utf-8?B?bEZGQW1vQkE4Z0hmWTlndlVtYms1NmFqWHI3SFk3Q2I0aWJNRHJOUjljRWZl?=
 =?utf-8?B?cy9jUW0rWHhOZDJuRjlIMzI2TFpTeEdNcEk1UDJ5ZG5xY3hjbWczaUJIWTBz?=
 =?utf-8?B?UkdTTGQzU1ljSzFPbnA0OVZCeitnaEt0dm9nd3RHNHdBeFViUWFqM2NrUzEz?=
 =?utf-8?B?WGtMMjR2NmxpWHJpL2JQeGR0aDI2aVJLN0dIWnZ6ZTRHRHVkQU1ZMTdxVnRw?=
 =?utf-8?B?OTBJL3ZlMzdQMnpsN1d0TTlPYVlUVnhHSWZxS054MjVRdytmU3d5c0xYd2F5?=
 =?utf-8?B?aGRXK2IxdytVR09IR2JDM0RRVjlNRzV1M1ZGWkFNZU5qWmJqOEdpUjVKSnZw?=
 =?utf-8?B?U09XenRoQ1hhVG1BMTRaVUliYi9OTGtUakxwclZoTFYyQ2ZLcUVveVl1QzN5?=
 =?utf-8?B?Tkt1Z2svRmJNL2s2R1JCNE1tZjRrc0NSb0QybUFQQXZ2TzlBczFWNVkyVWVS?=
 =?utf-8?B?KytJZHZhOWVqSFBZZUF5OG9aRHE4YWFnK0lRZk5mV0tqb2FWZGtIUkZCcDhW?=
 =?utf-8?B?OCtCRzh1ZHM3TVJMb2RHSm16bnNIZjFSdmlBUnRudFBBVlBybEcrakJPMnNZ?=
 =?utf-8?B?VDIzeVRMNUQzTFNNYVdGTGRNNUJ0OXVKRWEza1dJS1AxdjFVNDUxb3JIeVlW?=
 =?utf-8?B?dGtnazVCNW5saGh4R29yS1Z4NEJYQVYxK1BoQmxDUkRYbFJMN1o3Si96dS9Q?=
 =?utf-8?B?eDlqYUpSRnhqemxmVlRuR3d4aWNBQi8zMjA3eXN5eVdrbzdBMHM5eittY2FB?=
 =?utf-8?B?YnZMUHVOTEFTUXFpb215VTUyelJ6Rmp1VmRkOHJta2dVQ241Ulo5M2xQR2dy?=
 =?utf-8?B?T09OdVhkVVN5d2Jsb2Y5THNudzNMSVZBdG14MnRYRVhJZ2FCaUJjVU1TSlht?=
 =?utf-8?B?ekg2STFFQzAybSs3cU1jQWN6R21aQ3hwd0VkQ0EvWUE2ZlFCVHBMZ3NTYUg2?=
 =?utf-8?B?TnhqUmY1b3pTOFFyK2E0M3FEa3FMQXAxMHVLcjlOOHBIZEVaaEt3djlYYlJp?=
 =?utf-8?B?ZHV5b3F5ajhpeVZ6cHBnYUhCZlRORFkrMmZ0WU1HUjBBb2kyb1FDUG9Xckpj?=
 =?utf-8?B?QXhieFkzMTZYSnZpV3dTWmdLYWQwZGFEUk9oWU9XS3Q5NVg4aGNzbEk4UGVs?=
 =?utf-8?B?ZG5WMWlydmx6NlhhTWRRTE9ldWxNQjU0YTFBS0UzMDNBWmFXUyt0YVo2QUdJ?=
 =?utf-8?B?cSt4SDRkU1R4UzUxRUhQZng0MkVPMXN3S1lTSkxMWU9mUjhPSzA5S3l0Zm5Z?=
 =?utf-8?B?M0puUGFSZU1vVFI0cm11NzdIRy9mOGZ6RUZKK2xtcDhtcXZWZFI0V0lEUE9U?=
 =?utf-8?B?YUxIUER0cWFHUW9lWEk5b2lsd0swTm1VMlRKb2VQQnZKQjJOT3k4cTluSVNV?=
 =?utf-8?B?Y0V2anRBUDNDS0hPY01kVitzdzVhb1JFZHNLc1NpclJOeXpPbnMxTFhpbWlQ?=
 =?utf-8?B?RjVlTHVrQ3o1MzVaREJ6NkMwY3UwN0Y5dng1MVZ2bU90bTBxN2VhL0JSbU9o?=
 =?utf-8?B?dUZpcHIxVWtHTUdKWXdDNkN6VEROQjd6MlBTVXZVVVJZNmlxejZicTByaG1z?=
 =?utf-8?B?c3RQcDlqU281emp5NTN3WWw3VkxFUG0yNnRZYk1ZZ3ZubmNMc0pqNHJmZUxv?=
 =?utf-8?Q?qiXjTY5GQb5CFOF6GNd+VijpB/T0oX8s?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91A7DCA65CC2834383C30F6651EFF540@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54591821-401d-4758-5cb1-08da080eb6e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 12:07:31.6589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Hr1/+Uai0GnTEvsGY5ailJgaJ/sicBA2WQYaVsfpWOjAqNN/b8wk1bMOUjYtwEVtriUDaqtUfqejVCErW1TqR6FvinM0ZbMXmJiQ2mB/c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2195
X-OriginatorOrg: citrix.com

T24gMTcvMDMvMjAyMiAxMDo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjAzLjIwMjIg
MTE6MDIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBGb3IgbGl2ZXBhdGNoaW5nLCB3ZSBuZWVk
IHRvIGxvb2sgYXQgYSBwb3RlbnRpYWxseSBjbG9iYmVyZWQgZnVuY3Rpb24gYW5kDQo+PiBkZXRl
cm1pbmUgd2hldGhlciBpdCB1c2VkIHRvIGhhdmUgYW4gRU5EQlI2NCBpbnN0cnVjdGlvbi4NCj4+
DQo+PiBVc2UgYSBub24tZGVmYXVsdCA0LWJ5dGUgUDYgbG9uZyBub3AsIG5vdCBlbWl0dGVkIGJ5
IHRvb2xjaGFpbnMsIGFuZCBleHRlbmQNCj4+IGNoZWNrLWVuZGJyLnNoIHRvIGxvb2sgZm9yIGl0
Lg0KPj4NCj4+IFRoZSBjaG9pY2Ugb2Ygbm9wIGhhcyBzb21lIGNvbXBsaWNhdGVkIGNvbnNlcXVl
bmNlcy4gIG5vcHcgKCVyYXgpIGhhcyBhIE1vZFJNDQo+PiBieXRlIG9mIDAsIHdoaWNoIHRoZSBC
b3VybmUgY29tcGF0aWJsZSBzaGVsbHMgdW5jb25kaXRpb25hbGx5IHN0cmlwIGZyb20NCj4+IHBh
cmFtZXRlcnMsIG1lYW5pbmcgdGhhdCB3ZSBjYW4ndCBwYXNzIGl0IHRvIGBncmVwIC1hb2JgLg0K
PiBVcmdoLiBCdXQgYXMgcGVyIG15IGVhcmxpZXIgY29tbWVudHMgSSdtIGhhcHBpZXIgd2l0aCAu
Li4NCj4NCj4+IFRoZXJlZm9yZSwgdXNlIG5vcHcgKCVyY3gpIHNvIHRoZSBNb2RSTSBieXRlIGJl
Y29tZXMgMS4NCj4gLi4uIGEgbm9uLXplcm8gTW9kUi9NIGJ5dGUgYW55d2F5Lg0KPg0KPj4gVGhp
cyB0aGVuIGRlbW9uc3RyYXRlcyBhbm90aGVyIGJ1Zy4gIFVuZGVyIHBlcmwgcmVnZXhlcywgXDEg
dGhydSBcOSBhcmUNCj4+IHN1YnBhdHRlcm4gbWF0Y2hlcywgYW5kIG5vdCBvY3RhbCBlc2NhcGVz
LiAgU3dpdGNoIHRoZSBgZ3JlcCAtUGAgcnVuZXMgdG8gdXNlDQo+PiBoZXggZXNjYXBlcyBpbnN0
ZWFkLg0KPj4NCj4+IFRoZSBidWlsZCB0aW1lIGNoZWNrIHRoZW4gcmVxdWlyZXMgdGhhdCB0aGUg
ZW5kYnI2NCBwb2lzb24gaGF2ZSB0aGUgc2FtZQ0KPj4gdHJlYXRtZW50IGFzIGVuZGJyNjQgdG8g
YXZvaWQgcGxhY2luZyB0aGUgYnl0ZSBwYXR0ZXJuIGluIGltbWVkaWF0ZSBvcGVyYW5kcy4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPg0K
Pj4gSmFuOiBBcyB5b3UgaGFkIHRoZSBidWdneSBncmVwLCBjYW4geW91IHBsZWFzZSBjb25maXJt
IHRoYXQgaGV4IGVzY2FwZXMgd29yay4NCj4gKEJ1aWxkLSlUZXN0ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzLg0KDQo+DQo+IFdoZW4gd29ya2luZyBvdXQg
dGhlIHdvcmthcm91bmQsIEkgYWN0dWFsbHkgZGlkIHRlc3Qgd2l0aCBoZXgsIGJ1dA0KPiB0aGVu
IHN3aXRjaGVkIHRvIG9jdGFsIHRvIG1ha2UgZWFzaWx5IHZpc2libGUgdGhhdCB0aGUgdHdvIHBh
dHRlcm5zDQo+IGFjdHVhbGx5IG1hdGNoLiBJIGFsc28gZGlkIHdvbmRlciBhYm91dCBvY3RhbCBh
bmQgc3ViLXBhdHRlcm4NCj4gbWF0Y2hpbmcgY29uZmxpY3RpbmcsIGJ1dCB0aGUgZ3JlcCBJIHVz
ZWQgZGVmaW5pdGVseSBkaWRuJ3QgaGF2ZQ0KPiBhbiBpc3N1ZSB0aGVyZS4gSGVuY2UgSSBhc3N1
bWUgZ3JlcCBiZWhhdmlvciBjaGFuZ2VkIGF0IHNvbWUgcG9pbnQ7DQo+IEkgd29uZGVyIGhvdyB0
aGV5IG1lYW4gdG8gaGF2ZSBvY3RhbCBleHByZXNzZWQgbm93Lg0KDQokIExDX0FMTD1DIGdyZXAg
LWFvYlAgJ1wzNjNcMTdcMzZcMzcyfFwxNDZcMTdcMzdcMScgdGV4dC5iaW4NCmdyZXA6IHJlZmVy
ZW5jZSB0byBub24tZXhpc3RlbnQgc3VicGF0dGVybg0KDQo+IGh0dHBzOi8vcGVybGRvYy5wZXJs
Lm9yZy9wZXJscmUgc3BlY2lmaWNhbGx5IG91dGxpbmVzIGhvdyB0aGUNCj4gY29uZmxpY3QgaXMg
ZGVhbHQgd2l0aCAtIGFzc3VtaW5nIHlvdSBoYXZlIG9ic2VydmVkIGdyZXAgdG8gbWlzYmVoYXZl
LA0KPiBJIHdvbmRlciB3aGV0aGVyIHRoZXkndmUgYWNjdW11bGF0ZWQgYSBidWcuIChUaGUgZG9j
IGFsc28gbWFrZXMgY2xlYXINCj4gdGhhdCBzdWNoIHJlZmVyZW5jZXMgYXJlbid0IGxpbWl0ZWQg
dG8gc2luZ2xlIGRpZ2l0IG51bWJlcnM7IHlvdSBtYXkNCj4gd2FudCB0byBhZGp1c3QgeW91ciBk
ZXNjcmlwdGlvbiBpbiB0aGlzIHJlZ2FyZC4pDQoNClRoYXQgcGFydCBvZiB0aGUgZG9jIGRvZXMg
c2F5IHRoYXQgdGhlIGR5bmFtaWMgaW50ZXJwcmV0YXRpb24gaXMgb25seQ0KZm9yIFwxMCBhbmQg
aGlnaGVyLCBzbyBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBidWcuwqAgXDEgdXNlIHRvDQpleGNs
dXNpdmVseSBtZWFuIHRoZSBmaXJzdCBjYXB0dXJlIGdyb3VwLCBub3QgYW4gb2N0YWwgY2hhcmFj
dGVyLCBhbmQNCnRoaXMgYmVoYXZpb3VyIHJlbWFpbnMuDQoNCj4gRGVwZW5kaW5nIG9uIGhvdyBl
eGFjdGx5IHlvdXIgZ3JlcCBiZWhhdmVzLCBzd2l0Y2hpbmcgdG8gYWx3YXlzLXRocmVlLQ0KPiBk
aWdpdCBvY3RhbCBlc2NhcGVzIG1heSBiZSBhbiBhbHRlcm5hdGl2ZSB0byByZXRhaW4gdGhlIHBy
b3BlcnR5IG9mDQo+IG1ha2luZyBvYnZpb3VzIHRoZSBzaW1pbGFyaXR5IGJldHdlZW4gdGhlIHR3
byBwYXR0ZXJuIHJlcHJlc2VudGF0aW9ucy4NCg0KXDAxIGFuZCBcMDAxIGRvIGJvdGggd29yayBw
cm9wZXJseSwgYnV0IHRoZSBub24tYW1iaWd1b3VzIGZvcm1zIGFyZSBcbzENCm9yIFxvMDAxLg0K
DQpPdmVyYWxsLCBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIHN0YXkgd2l0aCB0aGUgaGV4IGVzY2Fw
ZXMsIGJlY2F1c2UNCnRoZXkncmUgYWxzbyBub24tYW1iaWd1b3VzLsKgIFRoZSBtaXggb2Ygb2N0
YWwgYW5kIGhleCBpcyBpcnJpdGF0aW5nLCBidXQNCnRoZSBjb21tZW50cyBhcmUgdmVyeSBjbGVh
ciBhYm91dCB3aGF0IHdlJ3JlIHNlYXJjaGluZyBmb3IuDQoNCg0KQW5kIG9uIHRoYXQgbm90ZSwg
SSByZWFsaXNlIHdlIGNhbiBhbHNvIHNjYW4gZm9yIGVuZGJyMzIgaW4gZXhhY3RseSB0aGUNCnNh
bWUgd2F5IGZvciBubyBleHRyYSBjb3N0LsKgIEknbGwgZm9sZCB0aGF0IGluIHRvbywgc2VlaW5n
IGFzIHRoZQ0KZGlzY3Vzc2lvbiBoYXMgY29tZSB1cCBiZWZvcmUsIGFuZCBwb3N0IGEgdjMuDQoN
Cn5BbmRyZXcNCg==

