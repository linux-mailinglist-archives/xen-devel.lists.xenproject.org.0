Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563784C8C42
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281413.479735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2E6-0005ap-0X; Tue, 01 Mar 2022 13:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281413.479735; Tue, 01 Mar 2022 13:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2E5-0005Xz-TM; Tue, 01 Mar 2022 13:07:37 +0000
Received: by outflank-mailman (input) for mailman id 281413;
 Tue, 01 Mar 2022 13:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP2E5-0005Xt-1r
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:07:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f00fcf1-9960-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 14:07:35 +0100 (CET)
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
X-Inumbo-ID: 8f00fcf1-9960-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646140055;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YJ+fCSm8D5VU+uZHrw75Nj2/sezhnaA0OYiRp42QpAc=;
  b=d+nv+zz17gZ6rF7NQ4C+dtEXeB07MEk2eK4M9o3eh5B/zM839YRdiFbv
   N5KgDplrIgkndFhqoXzIP3aJtruJAcWeJJmNI3SZ3Uyu0H/3QS995VJcf
   BHq6/AqVLFknA0S5lwM0JzqGbxJaCJYzj9pttr5cnoLoiwaO/UHWhCTjD
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64656946
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WFJ8Fa7UNWxHrQJ6/JVqugxRtCXHchMFZxGqfqrLsTDasY5as4F+v
 mRMXDyGaf3YMDGge993YISz/RtUv5/cy4RiSAdrrXsyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSNViczJ5bOm9gDVkFXExlYHpRJ3pr+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RFN2cxPUieC/FJEgkyS5IPw8T1ulLiNARdj2yYhbp03FGGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYDUUX1ampfiyimalRslSb
 UcT/0ITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS1R6t0LPv4QWlGG1cQT55Tv8fu+kTfGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDEtIji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpaIWCyP
 hOK4FoAjHO2AJdMRfUsC25WI553pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dVLfABScCNiXsieRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:IRqloqBq022owpLlHegCsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsuqKdkrNhQYtKOzOW9ldATbsSobcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj4Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSXGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZjzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUjZ1TChkF2nAic0idvrD
 D+mWZmAy210QKWQoiBm2qp5+An6kd215at8y7BvZKpm72HeNtzMbs+uWseSGqC16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5rD30XklWavoJhiKoLzP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy8/BreDQQF6+oXgV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="64656946"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAB1IFVaTnaiACZUcTKt+5FQY4OkRFZEPSjfa+zGWJnIKNr8dcZLT/nNtt8hO2ht29YHIn9Mff6jNisLP5In9jZz7Qwg0nf/EYFMBkgw867/WHCGRvPoBD/iJ3Rs9VhBNPGw4VZ5mhm3iaxAjlLzyEKU7VS8iMGvoT21GM37R81VLfeUzPx5ddSW+4tG9Nxn2WumnCeQu22yJzcRB12aeOQJE4tPUGsvGoiUW+23gJAHXVcbS1JdicedhlXMpjgIUk2nG0F1NAT9VTj8d+kFcgff0X7+UJK9AqKBdY2yKfJS9zTelhvf2m6X3h/I0XIf2eOCGiN1l15RNW8EKxNkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ+fCSm8D5VU+uZHrw75Nj2/sezhnaA0OYiRp42QpAc=;
 b=UQlZWqeR4O+iiK2t4iIcbgJQdWJPHbd5hfu2wtKWZ2q854+TTQjy2crAbU82ll+IHhdzUidMtbS/WNu9nbbfvyD/yXntZRPozsOSzjjZC7+fLWRw4d+iHK/JJfsAsOL0k0fPDu5k4yohU2MDhGUe3s7E96AXxYhEpE7Is5v2nmduTYuXe3KjLp8sBp72QeWiGQj6YlQPLhUa1M3YVvfcxjwsegIFYNn/PBz6WtsvkaH5Zzy7PdneSmcNvvGUWwwy3vxH+DJybSwVEaL8332JEpLpHh+kyyeeNNp2fVLIG59f7jA9hC8mFsJ9YpPM1TYQS6xAnQQUBt0r6YJbob4MMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ+fCSm8D5VU+uZHrw75Nj2/sezhnaA0OYiRp42QpAc=;
 b=ggd2z+8+SQEiNps4ecsF+2pNiRJEXJURGB4/rN+22+zopzmLWpPhPecolSYkmqStiAsD++6osPc+yjjSgE7Z7vBlGDm+PkaVRy+ghXDrxkXcvEKAfv1+tOkJhTlBZZhAlt8/8bdag0zkXLyaoJShbz8+r5BzDVkPtX7W8+kRjmI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] x86/time: use fake read_tsc()
Thread-Topic: [PATCH 1/2] x86/time: use fake read_tsc()
Thread-Index: AQHYLVxVKor9YtEUbkuWag9T3yUcNqyqf+CA
Date: Tue, 1 Mar 2022 13:07:27 +0000
Message-ID: <d1c3822e-bec1-d8ca-8954-a4942f5bb23c@citrix.com>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <f4f0e92c-9586-e021-6ad5-718628f88fcd@suse.com>
In-Reply-To: <f4f0e92c-9586-e021-6ad5-718628f88fcd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab334437-0fd9-4bde-1b36-08d9fb846fdb
x-ms-traffictypediagnostic: BLAPR03MB5378:EE_
x-microsoft-antispam-prvs: <BLAPR03MB5378BBE4780529C428ECD4FABA029@BLAPR03MB5378.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kbHfnVjUgJQOrOQrm5DltGeKT/4N4SdtG+rOgAAgyU1rFDMcOaIYHrzRx+O2GSI9yVf1VhZg8NudRhPG7IGbhTEay2PeNgYjj6n2RpEagFe8VI3gcAtT3wyZ84iaumCPUBkE7D/GQK/kTS/85MqJ3p1IQFIp+2P3vzP4C/UINq/y6bsvkUlpfRfEuo1BBhc6yoy44D36U/d90itdUl2UljmN/rUfQjJMnBrx6WlwPqJLDgd85wImfdejCbLFORRPsWWjLdy+M3VPcOReyaM/qmSVHPGleZysRG6j+xj39GjIpGPvTcqJuRT671tVD1JdwZ8fGOaa83fbJ2KoZooIkR5PJWXC/ic7yl4lo5JI69y1WfvdAPJKd3epGaJkF8IzhTkTMOTSRp3yQA7q9QgAh2DOnrVRvuDYmf3yJGPegfLmUEO51+s1BvTPdtAJrsghut0glRe+VfSd/VSwmII+uvlIosOaKN+JE13ola+/VqL16T6fEC20Ft94sZVLdO/Ar8mRN8gIt+IrhVfLLIA6ShGAxnme866lhZUq8otsrOzfW1OguMErTRy4s8ve17Le6o7vDWeiAALSyAHicmz8dQwy6dMsCLQsJsIFhwQjf19+JSaIBgfxlcC2Etj1ak3OAGU8ss7aRtIs7SOEjQ7PKNP74Zf35bqvMfLP2q0TAMJJc28OGDvzZ9VURfULko0qzEDtdwupfU+lgdSBdawzPwjFZlA9JDaEPotTsDO/wilkq009nFbXpmJv0bRyZnqF8M772FknMXhoWvnuQj/o6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(31686004)(53546011)(54906003)(110136005)(6506007)(2616005)(122000001)(82960400001)(5660300002)(86362001)(316002)(8676002)(2906002)(38070700005)(26005)(64756008)(66446008)(66476007)(66556008)(38100700002)(66946007)(31696002)(4326008)(91956017)(71200400001)(76116006)(36756003)(508600001)(186003)(6512007)(8936002)(83380400001)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlpkY1lMTmsrRUZpcUpQRnFZVHRlb0YvR1pvRlBqYUd3TjJVdnBXWHdvYzBq?=
 =?utf-8?B?Z3dkbEcvMktIRjYrM3VuMkthS2dnRGs1amU3dFV5VnBXZUlnTXJzQ0Z0WTZu?=
 =?utf-8?B?Ulg4azVvQ3R3NWxOTTNkekU4bFJ5dEpyZVR6U0xkTUtsd3JMTmlvNm5jLzZO?=
 =?utf-8?B?OVJvRXNiSzJCeExHdGN0RUplL3FhekIrRnZpV2lKejRsOEVib0pMajFWU2Fk?=
 =?utf-8?B?SEgxOUVjQ1hSNFJnUW5KN3BIdjgzYml6bVoydGp3VVQwUytjRmZvQ2RteU5Z?=
 =?utf-8?B?elZZc2pnR3Q1dksraFM3RDlRWThDTlcwYnA5SitFV3hpQ0Q2TjF5dkxMQ2dO?=
 =?utf-8?B?NGVWdmxqTERqRkpRd0N1YXlHVTlwanM0VVZ1Wlp3RVJRSTg0SWNnQW1BNHJu?=
 =?utf-8?B?dCtzWjJFK2RiSVFWUWYzVHNTUUxQVzhVd0taZnVqM2RMUmdTUXRYV2NKL2lL?=
 =?utf-8?B?eHIzd3ZqdDFpVkFUelVGV2IwenErRWljSlppTWROTVY2SGh2SkxHVUFyNGds?=
 =?utf-8?B?Tmc4bEF1SHQ5L2o3WTRXKzFMVmpZMVM1K2lpQVpPSWFVR1BUOUNUUkZkbjJ3?=
 =?utf-8?B?bEhqUWlxZnREemYvdENMREcwbDh0b1E5TzZhY3pXQ2orbXdDVHpCTW1rKzBz?=
 =?utf-8?B?K3E2REs3Z2txVkt0OWw1QVIvMkNuVWwra2Uzb1VKdHNTWThkWmhZRGY4MWJn?=
 =?utf-8?B?aGxNditacWQxT20rRlVnc3p5TVZRQjFUc1ZUV0txV2oxMzFzNUg2SHM3NWpY?=
 =?utf-8?B?YVg1bzhFQm5UZXM2ak1MNFJ2aWI4c3lnSFpTTGcrYmVmWUNpNnFJbElRaklh?=
 =?utf-8?B?ZEhUZHFDRHFKVWk3SGV1bUpoa0FtMTRqdVdKR0FXU05aUFFzT1lDcWRzVURY?=
 =?utf-8?B?WjJiT3BKKzBrVXExVFBPaE9TNmtScy9XdnpDSnVPQ21jWlJoMk1la2pGZkpG?=
 =?utf-8?B?cGpsWk1UaDVkUW5HY1c2UHVJWWxpcG1MdW5ZVWpNd1lnRmduaWliTVVSdkxu?=
 =?utf-8?B?KzR3Z09mNE56dFRFVzk2RWZOYkFwSUpKRlB0bUUzdUtBMlJvMVF2ZVh0MXFq?=
 =?utf-8?B?dFRZV0x4Mlk5Ylg0TGN2d1VPdVFMSEhwcGEvMmZqQUQybHRBalNpK0krb3RR?=
 =?utf-8?B?d2hzYWs3RlI1L2xvQWRHampkbm9nSnhRTG5CbGJBMHBVVWQvTzNSTG1xTGlu?=
 =?utf-8?B?REE0Q2RzUTkyRUZqK1ZrSHVkc0NOR2JaaHVqbUxheUMzS0RwazZNbm1pSUZU?=
 =?utf-8?B?Q0tzUzgzV2MvTUtNKzNyKzI1bnc0cVRCdjArK3JUdGlmS3dMQWZjTE9STll5?=
 =?utf-8?B?cG1VUXhYblcxQ2FmSDNMVjE5Mnc5Ky96WU8reUdIUXhmR1R3ZUw4aXpvL2hq?=
 =?utf-8?B?bkdMKzNOam1WcW5WMHozbVM2VlI4Y0FLRzR5Uk5TU0d4L3ZlbjAzNDlRMnE1?=
 =?utf-8?B?bGZBR1R0R3d0YndpVWtFbmdiRTZvZlFRT1R3aTVBZlJMaHBmUGZyWDZaTW1w?=
 =?utf-8?B?OWJqc1FlMjhEOXV5T2Y1dXdZU0dtSExwLzhtbklyclNtaUNteHhHR05SSWFl?=
 =?utf-8?B?Q0RCYmM0dEl5UG16UEdJak9iQkk4L0huekJVU1JjZWh4VUc2bTRhSm84TXlu?=
 =?utf-8?B?bml6YiszRGdlNE05aTdWMXk2aUU3RURpZ1dRT2MxYVRXNWhKbVhMVHdFT3Z4?=
 =?utf-8?B?L3pWZXhuUFloaUw5SEtheDZJY0kzL0xqOFA2dFV6S1Q1MGJmcDZwZUpzUWdJ?=
 =?utf-8?B?YVVoemp3ZHpoNUptR3RQSnFMQnZ6Z0pUSDg3TXg5Y2VMcGpXaVV1OXRCRHUx?=
 =?utf-8?B?ZlZZdjNobFpLb0FFS2t0SzdkNFBtYTJwY0hDZ2RWS0NtZ3A0alBBb1hiUWEw?=
 =?utf-8?B?ck9DeFdVYXBLM1NYNmx3Y3hIVGRwdjdkMk5YN3g4alJJMGxiM0lmMDd4SG1S?=
 =?utf-8?B?U2hvNzFVUlpQd3haZ1RwT0lLRXRYWmVTc1pKN09tMDl2QjVheTBWc29pSEgv?=
 =?utf-8?B?MG4za3R2bjFBTEJDTUVkQmlHWllaQnZwZnM2TTkvRWgxRWhVZEhEWDRNUFps?=
 =?utf-8?B?S1oyd2hmdU9yQWt1MVdNaWFUZVR3WHVydDMzTVZVQVlIV2NVaWg3RnRPWlNa?=
 =?utf-8?B?Z3gyWTBWYks1dWpLS3FET3VGamo0TFpDVlc1cmRzWXlMUnZ0WWU1STNQTldC?=
 =?utf-8?B?NWtJSi9QdEZpSXRIWC9tOTRBOVhxZmQyUTJGN05oY2k3R2ljSW1oOVIzWWdG?=
 =?utf-8?B?YXJFek9VNlFNTjFJcHpvdG5RTW1RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FC41E461015B94B866D74A8F7476A2D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab334437-0fd9-4bde-1b36-08d9fb846fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 13:07:27.9739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5Zx6hpdbQ0Te5Xmfr2Wz+FOZF6Co00ZG/p26Xf0Vl9aoHBiuGEmfLgX7n8FOk6TFbMktJAEcW8v7CWofJMrruFPvDAODV9zK6ChoOohjQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5378
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxMTowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEdvIGEgc3RlcCBmdXJ0
aGVyIHRoYW4gYmVkOWFlNTRkZjQ0ICgieDg2L3RpbWU6IHN3aXRjaCBwbGF0Zm9ybSB0aW1lcg0K
PiBob29rcyB0byBhbHRjYWxsIikgZGlkIGFuZCBlbGltaW5hdGUgdGhlICJyZWFsIiByZWFkX3Rz
YygpIGFsdG9nZXRoZXI6DQo+IEl0J3Mgbm90IHVzZWQgZXhjZXB0IGluIHBvaW50ZXIgY29tcGFy
aXNvbnMsIGFuZCBoZW5jZSBpdCBsb29rcyBvdmVyYWxsDQo+IG1vcmUgc2FmZSB0byBzaW1wbHkg
cG9pc29uIHBsdF90c2MncyByZWFkX2NvdW50ZXIgaG9vay4NCj4NCj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gSSB3YXNuJ3QgcmVhbGx5
IHN1cmUgd2hldGhlciBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIHNpbXBseSB2b2lkICogZm9y
DQo+IHRoZSB0eXBlIG9mIHRoZSBleHByZXNzaW9uLCByZXN1bHRpbmcgaW4gYW4gdW5kZXNpcmFi
bGUgZGF0YSAtPiBmdW5jdGlvbg0KPiBwb2ludGVyIGNvbnZlcnNpb24sIGJ1dCBtYWtpbmcgaXQg
aW1wb3NzaWJsZSB0byBtaXN0YWtlbmx5IHRyeSBhbmQgY2FsbA0KPiB0aGUgKGZha2UpIGZ1bmN0
aW9uIGRpcmVjdGx5Lg0KPg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jDQo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni90aW1lLmMNCj4gQEAgLTU4NSwxMCArNTg1LDEyIEBAIHN0YXRpYyBzNjQgX19p
bml0IGNmX2NoZWNrIGluaXRfdHNjKHN0cnUNCj4gICAgICByZXR1cm4gcmV0Ow0KPiAgfQ0KPiAg
DQo+IC1zdGF0aWMgdWludDY0X3QgX19pbml0IGNmX2NoZWNrIHJlYWRfdHNjKHZvaWQpDQo+IC17
DQo+IC0gICAgcmV0dXJuIHJkdHNjX29yZGVyZWQoKTsNCj4gLX0NCj4gKy8qDQo+ICsgKiBwbHRf
dHNjJ3MgcmVhZF9jb3VudGVyIGhvb2sgaXMgKGFuZCBzaG91bGQgbm90IGJlKSBpbnZva2VkIHZp
YSB0aGUgc3RydWN0DQoNCkVpdGhlciAiaXMgbm90IChhbmQgc2hvdWxkIG5vdCBiZSkiIG9yICJp
cyAoYW5kIHNob3VsZCkgbm90IGJlIi4NCg0KPiArICogZmllbGQuIFRvIGF2b2lkIGNhcnJ5aW5n
IGFuIHVudXNlZCwgaW5kaXJlY3RseSByZWFjaGFibGUgZnVuY3Rpb24sIHBvaXNvbg0KPiArICog
dGhlIGZpZWxkIHdpdGggYW4gZWFzaWx5IGlkZW50aWZpYWJsZSBub24tY2Fub25pY2FsIHBvaW50
ZXIuDQo+ICsgKi8NCj4gKyNkZWZpbmUgcmVhZF90c2MgKCh1aW50NjRfdCgqKSh2b2lkKSkweDc1
Qzc1Qzc1Qzc1Qzc1QzB1bCkNCg0KSG93IGFib3V0IHVzaW5nIFpFUk9fQkxPQ0tfUFRSP8KgIFRo
ZSBoZXggY29uc3RhbnQgMHhCQUQwLi4uIGlzIG1vcmUNCmVhc2lseSByZWNvZ25pc2FibGUsIGFu
ZCBhbnkgcG9pc29uZWQgcG9pbnRlciB3aWxsIGRvLg0KDQpUaGF0IHNhaWQuLi4gd2hhdCdzIHdy
b25nIGEgcGxhaW4gTlVMTD/CoCBJIGNhbid0IHNlZSBhbnkgbmVlZCBmb3IgYQ0KbWFnaWMgY29u
c3RhbnQgaGVyZS4NCg0KDQpPdmVyYWxsLCBJIHRoaW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIG1l
cmdlZCB3aXRoIHRoZSBzdWJzZXF1ZW50IG9uZSwNCmJlY2F1c2UgaW4gaXNvbGF0aW9uIGl0IGlz
IHNsaWdodGx5IGR1YmlvdXMuwqAgcmVhZF90c2MoKSBpcyBvbmUgb2YgdGhlDQpmZXcgZnVuY3Rp
b25zIHdoaWNoIGlzIG9mIG5vIGludGVyZXN0IHRvIGFuIGF0dGFja2VyLCBhcmNoaXRlY3R1cmFs
bHkNCihiZWNhdXNlIGl0J3MganVzdCByZHRzYykgb3Igc3BlY3VsYXRpdmVseSAoYmVjYXVzZSBp
dCBpcyBkaXNwYXRjaA0Kc2VyaWFsaXNpbmcpLg0KDQpUaGlzIGNoYW5nZSBpcyBvbmx5IChBRkFJ
Q1QpIHRvIGFsbG93IHRoZSB1c2Ugb2YgY2ZfY2xvYmJlciBsYXRlci4NCg0KfkFuZHJldw0K

